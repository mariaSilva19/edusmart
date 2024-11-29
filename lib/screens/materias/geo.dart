import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

class GeoPage extends StatefulWidget {
  const GeoPage({super.key});

  @override
  _GeoPageState createState() => _GeoPageState();
}

class _GeoPageState extends State<GeoPage> {
  List<dynamic> videoData = [];
  bool isLoading = true;  // Variável para controlar o estado de carregamento

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    final response = await http.get(
      Uri.parse('https://a4cbe45d-4755-42a7-bb7c-8a519c38281c-00-2vitw121bd8i8.picard.replit.dev/api/products/find'),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body)["produtos"];
      setState(() {
        // Filtra apenas os vídeos com a categoria "Geografia"
        videoData = data.where((produto) => produto["categoria"] == "Geografia").toList();
        isLoading = false; // Dados carregados, desativa o carregamento
      });
    } else {
      throw Exception('Erro ao carregar dados da API');
    }
  }

Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Geografia',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color.fromARGB(255, 15, 76, 126),
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
      ),
      drawer: _buildDrawer(),
      body: isLoading
          ? Center(
              child: Image.asset('assets/gif.gif',
               width: 400, height: 400), // Exibe o GIF enquanto carrega
            )
          : SingleChildScrollView(
        child: Stack(
          children: [
            Column(
              children: [
                Container(
                  color: const Color.fromARGB(255, 15, 76, 126),
                  width: double.infinity,
                  height: 200,
                ),
                Center(
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 8.0,
                      horizontal: 16.0,
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  margin: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 16),
                      Center(
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            vertical: 8.0,
                            horizontal: 16.0,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Text(
                            'Geografia',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 36,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        'Vídeos',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      // Exibe o GIF de carregamento enquanto está carregando
                      isLoading ? _buildLoading() : _buildVideoList(),
                    ],
                  ),
                ),
              ],
            ),
            Positioned(
              top: -20,
              right: -50,
              child: Image.asset(
                'assets/foton2.png',
                width: 350,
                height: 350,
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  Widget _buildDrawer() {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 15, 76, 126),
            ),
            child: Text(
              'Menu',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          _buildDrawerItem(Icons.home, 'Início', '/home'),
          _buildDrawerItem(Icons.book_online, 'Planos de Estudos', '/cronograma'),
          _buildDrawerItem(Icons.assignment_turned_in, 'Gabaritos', '/exercicios'),
          _buildDrawerItem(Icons.video_library, 'Aulas', '/materias'),
          _buildDrawerItem(Icons.account_circle, 'Área do Aluno', '/perfil'),
        ],
      ),
    );
  }

  ListTile _buildDrawerItem(IconData icon, String text, String? route) {
    return ListTile(
      leading: Icon(icon),
      title: Text(text),
      onTap: route != null
          ? () {
              Navigator.popAndPushNamed(context, route);
            }
          : null,
    );
  }

  Widget _buildVideoList() {
    List<List<dynamic>> videoChunks = _chunkVideos(videoData, 5);

    return Column(
      children: videoChunks.map((chunk) {
        return SizedBox(
          height: 190,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: chunk.length,
            itemBuilder: (context, index) {
              final video = chunk[index];
              final videoUrl = video["videoUrl"];

              return GestureDetector(
                onTap: () => _launchURL(videoUrl),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Image.network(video["imagem"]),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4.0),
                        child: Text(
                          video["nome"],
                          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        );
      }).toList(),
    );
  }

  List<List<dynamic>> _chunkVideos(List<dynamic> list, int chunkSize) {
    List<List<dynamic>> chunks = [];
    for (int i = 0; i < list.length; i += chunkSize) {
      chunks.add(list.sublist(i, i + chunkSize > list.length ? list.length : i + chunkSize));
    }
    return chunks;
  }

  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Não foi possível abrir o link $url';
    }
  }

  Widget _buildLoading() {
    // Exibe o GIF de carregamento
    return Center(
      child: Image.asset('assets/loading.gif'), // Substitua pelo seu caminho do GIF
    );
  }

  Widget _buildBottomNavigationBar() {
    return BottomNavigationBar(
      onTap: (index) {
        changePage(context, index);
      },
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.calendar_today),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.chat),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: '',
        ),
      ],
      selectedItemColor: Colors.grey,
      unselectedItemColor: Color.fromARGB(255, 174, 161, 161),
    );
  }

  void changePage(BuildContext context, int index) {
    switch (index) {
      case 0:
        Navigator.popAndPushNamed(context, '/home');
        break;
      case 1:
        Navigator.popAndPushNamed(context, '/cronograma');
        break;
      case 2:
        Navigator.popAndPushNamed(context, '/chat');
        break;
      case 3:
        Navigator.popAndPushNamed(context, '/perfil');
        break;
    }
  }
}

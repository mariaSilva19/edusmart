import 'package:flutter/material.dart';
import 'dart:convert';  // Para decodificar o JSON
import 'package:http/http.dart' as http;

class Cronograma extends StatefulWidget {
  const Cronograma({super.key});

  @override
  State<Cronograma> createState() => _CronogramaState();
}

class _CronogramaState extends State<Cronograma> {
  List<ProgressCard> progressCards = [];

  // Função para buscar os dados da API
  Future<void> fetchProgressData() async {
    final url = Uri.parse('https://05386a25-9acd-4b84-8acd-6fcbd630c722-00-t1eg5yb8e50p.janeway.replit.dev/api/progress');
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        setState(() {
          // Iterar sobre os dados retornados e criar os ProgressCards
          progressCards = (data['progressos'] as List).map((progressItem) {
            return ProgressCard(
              subject: 'Nome do Assunto', // Ajuste conforme necessário
              chapter: 'Nome do Capítulo', // Ajuste conforme necessário
              progress: (progressItem['progress'] / 100), // Progresso em decimal
            );
          }).toList();
        });
      } else {
        throw Exception('Failed to load progress data');
      }
    } catch (e) {
      print('Erro ao buscar dados de progresso: $e');
    }
  }

  @override
  void initState() {
    super.initState();
    fetchProgressData(); // Chama a função quando a tela for inicializada
  }
  void changePage(BuildContext context, int index) {
    switch (index) {
      case 0:
        Navigator.popAndPushNamed(context, '/home');
        break;
      case 1:
        Navigator.popAndPushNamed(context, '/cronograma');
        // Navegar para outra página
        break;
      case 2:
        Navigator.popAndPushNamed(context, '/chat');
        break;
      case 3:
        // Navegar para outra página
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF0F4C7E), // Cor azul da AppBar
         iconTheme: const IconThemeData(
         color: Colors.white, // Define a cor do ícone do Drawer como branco
         ),
        title: const Text('EduSmart', 
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
        centerTitle: true,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.menu), // Ícone de menu
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
      ),
            drawer: Drawer(
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
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Início'),
              onTap: () {
                // Ação ao clicar em Início
                Navigator.popAndPushNamed(context, '/home');
              },
            ),
            ListTile(
              leading: const Icon(Icons.book_online),
              title: const Text('Planos de Estudos'),
              onTap: () {
                // Ação ao clicar em Planos de Estudos
                Navigator.popAndPushNamed(context, '/cronograma');
              },
            ),
            
            ListTile(
              leading: const Icon(Icons.assignment_turned_in),
              title: const Text('Gabaritos'),
              onTap: () {
                // Ação ao clicar em Gabaritos
                Navigator.popAndPushNamed(context, '/exercicios');
              },
            ),
            ListTile(
              leading: const Icon(Icons.video_library),
              title: const Text('Aulas'),
              onTap: () {
                // Ação ao clicar em Aulas
                Navigator.popAndPushNamed(context, '/materias');
              },
            ),
            ListTile(
              leading: const Icon(Icons.account_circle),
              title: const Text('Área do Aluno'),
              onTap: () {
                // Ação ao clicar em Área do Aluno
              },
            ),
            ListTile(
              leading: const Icon(Icons.edit),
              title: const Text('Redação'),
              onTap: () {
                // Ação ao clicar em Redação
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Container azul contínuo no topo
              Container(
                height: 180, // Altura do container azul
                color: const Color(0xFF0F4C7E), // Cor azul
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20),
                    // Título Assuntos
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.0),
                      child: Text(
                        'Assuntos',
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SubjectCard('Matemática', Colors.orange),
                          SubjectCard('Geografia', Colors.blue),
                        ],
                      ),
                    ),

                    // Título Sua Programação
                    const Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 10.0),
                      child: Text(
                        'Sua Programação',
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                    ),

                    // Exibindo dados de progresso
                    ...progressCards.isNotEmpty
                        ? progressCards
                        : [
                            ProgressCard(
                              subject: 'Biologia',
                              chapter: 'Capítulo 3: Reino Animal',
                              progress: 0.7,
                            ),
                            ProgressCard(
                              subject: 'História',
                              chapter: 'Capítulo 5: Brasil Colônia',
                              progress: 0.3,
                            ),
                          ],
                  ],
                ),
              ),
            ],
          ),

          // Adicionando a imagem foton2 que se sobrepõe entre o container azul e o branco
          Positioned(
            top: -10, // Ajuste a posição vertical
            left: MediaQuery.of(context).size.width * 0.5 - 50, // Centralizar horizontalmente
            child: Image.asset(
              'assets/foton2.png',
              width: 300, // Ajuste o tamanho da imagem
              height: 300,
            ),
          ),
        ],
      ),
    ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          changePage(context, index); // Chama a função de navegação
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
        unselectedItemColor: const Color.fromARGB(255, 174, 161, 161),
      ),
    );
  }
}

class SubjectCard extends StatelessWidget {
  final String subject;
  final Color color;

  SubjectCard(this.subject, this.color);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Container(
        width: 150,
        height: 100,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Center(
          child: Text(
            subject,
            style: const TextStyle(color: Colors.white, fontSize: 18),
          ),
        ),
      ),
    );
  }
}

class ProgressCard extends StatelessWidget {
  final String subject;
  final String chapter;
  final double progress;

  ProgressCard({required this.subject, required this.chapter, required this.progress});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(subject, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            Text(chapter, style: const TextStyle(fontSize: 14, color: Colors.grey)),
            const SizedBox(height: 10),
            LinearProgressIndicator(
              value: progress,
              backgroundColor: Colors.grey[200],
              color: progress > 0.5 ? Colors.green : Colors.red,
              minHeight: 8,
            ),
          ],
        ),
      ),
    );
  }
}

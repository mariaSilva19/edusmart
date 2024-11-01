import 'package:flutter/material.dart';

class HisPage extends StatefulWidget {
  const HisPage({super.key});

  @override
  _HisPageState createState() => _HisPageState();

}
class _HisPageState extends State<HisPage> {
  int _currentRating = 0;

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
         title: const Text(
          'História',
           style: TextStyle(color: Colors.white),),
        backgroundColor: const Color.fromARGB(255, 15, 76, 126),
        iconTheme: const IconThemeData(
          color: Colors.white, // Define a cor do ícone do Drawer como branco
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
                Navigator.popAndPushNamed(context, '/home');
              },
            ),
            ListTile(
              leading: const Icon(Icons.book_online),
              title: const Text('Planos de Estudos'),
              onTap: () {
                Navigator.popAndPushNamed(context, '/cronograma');
              },
            ),
            ListTile(
              leading: const Icon(Icons.assignment_turned_in),
              title: const Text('Gabaritos'),
              onTap: () {
                Navigator.popAndPushNamed(context, '/exercicios');
              },
            ),
            ListTile(
              leading: const Icon(Icons.video_library),
              title: const Text('Aulas'),
              onTap: () {
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
              children: [
                Stack(
                  children: [
                    Container(
                      color: const Color.fromARGB(255, 15, 76, 126),
                      width: double.infinity,
                      height: 200,
                    ),
                  ],
                ),
                Center(
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 8.0,
                      horizontal: 16.0,
                    ),
                  ),
                ),
                // Container branco sobre o conteúdo azul
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white, // Cor do container branco
                  ),
                  margin: const EdgeInsets.symmetric(horizontal: 16.0), // Adiciona uma margem horizontal
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 16), // Espaçamento entre o retângulo e o próximo item

                      // Container laranja centralizado dentro do container branco
                      Center(
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            vertical: 8.0,
                            horizontal: 16.0,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.brown, // Retângulo laranja
                            borderRadius: BorderRadius.circular(12), // Arredondamento do retângulo laranja
                          ),
                          child: const Text(
                            'História',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 36,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 16), // Espaçamento após o título
                      const Text(
                        'Brasil colônia',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      _buildVideoList(), // Primeira lista de vídeos
                      const SizedBox(height: 16), // Espaçamento entre as seções
                      const Text(
                        'República Velha',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      _buildVideoList(), // Segunda lista de vídeos
                      const SizedBox(height: 16), // Espaçamento entre as seções
                      const Text(
                        'Era Vargas',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      _buildVideoList(), // Terceira lista de vídeos
                    ],
                  ),
                ),
              ],
            ),
            Positioned(
              top: -20,
              right: -50, // Ajuste para mover a imagem mais para a esquerda
              child: Image.asset(
                'assets/foton2.png',
                width: 350, // Largura da imagem
                height: 350, // Altura da imagem
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
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
        unselectedItemColor: const Color.fromARGB(255, 174, 161, 161),
      ),
    );
  }

  Widget _buildVideoList() {
    return SizedBox(
      height: 190, // Aumentei a altura do widget para permitir imagens maiores
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 4,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: ClipRRect(
                    borderRadius:
                        BorderRadius.circular(15), // Arredondamento da imagem
                    child: Image.asset(
                      'assets/historia.png',
                      fit: BoxFit.cover,
                      width: 200,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4.0),
                  child: _buildStarRating(),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildStarRating() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(5, (index) {
        return IconButton(
          iconSize: 18.0,
          icon: Icon(
            index < _currentRating ? Icons.star : Icons.star_border,
            color: Colors.yellow,
          ),
          onPressed: () {
            setState(() {
              _currentRating = index + 1;
            });
          },
        );
      }),
    );
  }
}

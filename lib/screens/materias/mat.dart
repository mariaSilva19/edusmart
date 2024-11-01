import 'package:flutter/material.dart';

class MatPage extends StatefulWidget {
  const MatPage({super.key});

  @override
  _MatPageState createState() => _MatPageState();
}

class _MatPageState extends State<MatPage> {
  // Lista de imagens para os cards (pode ser repetida para cada categoria)
  final List<List<String>> videoImages = [
    ['assets/mat.png', 'assets/mat.png', 'assets/mat.png', 'assets/mat.png'],
    ['assets/mat.png', 'assets/mat.png', 'assets/mat.png', 'assets/mat.png'],
    ['assets/mat.png', 'assets/mat.png', 'assets/mat.png', 'assets/mat.png'],
  ];

  // Lista de ratings para cada imagem por categoria
  final List<List<int>> ratings = [
    [0, 0, 0, 0], // Ratings para a primeira categoria
    [0, 0, 0, 0], // Ratings para a segunda categoria
    [0, 0, 0, 0], // Ratings para a terceira categoria
  ];

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
          'Matemática',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color.fromARGB(255, 15, 76, 126),
        iconTheme: const IconThemeData(
          color: Colors.white,
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
                // Container branco sobre o conteúdo azul
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white, // Cor do container branco
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
                            color: Colors.orange,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Text(
                            'Matemática',
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
                        'Matriz',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      _buildIndividualVideoList(0), // Primeira lista de vídeos
                      const SizedBox(height: 16),
                      const Text(
                        'Função',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      _buildIndividualVideoList(1), // Segunda lista de vídeos
                      const SizedBox(height: 16),
                      const Text(
                        'Geometria',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      _buildIndividualVideoList(2), // Terceira lista de vídeos
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

  // Método para criar uma lista individual de vídeos por categoria
  Widget _buildIndividualVideoList(int categoryIndex) {
    return SizedBox(
      height: 190,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: videoImages[categoryIndex].length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.asset(
                      videoImages[categoryIndex][index],
                      fit: BoxFit.cover,
                      width: 200,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4.0),
                  child: _buildStarRating(categoryIndex, index),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildStarRating(int categoryIndex, int videoIndex) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(5, (index) {
        return IconButton(
          iconSize: 18.0,
          icon: Icon(
            index < ratings[categoryIndex][videoIndex] ? Icons.star : Icons.star_border,
            color: Colors.yellow,
          ),
          onPressed: () {
            setState(() {
              ratings[categoryIndex][videoIndex] = index + 1;
            });
          },
        );
      }),
    );
  }
}

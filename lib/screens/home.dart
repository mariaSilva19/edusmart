import 'package:edusmart/screens/materias/bio.dart';
import 'package:edusmart/screens/materias/filo.dart';
import 'package:edusmart/screens/materias/fis.dart';
import 'package:edusmart/screens/materias/geo.dart';
import 'package:edusmart/screens/materias/his.dart';
import 'package:edusmart/screens/materias/ingle.dart';
import 'package:edusmart/screens/materias/mat.dart';
import 'package:edusmart/screens/materias/port.dart';
import 'package:edusmart/screens/materias/quim.dart';
import 'package:edusmart/screens/materias/soc.dart';
import 'package:edusmart/screens/pags/ansiedade.dart';
import 'package:edusmart/screens/pags/chat.dart';
import 'package:edusmart/screens/pags/materias.dart';
import 'package:edusmart/screens/pags/cronograma.dart';
import 'package:edusmart/screens/pags/exercicios.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  // Inicialização do índice selecionado

  // Método para atualizar o índice selecionado ao clicar em um item da BottomNavigationBar
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
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
        Navigator.popAndPushNamed(context, '/perfil');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 15, 76, 126),
        iconTheme: const IconThemeData(
          color: Colors.white, // Define a cor do ícone do Drawer como branco
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'EduSmart',
              style: TextStyle(color: Colors.white),
            ),
            Image.asset(
              'assets/foton.png',
              height: 40, // Tamanho ajustado da imagem
              width: 40,
            ),
          ],
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
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Botões de categorias
              SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      _buildCategoryButton('mat', 1, Icons.calculate,
                          const MatPage()), // Página de Matemática
                      const SizedBox(width: 10),
                      _buildCategoryButton('geo', 2, Icons.public,
                          GeoPage()), // Página de Geografia
                      const SizedBox(width: 10),
                      _buildCategoryButton('quim', 3, Icons.science,
                          QuiPage()), // Página de Química
                      const SizedBox(width: 10),
                      _buildCategoryButton('fis', 4, Icons.flash_on,
                          FisPage()), // Página de Física
                      const SizedBox(width: 10),
                      _buildCategoryButton(
                          'Bio', 5, Icons.eco, BioPage()), // Página de Biologia
                      const SizedBox(width: 10),
                      _buildCategoryButton('soc', 6, Icons.groups,
                          SocPage()), // Página de Sociologia
                      const SizedBox(width: 10),
                      _buildCategoryButton('his', 7, Icons.account_balance,
                          HisPage()), // Página de História
                      const SizedBox(width: 10),
                      _buildCategoryButton('filo', 8, Icons.psychology,
                          FiloPage()), // Página de Filosofia
                      const SizedBox(width: 10),
                      _buildCategoryButton('port', 9, Icons.library_books,
                          PortPage()), // Página de Português
                      const SizedBox(width: 10),
                      _buildCategoryButton('ing', 10, Icons.spellcheck_outlined,
                          IngPage()), // Página de Inglês
                    ],
                  )),
              const SizedBox(height: 16),

              // Seção de Aulas mais vistas
              const Text(
                'Aulas mais vistas',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    _buildPopularClassCard('assets/mat.png', 225,
                        220), // Tamanho específico para Mat
                    const SizedBox(width: 30),
                    _buildPopularClassCard('assets/soc.png', 225,
                        220), // Tamanho específico para Soc
                    const SizedBox(width: 30),
                    _buildPopularClassCard('assets/bio.png', 225,
                        220), // Tamanho específico para Bio
                  ],
                ),
              ),
              const SizedBox(height: 16),

              // Seção de chat com tutores
              const Text(
                'ENEM 2024',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Image.asset(
                'assets/enem.png',
                height: 100.0, // Tamanho ajustado da imagem do chat
                width: double.infinity,
              ),
              const SizedBox(height: 16),

              // Seção ENEM
              const Text(
                'Acesse Aqui',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              _buildEnemOption('Exercícios corrigidos', 'assets/redacao.png'),
              _buildEnemOption(
                  'Controlar a ansiedade pré prova', 'assets/debate.png'),
              _buildEnemOption('Matéria para estudo', 'assets/prof.png'),
              _buildEnemOption(
                  'Cronograma de estudos', 'assets/cronograma.png'),
              _buildEnemOption(
                  'Converse com os professores', 'assets/image.png'),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          changePage(context, index); // Chama a função de navegação
        },
        currentIndex: _selectedIndex,
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

  // ignore: avoid_types_as_parameter_names
  Widget _buildCategoryButton(String title, num, IconData icon, targetPage) {
    return InkWell(
      onTap: () {},
      child: ElevatedButton(
        onPressed: () {
          // Ação ao clicar no botão, se necessária
          if (num == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const MatPage()),
            );
          } else if (num == 2) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const GeoPage()),
            );
          } else if (num == 3) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const QuiPage()),
            );
          } else if (num == 4) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const FisPage()),
            );
          } else if (num == 5) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const BioPage()),
            );
          } else if (num == 6) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const SocPage()),
            );
          } else if (num == 7) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const HisPage()),
            );
          } else if (num == 8) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const FiloPage()),
            );
          } else if (num == 9) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const PortPage()),
            );
          } else if (num == 10) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const IngPage()),
            );
          } 
        },
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          padding: const EdgeInsets.symmetric(
              horizontal: 16, vertical: 12), // Padding ajustável
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min, // Mantém o tamanho mínimo necessário
          children: [
            Icon(icon,
                color:
                    const Color.fromARGB(255, 15, 76, 126)), // Ícone adicionado
            const SizedBox(width: 8), // Espaço entre o ícone e o texto
            Text(title,
                style: const TextStyle(
                    color: Color.fromARGB(
                        255, 15, 76, 126))), // Mantém o estilo do texto
          ],
        ),
      ),
    );
  }

  Widget _buildPopularClassCard(String imagePath, double width, double height) {
    return PopularClassCard(imagePath: imagePath, width: width, height: height);
  }

  Widget _buildEnemOption(String title, String imagePath) {
    return InkWell(
      onTap: () {
        // Definir a navegação para páginas diferentes com base no título
        if (title == 'Exercícios corrigidos') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const Exercicios()),
          );
        } else if (title == 'Controlar a ansiedade pré prova') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Ansiedade()),
          );
        } else if (title == 'Matéria para estudo') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Materia()),
          );
        } else if (title == 'Cronograma de estudos') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Cronograma()),
          );
        } else if (title == 'Converse com os professores') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ChatItem()),
          );
        }
      },
      child: Container(
        padding: const EdgeInsets.all(
            16), // Aumenta o padding para expandir o espaço
        margin: const EdgeInsets.only(bottom: 16), // Espaço entre itens
        decoration: BoxDecoration(
          color: Colors.white, // Cor de fundo do container
          borderRadius: BorderRadius.circular(10), // Bordas arredondadas
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3), // Sombra abaixo do container
            ),
          ],
        ),
        child: Row(
          children: [
            Image.asset(
              imagePath,
              width: 80, // Aumenta o tamanho da imagem
              height: 80,
              fit: BoxFit.cover,
            ),
            const SizedBox(width: 16), // Espaço entre a imagem e o texto
            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const Stack(
              alignment: Alignment.center,
              children: [
                CircleAvatar(
                  radius: 20, // Ajusta o tamanho do círculo
                  backgroundColor:
                      Color.fromARGB(255, 15, 76, 126), // Cor do círculo
                ),
                Icon(
                  Icons.arrow_forward,
                  color: Colors.white,
                  size: 20,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class PopularClassCard extends StatefulWidget {
  final String imagePath;
  final double width;
  final double height;

  const PopularClassCard(
      {required this.imagePath, required this.width, required this.height});

  @override
  _PopularClassCardState createState() => _PopularClassCardState();
}

class _PopularClassCardState extends State<PopularClassCard> {
  int _rating = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(widget.imagePath,
            width: widget.width, height: widget.height),
        Row(
          children: List.generate(5, (index) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  _rating = index +
                      1; // Atualiza a classificação com base na estrela clicada
                });
              },
              child: Icon(
                _rating > index ? Icons.star : Icons.star_border,
                color: Colors.yellow,
                size: 30,
              ),
            );
          }),
        ),
      ],
    );
  }
}

class EnemDetailScreen extends StatelessWidget {
  final String title;

  const EnemDetailScreen({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Text('Detalhes sobre $title'),
      ),
    );
  }
}
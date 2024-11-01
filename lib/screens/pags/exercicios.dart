import 'package:edusmart/screens/pags/complementos/questoes.dart';
import 'package:flutter/material.dart';

class Exercicios extends StatefulWidget {
  const Exercicios({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ExerciciosState createState() => _ExerciciosState();
}

class _ExerciciosState extends State<Exercicios> {
  // Função para trocar de página na navegação inferior
  void changePage(int index) {
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
        backgroundColor: Color.fromARGB(255, 15, 76, 126),
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
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  color: Color.fromARGB(255, 15, 76, 126),
                  child: const SizedBox(
                      height: 120.0), // Diminuir altura da parte azul
                ),
                // Espaço entre o retângulo azul e o container branco
                const SizedBox(
                    height: 40.0), // Ajuste a altura para criar mais espaço
                Container(
                  padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20.0),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 10.0,
                        offset: Offset(0, 5),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      // Seção Gabaritos Anteriores
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 12.0),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 15, 76, 126),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: const Text(
                          'Gabaritos Anteriores',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      // Conteúdo do container branco
                      GridView.count(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        crossAxisCount: 2,
                        crossAxisSpacing: 16.0,
                        mainAxisSpacing: 16.0,
                        childAspectRatio: 3 / 2,
                        children: [
                          _buildYearButton('2023', '1ª Aplicação'),
                          _buildYearButton('2022', '1ª Aplicação'),
                          _buildYearButton('2021', '1ª Aplicação'),
                          _buildYearButton('2020', '1ª Aplicação'),
                          _buildYearButton('2020', 'DIGITAL'),
                          _buildYearButton('2019', '1ª Aplicação'),
                          _buildYearButton('2018', '1ª Aplicação'),
                          _buildYearButton('2017', '1ª Aplicação'),
                          _buildYearButton('2016', '1ª Aplicação'),
                          _buildYearButton('2016', '2ª Aplicação'),
                          _buildYearButton('2015', '1ª Aplicação'),
                          _buildYearButton('2015', '2ª Aplicação'),
                        ],
                      ),
                      const SizedBox(height: 16),
                    ],
                  ),
                ),
              ],
            ),
            Positioned(
              top:
                  -40, // Mantenha o valor ou ajuste conforme necessário para vertical
              right:
                  10, // Diminua o valor para mover a imagem mais para a direita
              child: Image.asset(
                'assets/foton2.png',
                width: 300, // Largura da imagem
                height: 300, // Altura da imagem
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: changePage,
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
            icon: Icon(Icons.settings),
            label: '',
          ),
        ],
        selectedItemColor: const Color.fromARGB(255, 15, 76, 126),
        unselectedItemColor: Colors.grey,
        showSelectedLabels: false,
        showUnselectedLabels: false,
      ),
    );
  }

  Widget _buildYearButton(String year, String application) {
    return ElevatedButton(
      onPressed: () {
        // Navega para a página de questões e passa os parâmetros diretamente no construtor
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const Questoes()),
        );
      },
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 6.0, vertical: 10.0),
        backgroundColor: Colors.white,
        foregroundColor: const Color.fromARGB(255, 15, 76, 126),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
          side: const BorderSide(
              color: Color.fromARGB(255, 15, 76, 126), width: 1.5),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            application,
            style: const TextStyle(fontSize: 14.0),
          ),
          const SizedBox(height: 4),
          Text(
            year,
            style: const TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          const Icon(Icons.arrow_forward, size: 16),
        ],
      ),
    );
  }

  questoes() {}
}

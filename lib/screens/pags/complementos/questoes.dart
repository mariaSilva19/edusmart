import 'package:flutter/material.dart';

class Questoes extends StatelessWidget {
  const Questoes({super.key});

  // Método para trocar de página
  void changePage(BuildContext context, int index) {
    switch (index) {
      case 0:
        Navigator.popAndPushNamed(context, '/home');  // Certifique-se de que a rota '/home' está definida
        break;
      case 1:
        Navigator.popAndPushNamed(context, '/cronograma');
        break;
      case 2:
        Navigator.popAndPushNamed(context, '/chat');
        break;
      case 3:
        // Adicione navegação ou funcionalidade aqui para outra página
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF0F4C7E),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Image.asset('assets/foton2.png', width: 50), // Verifique o caminho da imagem
          ),
        ],
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(
              child: Text(
                "",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 20),

            // Quadrado azul adicionado acima do cartão verde
            Container(
              width: double.infinity, // Preencher a largura da tela
              height: 50, // Altura do quadrado azul
              decoration: BoxDecoration(
                color: Color(0xFF0F4C7E), // Cor do quadrado azul
                borderRadius: BorderRadius.circular(8), // Bordas arredondadas
              ),
              child: const Center(
                child: Text(
                  'Questões ENEM',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 10),

            Expanded(
              child: ListView(
                children: [
                  _buildQuestionCard('Questão 01', 'O filme Como estrellas en la tierra aborda o tema da dislexia. Relacionando o cartaz do filme com...', Colors.green),
                  const SizedBox(height: 10),
                  _buildQuestionCard('Questão 02', 'Para enfatizar características e atitudes que reforçam a identidade da mulher negra, o poema...', Colors.yellow),
                  const SizedBox(height: 10),
                  _buildQuestionCard('Questão 03', 'Do povoado do Ão, ou dos sítios perto, alguém precisava urgente de querer vir por escutar a novela do rádio...', const Color.fromARGB(255, 255, 118, 59)),
                  const SizedBox(height: 10),
                  _buildQuestionCard('Questão 04', 'Para enfatizar características e atitudes que reforçam a identidade da mulher negra, o poema...', const Color.fromARGB(255, 255, 59, 213)),
                  const SizedBox(height: 10),
                  _buildQuestionCard('Questão 05', 'Para enfatizar características e atitudes que reforçam a identidade da mulher negra, o poema...', Color.fromARGB(255, 121, 255, 59)),
                  const SizedBox(height: 10),
                  _buildQuestionCard('Questão 06', 'Para enfatizar características e atitudes que reforçam a identidade da mulher negra, o poema...', Color.fromARGB(255, 79, 59, 255)),
                  const SizedBox(height: 10),
                  _buildQuestionCard('Questão 07', 'Para enfatizar características e atitudes que reforçam a identidade da mulher negra, o poema...', Color.fromARGB(255, 255, 59, 82)),
                  const SizedBox(height: 10),
                  _buildQuestionCard('Questão 08', 'Para enfatizar características e atitudes que reforçam a identidade da mulher negra, o poema...', Color.fromARGB(255, 255, 79, 59)),
                  const SizedBox(height: 10),
                  _buildQuestionCard('Questão 09', 'Para enfatizar características e atitudes que reforçam a identidade da mulher negra, o poema...', const Color.fromARGB(255, 255, 59, 213)),
                  const SizedBox(height: 10),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          changePage(context, index);  // Chamar a função de mudança de página
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
      ),
    );
  }

  // Widget para criar cada cartão de questão com uma borda preta
  Widget _buildQuestionCard(String title, String description, Color color) {
    return Card(
      color: color,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8), // Arredondar as bordas
        side: const BorderSide(color: Colors.black, width: 2), // Borda preta de 2 pixels
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    description,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.black54,
                    ),
                  ),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {
                // Implementar ação para o botão
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 12, 70, 118),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: const Text(
                'Ver questão',
                style: TextStyle(color: Color.fromARGB(255, 255, 253, 253)), // Cor branca no texto
              ),
            ),
          ],
        ),
      ),
    );
  }
}

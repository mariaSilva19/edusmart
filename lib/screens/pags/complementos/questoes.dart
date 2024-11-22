import 'package:flutter/material.dart';

class Questoes extends StatefulWidget {
  const Questoes({super.key});

  @override
  _QuestoesState createState() => _QuestoesState();
}

class _QuestoesState extends State<Questoes> {
  final Map<String, int?> selectedOptions = {};
  final Map<String, bool?> isCorrectAnswers = {};
  final Map<String, int> correctAnswers = {
    'Questão 01': 1,
    'Questão 02': 1,
    'Questão 03': 2,
    'Questão 04': 2,
    'Questão 05': 1,
    'Questão 06': 0,
    'Questão 07': 3,
    'Questão 08': 2,
    'Questão 09': 3,
    'Questão 10': 2,
    'Questão 11': 0,
  };

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
            child: Image.asset('assets/foton2.png', width: 50),
          ),
        ],
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            // Positioned Image
            // Main Content
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  height: 150,
                  color: const Color(0xFF0F4C7E),
                ),
                const SizedBox(height: 40), // Espaço extra entre o azul e o branco
                Container(
                  padding: const EdgeInsets.all(16.0),
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Container(
                        height: 50,
                        decoration: BoxDecoration(
                          color: const Color(0xFF0F4C7E),
                          borderRadius: BorderRadius.circular(8),
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
                      const SizedBox(height: 20),
                      _buildQuestionCard(
                        'Questão 01',
                        'Qual é o principal responsável pelo aquecimento global?',
                        ['A) Deforestation', 'B) Emissão de gases do efeito estufa', 'C) Poluição do solo', 'D) Destruição de habitats'],
                      ),
                      const SizedBox(height: 10),
                      _buildQuestionCard(
                        'Questão 02',
                        'O que caracteriza uma reação de neutralização? ',
                        ['A) Liberação de gás"', 'B)Formação de água e sal', 'C) Quebra de ligações covalentes', 'D) Liberação de calor'],
                      ),
                      const SizedBox(height: 10),
                        _buildQuestionCard(
                        'Questão 03',
                        'Quem foi o responsável pela unificação da Alemanha no século XIX? ',
                        ['A) Napoleão Bonaparte ', 'B)  Adolf Hitler', 'C) Otto von Bismarck', 'D) Karl Marx '],
                      ),
                      const SizedBox(height: 10),
                        _buildQuestionCard(
                        'Questão 04',
                        'Qual estrutura celular é responsável pela produção de energia nas células eucarióticas? ',
                        ['A) Núcleo', 'B)  Ribossomos', 'C) Mitocôndrias', 'D) Lisossomos'],
                      ),
                      const SizedBox(height: 10),
                        _buildQuestionCard(
                        'Questão 05',
                        'A força gravitacional entre dois corpos depende de qual fator?',
                        ['A) Da cor dos corpos', 'B)  Da distância entre eles', 'C) Do tamanho dos corpos', 'D) Da composição química dos corpos'],
                      ),
                      const SizedBox(height: 10),
                        _buildQuestionCard(
                        'Questão 06',
                        'Assinale a alternativa que apresenta um exemplo de oração subordinada adjetiva: ',
                        ['A)O livro que comprei é interessante.', 'B) O livro é interessante.', 'C) Comprei um livro ontem.', 'D)  Eu gosto de ler livros.'],
                      ),
                      const SizedBox(height: 10),
                        _buildQuestionCard(
                        'Questão 07',
                        'O que é o fenômeno El Niño? ',
                        ['A)  Um tipo de furacão tropical ', 'B) Um evento que causa terremotos no Japão', 'C) Um deslizamento de terra no Sudeste Asiático', 'D) Uma corrente de águas quentes no Oceano Pacífico'],
                      ),
                      const SizedBox(height: 10),
                        _buildQuestionCard(
                        'Questão 08',
                        'O que caracteriza uma solução aquosa de ácido clorídrico (HCl)?',
                        ['A) pH neutro ', 'B) pH acima de 7', 'C) pH abaixo de 7', 'D) Não altera o pH'],
                      ),
                      const SizedBox(height: 10),
                        _buildQuestionCard(
                        'Questão 09',
                        'O que foi o Tratado de Versailles de 1919? ',
                        ['A) Um acordo que pôs fim à Guerra Civil Americana', 'B)Um acordo entre Brasil e Portugal sobre a exploração de recursos naturais', 'C) Um tratado que unificou os estados italianos', 'D) Um tratado de paz após a Primeira Guerra Mundial'],
                      ),
                      const SizedBox(height: 10),
                        _buildQuestionCard(
                        'Questão 10',
                        'Qual é a principal função dos glóbulos vermelhos no sangue?',
                        ['A) Defesa contra infecções', 'B) Coagulação do sangue', 'C) Transporte de oxigênio', 'D) Transporte de nutrientes'],
                      ),
                      const SizedBox(height: 10),
                        _buildQuestionCard(
                        'Questão 11',
                        'Qual é a unidade de medida da intensidade da corrente elétrica?',
                        ['A)Ampére', 'B) Volt', 'C) Ohm', 'D) Watt'],
                      ),
                      const SizedBox(height: 10),

                    ],
                    
                  ),
                ),
              ],
            ),
            Positioned(
              left: 10,
              top: 10,
              child: Image.asset(
                'assets/foton.png',
                width: 300,
                height: 300,
              ),
            )
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
        unselectedItemColor: Color.fromARGB(255, 174, 161, 161),
      ),
    );
  }

  Widget _buildQuestionCard(
      String title, String description, List<String> options) {
    return Card(
      color: const Color(0xFF0F4C7E),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
        side: const BorderSide(color: Colors.black, width: 2),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              description,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.white70,
              ),
            ),
            const SizedBox(height: 20),
            Column(
              children: options.asMap().entries.map((entry) {
                int idx = entry.key;
                String option = entry.value;

                Color textColor = Colors.black;
                if (selectedOptions[title] == idx) {
                  textColor = isCorrectAnswers[title] == true
                      ? Colors.green
                      : Colors.red;
                }

                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4.0),
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        selectedOptions[title] = idx;
                        isCorrectAnswers[title] = correctAnswers[title] == idx;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      side: BorderSide(color: Colors.black12),
                    ),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        option,
                        style: TextStyle(
                          color: textColor,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}

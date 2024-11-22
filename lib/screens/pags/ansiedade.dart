import 'package:flutter/material.dart';

class Ansiedade extends StatelessWidget {
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
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFF0F4C7E),
          iconTheme: const IconThemeData(color: Colors.white),
          title: const Text(
            'EduSmart',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: const Icon(Icons.menu),
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
            ],
          ),
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.zero,
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    color: const Color(0xFF0F4C7E),
                    height: 120.0,
                  ),
                  const SizedBox(height: 40.0),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.9,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 106, 106, 145),
                        borderRadius: BorderRadius.circular(10.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            spreadRadius: 1,
                            blurRadius: 5,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      padding: const EdgeInsets.symmetric(
                          vertical: 12.0, horizontal: 16.0),
                      child: const Center(
                        child: Text(
                          '5 dicas para você',
                          style: TextStyle(
                            color: Color.fromRGBO(255, 255, 255, 1),
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Image.asset(
                        'assets/ansiedade.png',
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 32.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'A ansiedade é usada pelo nosso corpo para identificar uma situação de risco que se aproxima. Esse mecanismo foi essencial para a sobrevivência dos nossos antecessores. Hoje, não temos que enfrentar tantos perigos como no passado, mas a ansiedade ainda nos atormenta em algumas situações, como o Enem e outros vestibulares. Mas calma, é possível superar a ansiedade antes das provas. Confira abaixo algumas dicas e prepare-se.',
                          style: TextStyle(
                            fontSize: 20,
                            height: 1.5,
                          ),
                        ),
                        SizedBox(height: 16),
                        Text(
                          '1 – Reconheça a ansiedade',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'A primeira coisa a se fazer para controlar o nervosismo é exatamente perceber que você está em um momento de ansiedade. Muitas vezes isso passa batido e quando você vai ver, já está em pânico. Por exemplo: tudo começou apenas com uma questão de matemática muito difícil de resolver. Depois, as mãos começam a suar, suas pernas ficam inquietas, você começa a roer a unha… Eis um quadro típico de ansiedade.',
                          style: TextStyle(
                            fontSize: 20,
                            height: 1.5,
                          ),
                        ),
                        SizedBox(height: 16),
                        Text(
                          '2 – Planeje seu trajeto',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'O ser humano se sente muito mais seguro quando enfrenta uma situação a que já está familiarizado. Para evitar imprevistos, visite o local de prova antes do dia do vestibular, principalmente se você nunca ouviu falar do endereço. Pergunte-se: “Como eu faço para chegar lá? Meus pais vão me levar? Vou de ônibus, metrô, trem?”. Veja quanto tempo leva para chegar ao destino e calcule a sua rota. Assim, no dia da prova você já vai saber que horas precisará sair de casa para não se atrasar.',
                          style: TextStyle(
                            fontSize: 20,
                            height: 1.5,
                          ),
                        ),
                        SizedBox(height: 16),
                        Text(
                          '3 – Antes da prova',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Não vale a pena estudar na véspera do exame. Você acaba dando ao corpo um sinal de que não está preparado o suficiente, gerando ainda mais ansiedade. Por isso, confie no seu desempenho durante o ano. Agora é hora de relaxar. Convide seus amigos para assistir a um filme em casa ou passe um tempo com a sua família. Tente se esquecer da prova – por mais difícil que isso seja – pelo menos por alguns momentos.',
                          style: TextStyle(
                            fontSize: 20,
                            height: 1.5,
                          ),
                        ),
                        SizedBox(height: 16),
                        Text(
                          '4 – Na hora da prova',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Não pense sobre os seus concorrentes. A ansiedade pode aumentar quando os estudantes começam a sair antes de você da sala, mas não se preocupe. Quando isso acontecer, pense: “estou aproveitando meu tempo melhor do que eles” e continue sua prova. Afinal, ninguém está disputando corrida.',
                          style: TextStyle(
                            fontSize: 20,
                            height: 1.5,
                          ),
                        ),
                        SizedBox(height: 16),
                        Text(
                          '5 – Respire bem',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Você seguiu todas as nossas dicas e mesmo assim ainda sente que vai ter um ataque de ansiedade a qualquer momento? Calma! É possível reestabelecer a calma com exercícios de respiração. Dá pra fazer em qualquer lugar, de pé ou sentado.',
                          style: TextStyle(
                            fontSize: 20,
                            height: 1.5,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Positioned(
                top: -70,
                right: 5,
                child: Image.asset(
                  'assets/foton2.png',
                  width: 300,
                  height: 300,
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
      ),
    );
  }
}

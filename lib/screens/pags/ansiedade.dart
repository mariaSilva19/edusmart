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
        padding: EdgeInsets.zero,
        child: Stack(children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                color: const Color(0xFF0F4C7E), // Cor azul do espaço
                height: 120.0, // Altura do espaço azul
              ),
              const SizedBox(
                  height:
                      40.0), // Espaço adicional entre a parte azul e o próximo Container
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Container(
                  width: MediaQuery.of(context).size.width *
                      0.9, // Reduz a largura do Container para 90% da tela
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(
                        255, 106, 106, 145), // Cor branca do quadrado
                    borderRadius:
                        BorderRadius.circular(10.0), // Borda arredondada
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        spreadRadius: 1,
                        blurRadius: 5,
                        offset: const Offset(0, 3), // Muda a posição da sombra
                      ),
                    ],
                  ),
                  padding: const EdgeInsets.symmetric(
                      vertical: 12.0,
                      horizontal: 16.0), // Diminui o padding interno
                  child: const Center(
                    child: Text(
                      '5 dicas para você',
                      style: TextStyle(
                        color: Color.fromRGBO(
                            255, 255, 255, 1), // Cor do texto ajustada
                        fontSize: 20, // Tamanho da fonte
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30), // Espaço entre o Container e a imagem
              ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Image.asset(
                  'assets/ansiedade.png', // Caminho correto para a imagem
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 10),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'A ansiedade é usada pelo nosso corpo para identificar uma situação de risco que se aproxima. Esse mecanismo foi essencial para a sobrevivência dos nossos antecessores. Hoje, não temos que enfrentar tantos perigos como no passado, mas a ansiedade ainda nos atormenta em algumas situações, como o Enem e outros vestibulares. Mas calma, é possível superar a ansiedade antes das provas. Confira abaixo algumas dicas e prepare-se.',
                      style: TextStyle(
                        fontSize: 16,
                        height: 1.5,
                      ),
                    ),
                    SizedBox(height: 16),
                    Text(
                      '1 – Reconheça a ansiedade',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'A primeira coisa a se fazer para controlar o nervosismo é exatamente perceber que você está em um momento de ansiedade. Muitas vezes isso passa batido e quando você vai ver, já está em pânico. Por exemplo: tudo começou apenas com uma questão de matemática muito difícil de resolver. Depois, as mãos começam a suar, suas pernas ficam inquietas, você começa a roer a unha… Eis um quadro típico de ansiedade.\n\nExistem outros sintomas que podem ser observados para identificar o nervosismo: tremores, tontura, boca seca, taquicardia, gagueira, sensação de sufocamento, sentir-se imobilizado, ficar com braços rígidos, entre outros. Ao perceber qualquer um deles é hora de parar e respirar fundo.',
                      style: TextStyle(
                        fontSize: 16,
                        height: 1.5,
                      ),
                    ),
                    SizedBox(height: 16),
                    Text(
                      '2 – Planeje seu trajeto',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'O ser humano se sente muito mais seguro quando enfrenta uma situação a que já está familiarizado. Para evitar imprevistos, visite o local de prova antes do dia do vestibular, principalmente se você nunca ouviu falar do endereço. Pergunte-se: “Como eu faço para chegar lá? Meus pais vão me levar? Vou de ônibus, metrô, trem?”. Veja quanto tempo leva para chegar ao destino e calcule a sua rota. Assim, no dia da prova você já vai saber que horas precisará sair de casa para não se atrasar.',
                      style: TextStyle(
                        fontSize: 16,
                        height: 1.5,
                      ),
                    ),
                    SizedBox(height: 16),
                    Text(
                      '3 – Antes da prova',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Não vale a pena estudar na véspera do exame. Você acaba dando ao corpo um sinal de que não está preparado o suficiente, gerando ainda mais ansiedade. Por isso, confie no seu desempenho durante o ano. Agora é hora de relaxar. Convide seus amigos para assistir a um filme em casa ou passe um tempo com a sua família. Tente se esquecer da prova – por mais difícil que isso seja – pelo menos por alguns momentos.',
                      style: TextStyle(
                        fontSize: 16,
                        height: 1.5,
                      ),
                    ),
                    SizedBox(height: 16),
                    Text(
                      '4 – Na hora da prova',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Não pense sobre os seus concorrentes. Ninguém aqui tem bola de cristal, então não dá para saber se quem está sentado do seu lado vai ir melhor ou pior do que você. A ansiedade pode aumentar quando os estudantes começam a sair antes de você da sala, mas não se preocupe. Quando isso acontecer, pense: “estou aproveitando meu tempo melhor do que eles” e continue sua prova. Afinal, ninguém está disputando corrida.\n\nDeixe as questões mais difíceis para o fim. É preciso saber gerenciar o tempo para não ser pego de surpresa no final. Caso o tempo esteja acabando, pelo menos você já garantiu as questões mais fáceis. Além disso, o estresse de ficar pensando muito em apenas uma pergunta pode atrapalhar você.\n\nEstá em dúvida entre duas alternativas? Pare e responda a essa questão depois para você ter tempo de pensar melhor na resposta. A ansiedade pode atrapalhar o seu julgamento na hora.',
                      style: TextStyle(
                        fontSize: 16,
                        height: 1.5,
                      ),
                    ),
                    SizedBox(height: 16),
                    Text(
                      '5 – Respire bem',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Você seguiu todas as nossas dicas e mesmo assim ainda sente que vai ter um ataque de ansiedade a qualquer momento? Calma! É possível reestabelecer a calma com exercícios de respiração. Dá pra fazer em qualquer lugar, de pé ou sentado (até mesmo durante a prova).\n\nInspire o ar até você conseguir ver sua barriga se movimentando e depois, expire devagar. Repita algumas vezes, até perceber que você está melhor. Esse tipo de respiração, pelo diafragma, é capaz de aproveitar melhor a capacidade dos pulmões. Ela permite que você receba até sete vezes mais oxigênio do que na respiração torácica, fazendo com que o seu cérebro trabalhe melhor.',
                      style: TextStyle(
                        fontSize: 16,
                        height: 1.5,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            top:
                -70, // Mantenha o valor ou ajuste conforme necessário para vertical
            right: 5, // Diminua o valor para mover a imagem mais para a direita
            child: Image.asset(
              'assets/foton2.png',
              width: 300, // Largura da imagem
              height: 300, // Altura da imagem
            ),
          ),
        ]),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          changePage(context, index); // Chamar a função de mudança de página
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

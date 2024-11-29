import 'package:flutter/material.dart';
import 'dart:convert'; // Para decodificar o JSON
import 'package:http/http.dart' as http;

class Cronograma extends StatefulWidget {
  const Cronograma({super.key});

  @override
  State<Cronograma> createState() => _CronogramaState();
}

class _CronogramaState extends State<Cronograma> {
  List<ProgressCard> progressCards = [];

  Future<void> fetchProgressData() async {
    final url = Uri.parse(
        'https://a4cbe45d-4755-42a7-bb7c-8a519c38281c-00-2vitw121bd8i8.picard.replit.dev/progress');
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        setState(() {
          // Iterar sobre os dados retornados e criar os ProgressCards
          progressCards = (data['progressos'] as List)
              .take(3) // Pegando somente os três primeiros progressos
              .map((progressItem) {
            return ProgressCard(
              subject: progressItem['subject'] ?? 'Assunto',
              progress: (progressItem['progress'] ?? 0) / 100,
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
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        title: const Text('EduSmart',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
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
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 180,
                  color: const Color(0xFF0F4C7E),
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
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.0),
                        child: Text(
                          'Assuntos',
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              const SizedBox(width: 16), // Espaço antes do primeiro card
                              SubjectCard('Matemática', Colors.orange),
                              const SizedBox(width: 10),
                              SubjectCard('Geografia', Colors.blue),
                              const SizedBox(width: 10),
                              SubjectCard('Biologia', Colors.green),
                              const SizedBox(width: 10),
                              SubjectCard('História', Colors.purple),
                              const SizedBox(width: 10),
                              SubjectCard('Física', Colors.red),
                              const SizedBox(width: 10),
                              SubjectCard('Química', Colors.cyan),
                              const SizedBox(width: 16), // Espaço depois do último card
                            ],
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 16.0, vertical: 10.0),
                        child: Text(
                          'Sua Programação',
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Column(
                          children: progressCards.isNotEmpty
                              ? progressCards
                              : [
                                  ProgressCard(
                                      subject: 'Biologia', progress: 0.7),
                                  ProgressCard(
                                      subject: 'História', progress: 0.3),
                                  ProgressCard(subject: 'Física', progress: 0.5),
                                ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Positioned(
              top: -10,
              left: MediaQuery.of(context).size.width * 0.5 - 50,
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
        width: 100,
        height: 80,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Center(
          child: Text(
            subject,
            style: const TextStyle(color: Colors.white, fontSize: 14),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}

class ProgressCard extends StatelessWidget {
  final String subject;
  final double progress;

  ProgressCard({required this.subject, required this.progress});

  @override
  Widget build(BuildContext context) {
    Color lineColor = progress < 0.5
        ? Colors.red
        : progress > 0.6
            ? Colors.green
            : Colors.green;

    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: Text(
                subject,
                style: const TextStyle(fontSize: 18),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              flex: 5,
              child: Container(
                height: 6,
                color: lineColor,
                width: MediaQuery.of(context).size.width * progress,
              ),
            ),
            const SizedBox(width: 10),
            Text(
              '${(progress * 100).toStringAsFixed(0)}%',
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}

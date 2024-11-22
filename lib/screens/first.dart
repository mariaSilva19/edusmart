import 'package:flutter/material.dart';

class First extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey[100],
        body: Column(
          children: [
            // Espaço para a imagem e título no topo
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 32),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0,50,0,0),
                child: Image.asset(
                  'assets/tarta2.png',
                  width: 300, // Tamanho da imagem
                  height: 300,
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Preenchendo o espaço restante
            const Spacer(),

            // Espaço antes do container azul
            const SizedBox(height: 32),

            // Container azul ampliado com bordas arredondadas
            Container(
              width: double.infinity,
              height: 450, // Altura aumentada do container azul
              padding: const EdgeInsets.all(24), // Padding aumentada
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 50, 99, 140),
                borderRadius: BorderRadius.circular(30), // Aumentei o arredondamento
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Bem-vindo!',
                    style: TextStyle(
                      fontFamily: "Roboto",
                      fontSize: 40, // Aumentei o tamanho do texto
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 234, 237, 240),
                    ),
                  ),
                  const SizedBox(height: 24),
                  const Text(
                    'Cada página estudada é um passo mais perto dos seus sonhos. Persistir é vencer. Com dedicação, você alcança seus objetivos e transforma seu futuro!',
                    style: TextStyle(
                      fontSize:21, // Aumento do tamanho da frase
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 32), // Aumento do espaçamento entre os textos

                  // Aumentando o espaçamento antes dos botões
                  const SizedBox(height: 48), // Aumentei o espaçamento entre os textos e os botões

                  // Botões na parte inferior do container
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center, // Alinhando os botões ao centro
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 50, // Aumentei o padding horizontal
                            vertical: 24, // Aumentei o padding vertical
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15), // Arredondamento mais suave
                          ),
                        ),
                        onPressed: () {
                          Navigator.popAndPushNamed(context, '/register');
                        },
                        child: const Text(
                          'Cadastre-se',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20, // Aumentei o tamanho da fonte do botão
                          ),
                        ),
                      ),
                      const SizedBox(width: 16), // Aumentei o espaço entre os botões
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 50, // Aumentei o padding horizontal
                            vertical: 24, // Aumentei o padding vertical
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15), // Arredondamento mais suave
                          ),
                        ),
                        onPressed: () {
                          Navigator.popAndPushNamed(context, '/login');
                        },
                        child: const Text(
                          'Entrar',
                          style: TextStyle(
                            color: Colors.black, // Texto preto no botão "Entrar"
                            fontSize: 20, // Aumentei o tamanho da fonte do botão
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

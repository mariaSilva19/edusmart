import 'package:edusmart/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ChatItem extends StatefulWidget {
  @override
  _ChatItemState createState() => _ChatItemState();
}

class _ChatItemState extends State<ChatItem> {
  final TextEditingController _messageController = TextEditingController();
  List<String> _messages = [];

  // Função para enviar mensagem para a API
  Future<void> _sendMessage() async {
    String message = _messageController.text;

    if (message.isNotEmpty) {
      // Adiciona a mensagem do usuário à lista
      setState(() {
        _messages.add('Você: $message');
      });

      // Limpa o campo de texto
      _messageController.clear();

      try {
        // Envia a mensagem para a API
        var response = await http
            .post(
              Uri.parse('https://c55023c1-63fe-4aa0-aff2-9acc396c9f9c-00-26z23t0h0ej8o.worf.replit.dev/chat'),
              headers: {'Content-Type': 'application/json'},
              body: jsonEncode({'user': 'Ester', 'message': message}),
            )
            .timeout(const Duration(seconds: 10)); // Timeout de 10 segundos

        // Exibe código de status e corpo da resposta para diagnóstico
        print('Status Code: ${response.statusCode}');
        print('Response Body: ${response.body}');

        // Verifica a resposta da API
        if (response.statusCode == 200) {
          try {
            var data = jsonDecode(response.body);
            // Verifica se a estrutura da resposta está correta
            String botMessage = data['botMessage']['message'] ?? 'Resposta não encontrada.';
            setState(() {
              _messages.add('Bot: $botMessage');
            });
          } catch (e) {
            setState(() {
              _messages.add('Bot: Erro ao processar a resposta da API.');
            });
          }
        } else {
          setState(() {
            _messages.add('Bot: Desculpe, houve um erro ao enviar a mensagem. Código: ${response.statusCode}');
          });
        }
      } catch (e) {
        // Exibe erro de conexão
        setState(() {
          _messages.add('Bot: Desculpe, houve um erro na conexão: $e');
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF0F4C7E),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => HomeScreen()),
            );
          },
        ),
        title: const Row(
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage('assets/foton2.png'), // Substitua pela imagem correta
            ),
            SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'MR turtle',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Online',
                  style: TextStyle(
                    color: Colors.blueAccent,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          // Exibe as mensagens
          Expanded(
            child: Container(
              color: Colors.white,
              child: ListView.builder(
                itemCount: _messages.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Align(
                      alignment: index % 2 == 0 ? Alignment.centerRight : Alignment.centerLeft,
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: index % 2 == 0 ? Color(0xFF0F4C7E) : Colors.grey[300],
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          _messages[index],
                          style: TextStyle(color: index % 2 == 0 ? Colors.white : Colors.black),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          // Campo de entrada de mensagem
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _messageController,
                    decoration: InputDecoration(
                      hintText: 'Digite sua mensagem...',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      contentPadding: EdgeInsets.symmetric(horizontal: 20),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: _sendMessage,
                  style: ElevatedButton.styleFrom(
                    shape: CircleBorder(),
                    padding: EdgeInsets.all(14),
                    backgroundColor: Color.fromARGB(255, 15, 76, 126),
                    foregroundColor: Colors.white,
                  ),
                  child: Icon(Icons.send),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

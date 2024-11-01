import 'package:edusmart/screens/home.dart';
import 'package:flutter/material.dart';

class ChatItem extends StatefulWidget {
  @override
  _ChatItemState createState() => _ChatItemState();
}

class _ChatItemState extends State<ChatItem> {
  // Controlador para o campo de texto
  final TextEditingController _messageController = TextEditingController();

  // Lista de mensagens
  List<String> _messages = [];

  // Função para enviar mensagem
  void _sendMessage() {
    // Pegamos o texto digitado
    String message = _messageController.text;

    if (message.isNotEmpty) {
      // Adicionamos a mensagem à lista
      setState(() {
        _messages.add(message);
      });

      // Limpa o campo de texto
      _messageController.clear();
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
              backgroundImage:
                  NetworkImage('assets/foton2.png'), // Substitua pela imagem correta
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
              color: Colors.white, // Cor de fundo branca para o chat
              child: ListView.builder(
                itemCount: _messages.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Align(
                      alignment: Alignment.centerRight,
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Color(0xFF0F4C7E),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          _messages[index],
                          style: TextStyle(color: Colors.white),
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
                  onPressed: _sendMessage, // Chama a função para enviar mensagem
                  style: ElevatedButton.styleFrom(
                    shape: CircleBorder(),
                    padding: EdgeInsets.all(14),
                    backgroundColor: Color.fromARGB(255, 15, 76, 126), // Cor de fundo do botão
                    foregroundColor: Colors.white, // Cor do ícone do botão
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

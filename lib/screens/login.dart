import 'package:edusmart/controllers/authProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class LoginScreen extends StatelessWidget{
  final _emailController  = TextEditingController();
  final _passwordController = TextEditingController();

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
   return Scaffold(
   body: Container(
    color: Color.fromARGB(255, 15, 76, 126), // Fundo azul
    child: Center(
      child: Stack(
        clipBehavior: Clip.none, // Permite que a imagem saia para fora do Container
        children: [
          Container(
            margin: const EdgeInsets.only(
              top: 50.0,  // Cria um espaço para que o Container fique um pouco abaixo da imagem
              left: 16.0, // Espaço de um dedo à esquerda
              right: 16.0, // Espaço de um dedo à direita
              bottom: 8.0, // Espaço menor na parte inferior
            ),
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: Colors.white, // Fundo branco do Container
              borderRadius: BorderRadius.circular(16.0), // Bordas arredondadas
            ),
            constraints: const BoxConstraints(
              minHeight: 550, // Altura mínima do Container
              maxWidth: 350, // Largura máxima do Container
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min, // Não ocupar a tela inteira
              children: [
                const SizedBox(height: 70), // Cria espaço para a imagem que está acima
                TextField(
                  controller: _emailController,
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    suffixText: 'Coloque seu email',
                        suffixStyle: TextStyle(color: Colors.green),
                    contentPadding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0), // Aumenta o padding interno
                  ),
                ),
                const SizedBox(height: 20), // Espaço entre os campos
                TextField(
                  controller: _passwordController,
                  decoration: const InputDecoration(
                    labelText: 'Password',
                    suffixText: 'coloque sua senha',
                        suffixStyle: TextStyle(color: Colors.green),
                    contentPadding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0), // Aumenta o padding interno
                   
                  ),
                  obscureText: true,
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () async {
                    final email = _emailController.text;
                    final password = _passwordController.text;
                    if (email.isEmpty || password.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Email and password cannot be empty')),
                      );
                      return;
                    }
                    try {
                      await Provider.of<AuthProvider>(context, listen: false)
                      .login(email, password);
                      Navigator.of(context).pushReplacementNamed('/home');
                    } catch (error) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Falha no Login: $error')),
                      );
                    }
                  },
                  child: const Text('Entrar'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 15, 76, 126), // Cor de fundo do botão
                    foregroundColor: Colors.white, // Cor do texto do botão
                  ),
                ),
                const SizedBox(height: 10),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacementNamed('/register');
                  },
                  child: const Text('Não possui um cadastro? Cadastre-se'),
                ),
              ],
            ),
          ),
          Positioned(
            top: -85, // Posição negativa para a imagem sair para fora
            left: 50, // Centraliza a imagem horizontalmente
            right: 50, // Centraliza a imagem horizontalmente
            child: Image.asset(
              'assets/foton.png', // Caminho da imagem
              width: 300, // Ajuste a largura da imagem conforme necessário
              height: 300, // Ajuste a altura da imagem conforme necessário
            ),
          ),
        ],
      ),
    ),
  ),
);
  }
}


  
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:edusmart/controllers/authProvider.dart';

class RegisterScreen extends StatelessWidget {
  final _emailController = TextEditingController();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        clipBehavior: Clip.none, // Allows the image to go outside the Container
        children: [
          Container(
            color: const Color.fromARGB(255, 15, 76, 126), // Background color of the screen
            child: Center(
              child: Stack(
                clipBehavior: Clip.none, // Allows the image to go outside the Container
                children: [
                  Container(
                    margin: const EdgeInsets.only(
                      top: 100.0, // Move the Container down to make room for the image
                      left: 16.0,
                      right: 16.0,
                      bottom: 8.0,
                    ),
                    padding: const EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    constraints: const BoxConstraints(
                      minHeight: 550,
                      maxWidth: 350,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const SizedBox(height: 70),
                        TextField(
                          controller: _emailController,
                          decoration: const InputDecoration(
                            labelText: 'Email',
                            contentPadding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
                          ),
                        ),
                        const SizedBox(height: 20),
                        TextField(
                          controller: _usernameController,
                          decoration: const InputDecoration(
                            labelText: 'Nome de usuário',
                            suffixText: 'disponível',
                            suffixStyle: TextStyle(color: Colors.green),
                            contentPadding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
                          ),
                        ),
                        const SizedBox(height: 20),
                        TextField(
                          controller: _passwordController,
                          decoration: const InputDecoration(
                            labelText: 'Criar senha',
                            suffixText: 'as senhas são iguais',
                            suffixStyle: TextStyle(color: Colors.green),
                            contentPadding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
                          ),
                          obscureText: true,
                        ),
                        const SizedBox(height: 20),
                        TextField(
                          controller: _confirmPasswordController,
                          decoration: const InputDecoration(
                            labelText: 'Confirmar senha',
                            suffixText: 'as senhas são iguais',
                            suffixStyle: TextStyle(color: Colors.green),
                            contentPadding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
                          ),
                          obscureText: true,
                        ),
                        const SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: () async {
                            final email = _emailController.text;
                            final username = _usernameController.text;
                            final password = _passwordController.text;
                            final confirmPassword = _confirmPasswordController.text;

                            if (email.isEmpty || username.isEmpty || password.isEmpty || confirmPassword.isEmpty) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text('Todos os campos são obrigatórios.')),
                              );
                              return;
                            }

                            if (password != confirmPassword) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text('As senhas não coincidem.')),
                              );
                              return;
                            }

                            try {
                              await Provider.of<AuthProvider>(context, listen: false).register(username, email, password);
                              Navigator.of(context).pushReplacementNamed('/home');
                            } catch (error) {
                              print("Roberto Carlos: ${error}");
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text('Falha no cadastro: $error')),
                              );
                            }
                          },
                          child: const Text('Cadastrar'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color.fromARGB(255, 15, 76, 126),
                            foregroundColor: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 10),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pushReplacementNamed('/login');
                          },
                          child: const Text('Possuo cadastro'),
                        ),
                      ],
                    ),
                  ),
                 Positioned(
                  top: -70, // Posição negativa para a imagem sair para fora
                  left: 50, // Centraliza a imagem horizontalmente
                 right: 50, // Centraliza a imagem horizontalmente
                 child: Image.asset(
                  'assets/foton.png', // Caminho da imagem
                  width: 400, // Ajuste a largura da imagem conforme necessário
                  height: 400, // Ajuste a altura da imagem conforme necessário
                   ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

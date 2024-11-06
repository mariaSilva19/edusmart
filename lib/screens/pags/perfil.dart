import 'package:edusmart/controllers/authProvider.dart';
import 'package:edusmart/screens/cadastro.dart';
import 'package:edusmart/screens/home.dart';
import 'package:edusmart/screens/pags/config.dart';
import 'package:edusmart/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

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

  // Função para confirmar exclusão da conta
  void _confirmDeleteAccount(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Confirmar Exclusão'),
          content: Text('Você tem certeza que deseja excluir sua conta?'),
          actions: <Widget>[
            TextButton(
              child: Text('Cancelar'),
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.grey, // Cor do texto
              ),
              onPressed: () {
                Navigator.of(context).pop(); // Fecha o diálogo
              },
            ),
            TextButton(
              child: Text('Excluir'),
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Color(0xFF0F4C7E), // Cor do texto
              ),
              onPressed: () {
                // Lógica para excluir a conta pode ser colocada aqui
                Navigator.of(context).pop(); // Fecha o diálogo
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => RegisterScreen()),
                ); // Redireciona para a tela de cadastro
              },
            ),
          ],
        );
      },
    );
  }

  // Função para confirmar sair da conta
  void _confirmLogout(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Confirmar Saída'),
          content: Text('Você tem certeza que deseja sair?'),
          actions: <Widget>[
            TextButton(
              child: Text('Cancelar'),
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.grey, // Cor do texto
              ),
              onPressed: () {
                Navigator.of(context).pop(); // Fecha o diálogo
              },
            ),
            TextButton(
              child: Text('Sair'),
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Color(0xFF0F4C7E), // Cor do texto
              ),
              onPressed: () {
                Navigator.of(context).pop(); // Fecha o diálogo
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => RegisterScreen()),
                ); // Redireciona para a tela de cadastro
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);

    final nomeUsuario = authProvider.nome;
    final emailUsuario = authProvider.email;
    final avatarIcon = authProvider.avatar;

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
      ),
      body: Column(
        children: [
          // Header Section
          SizedBox(
            width: double.infinity,
            child: Container(
              color: Color(0xFF0F4C7E),
              padding: EdgeInsets.symmetric(vertical: 16),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.person,
                      size: 50,
                      color: Color(0xFF0F4C7E),
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    nomeUsuario!,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 16),
                ],
              ),
            ),
          ),

          // Info Section - Without border
          Expanded(
            child: Container(
              color: Colors.white, // Just a background color, no border
              padding: EdgeInsets.all(16.0),
              child: Column(
                children: [
                  ListTile(
                    leading: Icon(Icons.email, color: Color(0xFF0F4C7E)),
                    title: Text(emailUsuario!),
                  ),
                  Divider(),
                  ListTile(
                    leading: Icon(Icons.settings, color: Color(0xFF0F4C7E)),
                    title: Text('Configurações'),
                    onTap: () {
                      // Navega para a tela de configurações
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SettingsPage()),
                      );
                    },
                  ),
                  Divider(),
                  ListTile(
                    leading: Icon(Icons.exit_to_app, color: Color(0xFF0F4C7E)),
                    title: Text('Sair'),
                    onTap: () {
                      _confirmLogout(context);
                    },
                  ),
                  Divider(),
                  ListTile(
                    leading: Icon(Icons.delete, color: Color(0xFF0F4C7E)),
                    title: Text('Excluir conta'),
                    onTap: () {
                      _confirmDeleteAccount(context);
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      // Bottom Navigation Bar
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

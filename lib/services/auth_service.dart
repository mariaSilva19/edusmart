import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  final String baseUrl =
      'https://a4cbe45d-4755-42a7-bb7c-8a519c38281c-00-2vitw121bd8i8.picard.replit.dev/api';

  static String emailLogado = '';
  static String usuarioLogado = '';

  Future<void> register(String nome, String email, String password) async {
    final url = Uri.parse('$baseUrl/users/register');
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: json.encode({'nome': nome, 'email': email, 'password': password}),
    );
    if (response.statusCode != 201) {
      throw Exception('Failed to register ${response.body}');
    }
  }

  Future login(String email, String password) async {
    final url = Uri.parse('$baseUrl/users/login');
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: json.encode({'email': email, 'senha': password}),
    );
    print(email);
    print(password);
    print(response.statusCode);
    print(response.body);

    if (response.statusCode == 200) {
      final responseData = json.decode(response.body);

      print('teste: ${responseData}');

      final usuario = responseData['usuario'];
      if (usuario is Map) {
        final prefs = await SharedPreferences.getInstance();
        prefs.setString('nome', usuario['nome'] ?? '');
        prefs.setString('email', usuario['email'] ?? '');
        prefs.setString('avatar', responseData['avatar']?.toString() ?? '');
        usuarioLogado = usuario['nome'] ?? '';

        print('babaowe: ');
        return responseData['token'];
      } else {
        print('atata');
        throw Exception('Formato inválido da resposta da API');
      }
    } else {
      throw Exception('Failed to login: ${response.body}');
    }
  }

  static String getEmailLogado() {
    return emailLogado;
  }

  static String getNomeLogado() {
    return usuarioLogado;
  }
}

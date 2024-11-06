import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  final String baseUrl = 'https://b7089caa-e476-42ba-82fb-5e43b96e9b62-00-1jkv1557vl3bj.worf.replit.dev/api';

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
      final prefs = await SharedPreferences.getInstance();
      prefs.setString('nome', responseData['usuario'].toString());
      prefs.setString('email', email);
      prefs.setString('avatar', responseData['avatar']?.toString() ?? '');
      usuarioLogado = responseData['usuario'];
      return responseData['token'];
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

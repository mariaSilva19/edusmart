import 'dart:convert';

import 'package:http/http.dart' as http;

class AuthService {
  final String baseUrl = 'https://b19c12c9-4a42-48c0-9e18-45cccae95eb0-00-1sgyzy7k6iy73.janeway.replit.dev/api';

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
      return responseData['token'];
    } else {
      throw Exception('Failed to login: ${response.body}');
    }
  }
}

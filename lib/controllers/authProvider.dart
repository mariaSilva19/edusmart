import 'package:edusmart/services/auth_service.dart';
import 'package:flutter/material.dart';

class AuthProvider with ChangeNotifier {
  String? _token; 
  final AuthService _authService = AuthService();

  bool get isAuthenticated => _token != null;
  
  Future<void> register(String nome, String email, String password) async {
    try {
      await _authService.register(nome, email, password);
    }catch (error) {
      debugPrint('Erro ao registrar: $error');
     rethrow;
    }
  }

  Future<void> login(String email, String password) async {
    try {
      await  _authService.login(email, password);
    }
    catch (error){
      rethrow;
    }
  }

}
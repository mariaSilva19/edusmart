import 'package:edusmart/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider with ChangeNotifier {
  String? _token; 
  final AuthService _authService = AuthService();

  String? loggedNome;
  String? loggedEmail;
  String? loggedAvatar;

  String? get nome => loggedNome;
  String? get email => loggedEmail;
  String? get avatar => loggedAvatar;

  bool get isAuthenticated => _token != null;

  AuthProvider(){
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    final prefs = await SharedPreferences.getInstance();
    loggedNome = prefs.getString('nome');
    loggedEmail = prefs.getString('email');
    loggedAvatar = prefs.getString('avatar');

    notifyListeners();
  }


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
      _loadUserData();
    }
    catch (error){
      rethrow;
    }
  }

}
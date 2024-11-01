import 'package:edusmart/controllers/authProvider.dart';
import 'package:edusmart/screens/cadastro.dart';
import 'package:edusmart/screens/home.dart';
import 'package:edusmart/screens/login.dart';
import 'package:edusmart/screens/materias/bio.dart';
import 'package:edusmart/screens/materias/filo.dart';
import 'package:edusmart/screens/materias/fis.dart';
import 'package:edusmart/screens/materias/geo.dart';
import 'package:edusmart/screens/materias/his.dart';
import 'package:edusmart/screens/materias/ingle.dart';
import 'package:edusmart/screens/materias/mat.dart';
import 'package:edusmart/screens/materias/port.dart';
import 'package:edusmart/screens/materias/quim.dart';
import 'package:edusmart/screens/materias/soc.dart';
import 'package:edusmart/screens/pags/chat.dart';
import 'package:edusmart/screens/pags/cronograma.dart';
import 'package:edusmart/screens/pags/exercicios.dart';
import 'package:edusmart/screens/pags/materias.dart';
import 'package:edusmart/screens/pags/perfil.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp ({super.key});

  @override 
  Widget build (BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AuthProvider(),
      child: MaterialApp(
        title: 'Flutter Auth',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Consumer<AuthProvider>(
          builder: (context, authProvider, child){
            if (authProvider.isAuthenticated) { // Corrigido aqui
              return HomeScreen();
            } else {
              return RegisterScreen();
            }
          },
        ),
        routes: {
          '/login': (context) => LoginScreen(),
          '/cadastro': (context) => RegisterScreen(),
          '/home': (context) => HomeScreen(),
          '/perfil': (context) => ProfilePage(),
          '/materias':(context) => Materia(),
          '/exercicios': (context) => Exercicios(),
          '/cronograma': (context) => Cronograma(),
          '/chat' :(context) => ChatItem(),
          '/Mat':(context) => MatPage(),
          '/Geo':(context) => GeoPage(),
          '/Quim':(context) => QuiPage(),
          '/Fis':(context) => FisPage(),
          '/Bio':(context) => BioPage(),
          '/Soc':(context) => SocPage(),
          '/Filo':(context) => FiloPage(),
          '/Ing':(context) => IngPage(),
          '/Port':(context) => PortPage(),
        },
      )
    );
  }
}

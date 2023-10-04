import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:loginpage/telas/autenticacao_tela.dart';
import 'package:loginpage/telas/home_screen.dart';
import 'firebase_options.dart';
import 'package:loginpage/telas/drawerUser.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: RouterScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class RouterScreen extends StatelessWidget {
  const RouterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.userChanges(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return homePage2();
        } else {
          return const AutenticacaoTela();
        }
      },
    );
  }
}


//Developed by Rodrigo Costa DEV => https://rodrigocosta-dev.com/

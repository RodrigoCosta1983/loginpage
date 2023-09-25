import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:loginpage/main.dart';
import 'package:loginpage/telas/autenticacao_tela.dart';
import 'firebase_options.dart';

Future<void> main() async {
  runApp  (const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: AutenticacaoTela(),
    );
  }
}

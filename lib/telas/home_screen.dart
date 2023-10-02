import 'package:flutter/material.dart';
import 'package:loginpage/main.dart';
import 'package:loginpage/services/authentication.dart';
import 'autenticacao_tela.dart';

void main() {
  runApp(const homePage());
}

class homePage extends StatelessWidget {
  const homePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tela Inicial"),
      ),
      drawer: Drawer(
        child: ListView(children: [
          ListTile(
            leading:  const Icon(Icons.logout), title:  const Text("Sair"), onTap: (){
            ServiceAuthentication().logOut();
          },
          )
        ],),
      ),

    );

  }
}

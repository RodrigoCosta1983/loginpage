import 'package:flutter/material.dart';
import 'package:loginpage/services/authentication.dart';
import 'package:loginpage/telas/autenticacao_tela.dart';

void main() => runApp(homePage2());

class homePage2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Colors.blue),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Home"),
        ),
        body: Container(
          color: Colors.grey,
        ),
        drawer: Drawer(
          child: ListView(
            children: <Widget>[
              UserAccountsDrawerHeader(
                accountName: Text("Rodrigo Costa"),
                accountEmail: Text("rodrigo.costa@eritrium.com"),
                currentAccountPicture: CircleAvatar(
                  radius: 30.0,
                  backgroundImage: NetworkImage(
                      'https://avatars.githubusercontent.com/u/50494157?v=4'),
                  backgroundColor: Colors.transparent,
                ),
              ),
              ListTile(
                  leading: Icon(Icons.star),
                  title: Text("Favoritos"),
                  subtitle: Text("meus favoritos..."),
                  trailing: Icon(Icons.arrow_forward),
                  onTap: () {
                    debugPrint('Favorito');
                  }),
              ListTile(
                  leading: Icon(Icons.account_circle),
                  title: Text("Perfil"),
                  subtitle: Text("Perfil do usuário..."),
                  trailing: Icon(Icons.arrow_forward),
                  onTap: () {
                    debugPrint('Perfil');
                  }),
              ListTile(
                leading: const Icon(Icons.logout),
                title: const Text("Sair"),
                onTap: () {
                  ServiceAuthentication().logOut();
                },
              )
            ],
          ),
        ),
      ),
    );
  }

}

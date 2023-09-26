import 'package:flutter/material.dart';
import 'package:loginpage/_comum/cores.dart';
import 'package:loginpage/components/authentication_field_decoration.dart';

class AutenticacaoTela extends StatefulWidget {
  const AutenticacaoTela({super.key});

  @override
  State<AutenticacaoTela> createState() => _AutenticacaoTelaState();
}

class _AutenticacaoTelaState extends State<AutenticacaoTela> {
  bool wantEnter = true;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.darkBlue,
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                  MyColors.blueTopGradient,
                  MyColors.blueLowGradient,
                ])),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Center(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Image.asset(
                        "assets/images/DEV_LOGO-semfundo.png",
                        height: 158,
                      ),
                      const SizedBox(
                        height: 32,
                      ),
                      TextFormField(
                        decoration: getAuthenticationInputDecoration("Usuário"),
                        validator: (String? value) {
                          //Validações de usuário ... User validation
                          if (value == null) {
                            return "Preencha o campo usuário!!!";
                          }
                          if (value.length < 5 || !value.contains("@")) {
                            return "Usuário inválido!!!";
                          }
                        },
                      ),
                      const SizedBox(height: 8),
                      TextFormField(
                        decoration: getAuthenticationInputDecoration("Senha"),
                        validator: (String? value) {
                          //Validações de usuário ... User validation
                          if (value == null) {
                            return "Preencha a senha!!!";
                          }
                          if (value.length < 6) {
                            return "Senha inválida, minímo 6 caracteres!!!";
                          }
                        },
                        obscureText: true,
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Visibility(
                        visible: !wantEnter,
                        child: Column(
                          children: [
                            TextFormField(
                              decoration: getAuthenticationInputDecoration("Confirme a Senha"),
                              validator: (String? value) {
                                //Validações de usuário ... User validation
                                if (value == null) {
                                  return "Preencha a senha!!!";
                                }
                                if (value.length < 6) {
                                  return "Senha inválida";
                                }
                              },
                              obscureText: true,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          main_button_clicked();
                        },
                        child: Text((wantEnter) ? "Login" : "Cadastrar"),
                      ),
                      const Divider(),
                      TextButton(
                        onPressed: () {
                          setState(() {
                            wantEnter = !wantEnter;
                          });
                        },
                        child: Text((wantEnter) ? "Cadastre-se" : "Login"),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  main_button_clicked() {
    if (_formKey.currentState!.validate()) {
      print("OK");
    } else
      print("error!!");
  }
}

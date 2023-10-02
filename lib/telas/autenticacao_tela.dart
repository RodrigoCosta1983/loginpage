import 'package:flutter/material.dart';
import 'package:loginpage/_comum/cores.dart';
import 'package:loginpage/_comum/my_snackbar.dart';
import 'package:loginpage/components/authentication_field_decoration.dart';
import 'package:loginpage/services/authentication.dart';


class AutenticacaoTela extends StatefulWidget {
  const AutenticacaoTela({super.key});

  @override
  State<AutenticacaoTela> createState() => _AutenticacaoTelaState();
}

class _AutenticacaoTelaState extends State<AutenticacaoTela> {
  bool wantEnter = true;
  final _formKey = GlobalKey<FormState>();

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  final ServiceAuthentication _Authentication = ServiceAuthentication();

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
                        "assets/images/logo.png",
                        height: 55,

                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      TextFormField(
                        controller: _emailController,
                        decoration: getAuthenticationInputDecoration("Email:"),
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
                        controller: _passwordController,
                        decoration: getAuthenticationInputDecoration("Senha:"),
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
                              obscureText: true,
                              validator: (String? value) {    //Validações de usuário ... User validation
                                if (value == null) {
                                  return "Preencha a senha!!!";
                                }
                                if (value.length < 6) {
                                  return "Senha inválida";
                                }
                              },
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

  main_button_clicked() async {
    String email = _emailController.text;
    String password = _passwordController.text;
    if (_formKey.currentState!.validate()) {
      if (wantEnter) {
        print("Entrou");
        _Authentication.login_User(email: email, password: password).then((String? erro) {
          if(erro != null){
            showSnackbar(context: context, texto: erro);
          }
        });

      } else {
        print("Cadastro Validado");
        print("${_passwordController}, ${_emailController}");
        _Authentication.registerUser(email: email, password: password)
            .then(
              (String? erro) {
            if (erro != null) {
              //voltou com erro  ... returned with error
              showSnackbar(context: context, texto: erro);
            } else {
              //deu certo ... it worked out
              showSnackbar(
                  context: context,
                  texto: "Cadastro efetuado com sucesso!",
                  isErro: false);
            }
          },
        );
      }
      ;
    } else {
      print("error!!");
    }
  }
}

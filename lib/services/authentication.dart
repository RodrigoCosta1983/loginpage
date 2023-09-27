import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ServiceAuthentication {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<String?> registerUser(
      //Cadastrar Usuário
      {required String email,
      required String password}) async {
    try {
      UserCredential userCredential = await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);
      await userCredential.user!.updateDisplayName(email);
      return null;
    } on FirebaseAuthException catch (e) {
      //print(e.code); //print para ver qual CÓD de erro ... print to see what error CODE
      if (e.code == "email-already-in-use") {
        return "Usuário já cadastrado!!";
      }
      return "Erro desconhecido";
    }
  }

  // Logando Usuário ... Logging in User

  Future<String?> login_User(
      {required String email, required String password}) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      return null;
    } on FirebaseException catch (e) {
      return e.message;
    }
  }

  Future<void> logOut() async {    // deslogar ... log out
    return _firebaseAuth.signOut();
  }
}

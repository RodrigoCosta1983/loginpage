import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ServiceAuthentication {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<String?> cadastrarUsusario(
      {required String email, required String password}) async {
    try {
      UserCredential userCredential = await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);
      await userCredential.user!.updateDisplayName(email);
      return null;
    } on FirebaseAuthException catch (e) {
      //print(e.code);
      if (e.code == "email-already-in-use") {
        return "Usuário já cadastrado!!";
      }
      return "Erro desconhecido";
    }
  }
}

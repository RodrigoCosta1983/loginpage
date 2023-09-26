import 'package:firebase_auth/firebase_auth.dart';

class ServiceAuthentication {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  cadastrarUsusario({
    required String email,
    required String password}) {
      _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
  }
}

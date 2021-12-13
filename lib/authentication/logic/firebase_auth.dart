import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthentication {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  get user => _auth.currentUser;

  signin(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      return "okay";
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  signup() {}
}

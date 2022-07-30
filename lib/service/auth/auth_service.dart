import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';

Future<void> signin(String email, String password) async {
  try {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email.trim(), password: password.trim());
  } on FirebaseAuthException catch (e) {
    log(e.code);
  } catch (e) {
    log(e.toString());
  }
}

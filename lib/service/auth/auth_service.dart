import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';

Future<void> signin(String email, String password) async {
  var auth = FirebaseAuth.instance;
  try {
    log("Signing in...");
    await auth.signInWithEmailAndPassword(
      email: email.trim(),
      password: password.trim(),
    );
  } on FirebaseAuthException catch (e) {
    log(e.code);
  } catch (e) {
    log(e.toString());
  }
}

Future<String?> signup(String email, String password) async {
  var auth = FirebaseAuth.instance;
  try {
    var userCredentials = await auth.createUserWithEmailAndPassword(
        email: email.trim(), password: password.trim());
    return userCredentials.user?.uid;
  } on FirebaseAuthException catch (e) {
    log(e.code);
  } catch (e) {
    log(e.toString());
  }
  return null;
}

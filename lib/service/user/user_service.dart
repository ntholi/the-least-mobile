import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:theleast/service/auth/auth_service.dart';
import 'package:theleast/service/user/user.dart';

Future<void> createUser(User user) async {
  var firestore = FirebaseFirestore.instance;
  String? uid = await signup(user.email, user.password);
  if (uid != null) {
    await firestore
        .collection("users")
        .doc(uid)
        .set(user.toMap())
        .onError((e, _) => log("Error writing document: $e"));
  }
  log("Creating user Successful");
}

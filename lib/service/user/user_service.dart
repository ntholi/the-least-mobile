import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:theleast/service/user/user.dart';

Future<void> createUser(User user) async {
  var firestore = FirebaseFirestore.instance;
  log("Creating user...");
  await firestore
      .collection("users")
      .doc("id")
      .set(user.toMap())
      .onError((e, _) => log("Error writing document: $e"));
  log("Creating user Successful");
}

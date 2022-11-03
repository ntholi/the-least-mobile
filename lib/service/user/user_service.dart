import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebaseAuth;
import 'package:theleast/service/auth/auth_service.dart';
import 'package:theleast/service/user/user.dart';

import '../house/house.dart';

final db = FirebaseFirestore.instance;

Future<void> createUser(User user, String password) async {
  String? uid = await signup(user.email, password);
  if (uid != null) {
    await db
        .collection("users")
        .doc(uid)
        .set(user.toJson())
        .onError((e, _) => log("Error writing document: $e"));
  }
  log("Creating user Successful");
}

Future<User?> getUser(String userId) async {
  final ref = db.collection("users").doc(userId).withConverter(
        fromFirestore: User.fromFirestore,
        toFirestore: (User house, _) {
          return house.toJson();
        },
      );
  final snapshot = await ref.get();
  return snapshot.data();
}

Future<void> addToFavorites(House house) async {
  String? userId = firebaseAuth.FirebaseAuth.instance.currentUser?.uid;
  if (userId == null) {
    throw StateError("Unable to get logged-in user details");
  }
  String? houseId = house.id;
  if (houseId == null) {
    throw StateError("House id cannot be null");
  }
  final ref = db.collection("users").doc(userId);
  final user = await getUser(userId);
  List<String> favoriteHouses = [];
  if (user != null) {
    if (user.favoriteHouses != null) {
      favoriteHouses = user.favoriteHouses!;
    }
    if (!favoriteHouses.contains(house.id)) {
      favoriteHouses.add(houseId);
    }
  }
  ref.set({"favoriteHouses": favoriteHouses}, SetOptions(merge: true));
}

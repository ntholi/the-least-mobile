import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebaseAuth;
import 'package:theleast/service/auth/auth_service.dart';
import 'package:theleast/service/house/house.dart';
import 'package:theleast/service/user/user.dart';

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

Future<void> addFavorite(House house) async {
  final list = await _getFavorites();
  if (!list.contains(house.id)) {
    _updateFavorite([...list, house.id]);
  }
}

Future<void> removeFavorite(House house) async {
  final list = List.from(await _getFavorites());
  list.remove(house.id);
  _updateFavorite(list);
}

Future<void> _updateFavorite(List<dynamic>? favorites) async {
  String? userId = firebaseAuth.FirebaseAuth.instance.currentUser?.uid;
  await db.collection("users").doc(userId).set(
    {"favoriteHouses": favorites},
    SetOptions(merge: true),
  );
}

Future<List> _getFavorites() async {
  String? userId = firebaseAuth.FirebaseAuth.instance.currentUser?.uid;
  if (userId == null) {
    return [];
  }

  return (await getUser(userId))?.favoriteHouses ?? [];
}

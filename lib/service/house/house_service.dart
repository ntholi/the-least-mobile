import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:theleast/service/house/house.dart';

Future<List<House>> getHouses() async {
  var db = FirebaseFirestore.instance;

  final ref = db.collection("houses").withConverter(
        fromFirestore: House.fromFirestore,
        toFirestore: (House house, _) => house.toFirestore(),
      );
  final snapshot = await ref.get();
  return snapshot.docs.map((e) => e.data()).toList();
}

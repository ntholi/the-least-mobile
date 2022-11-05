import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:theleast/service/house/house.dart';
import 'package:theleast/service/user/user.dart';

final db = FirebaseFirestore.instance;

Future<List<House>> getFavoriteHouses(User? user) async {
  var filter = user?.favoriteHouses;
  final ref = db
      .collection("houses")
      .where(FieldPath.documentId, whereIn: filter)
      .withConverter(
        fromFirestore: House.fromFirestore,
        toFirestore: (House house, _) => house.toJson(),
      );

  final snapshot = await ref.get();
  return snapshot.docs.map((e) => e.data()).toList();
}

Future<List<House>> getHouses() async {
  final ref = db.collection("houses").withConverter(
        fromFirestore: House.fromFirestore,
        toFirestore: (House house, _) => house.toJson(),
      );

  final snapshot = await ref.get();
  return snapshot.docs.map((e) => e.data()).toList();
}

Future<List<House>> getHousesByNewest() async {
  final ref = db
      .collection("houses")
      .withConverter(
        fromFirestore: House.fromFirestore,
        toFirestore: (House house, _) => house.toJson(),
      )
      .orderBy("dateCreated");

  final snapshot = await ref.get();
  return snapshot.docs.map((e) => e.data()).toList();
}

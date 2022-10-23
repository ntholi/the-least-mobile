import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:theleast/service/house/house.dart';

Future<void> makePayment(House house, double amount) async {
  final db = FirebaseFirestore.instance;

  final docRef = db.collection("houses").doc(house.id);
  await db.runTransaction(
    (transaction) async {
      final snapshot = await transaction.get(docRef);
      final newAmount = snapshot.get("donated") + amount;
      transaction.update(docRef, {"donated": newAmount});
    },
  );
}

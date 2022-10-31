import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:theleast/screen/payment/payment_methods.dart';
import 'package:theleast/service/house/house.dart';
import 'package:theleast/service/payment/payment.dart';

final db = FirebaseFirestore.instance;

Future<void> makePayment(
    House house, PaymentType paymentType, double amount) async {
  String userId = "";

  final payment = Payment(
    amount: amount,
    houseId: house.id!,
    userId: userId,
    paymentType: paymentType,
  );

  final houseRef = db.collection("houses").doc(house.id);
  final paymentsRef = db.collection("payments").doc();

  await db.runTransaction(
    (transaction) async {
      final snapshot = await transaction.get(houseRef);
      final newAmount = snapshot.get("donated") + amount;
      transaction.update(houseRef, {"donated": newAmount});

      transaction.set(paymentsRef, payment.toJson());
    },
  );
}

import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:theleast/service/house/house.dart';
import 'package:theleast/service/payment/payment.dart';
import 'package:theleast/service/payment/payment_method.dart';
import 'package:theleast/service/user/user.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;

final db = FirebaseFirestore.instance;

Future<void> addPaymentMethod(User? user, PaymentMethod paymentMethod) async {
  String? userId = user?.id;
  if (user == null || userId == null) {
    throw StateError("Unable to get logged-in user details");
  }

  List<PaymentMethod> methods = List.from(user.paymentMethods?.toList() ?? []);
  methods.add(paymentMethod);

  await db.collection("users").doc(userId).set(
    {"paymentMethods": methods.map((it) => it.toJson()).toList()},
    SetOptions(merge: true),
  );
}

Future<void> makePayment(
  House house,
  double amount,
  PaymentMethod paymentMethod,
) async {
  String? userId = firebase_auth.FirebaseAuth.instance.currentUser?.uid;
  if (userId == null) {
    throw StateError("Unable to get logged-in user details");
  }

  final payment = Payment(
    amount: amount,
    houseId: house.id!,
    userId: userId,
    paymentMethod: paymentMethod,
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

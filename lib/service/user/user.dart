import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:theleast/service/payment/payment_method.dart';
import 'package:theleast/utils/json_converters.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class User with _$User {
  const factory User({
    String? id,
    String? firstName,
    String? lastName,
    required String email,
    List<PaymentMethod>? paymentMethods,
    List<String>? favoriteHouses,
    @TimestampConverter() Timestamp? dateCreated,
  }) = _User;

  factory User.fromFirestore(DocumentSnapshot<Map<String, dynamic>> snapshot,
      SnapshotOptions? options) {
    final data = snapshot.data();

    return User(
      id: snapshot.id,
      firstName: data?['firstName'],
      lastName: data?['lastName'],
      email: data?['email'],
      paymentMethods: _readPaymentMethods(data?['paymentMethods']),
      favoriteHouses: _readFavoriteHouses(data?["favoriteHouses"]),
    );
  }

  factory User.fromJson(Map<String, Object?> json) => _$UserFromJson(json);
}

List<String> _readFavoriteHouses(List<dynamic>? data) {
  if (data == null) return [];
  return List<String>.from(data);
}

List<PaymentMethod> _readPaymentMethods(List<dynamic>? data) {
  List<PaymentMethod> result = [];

  if (data == null) return result;

  for (final it in List<Map<String, dynamic>>.from(data)) {
    String? id;
    PaymentType? type;
    Map<String, dynamic>? fields;

    for (final entry in it.entries) {
      final key = entry.key;
      final value = entry.value;
      if (key == "id") {
        id = value;
      } else if (key == "type") {
        type = paymentTypeFromString(value as String);
      } else if (key == "fields") {
        fields = value;
      }
    }
    if (id != null && type != null) {
      PaymentMethod paymentMethod = PaymentMethod(
        id: id,
        type: type,
        fields: fields,
      );
      result.add(paymentMethod);
    }
  }
  return result;
}

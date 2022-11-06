import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:theleast/service/payment/payment_method.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class User with _$User {
  //TODO: add createdDate field

  const factory User({
    String? id,
    required String firstName,
    required String lastName,
    required String email,
    List<PaymentMethod>? paymentMethods,
    List<String>? favoriteHouses,
  }) = _User;

  factory User.fromFirestore(DocumentSnapshot<Map<String, dynamic>> snapshot,
      SnapshotOptions? options) {
    final data = snapshot.data();
    return User(
      id: snapshot.id,
      firstName: data?['firstName'],
      lastName: data?['lastName'],
      email: data?['email'],
      favoriteHouses: List<String>.from(data?['favoriteHouses']),
    );
  }

  factory User.fromJson(Map<String, Object?> json) => _$UserFromJson(json);
}

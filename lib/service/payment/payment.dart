import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:theleast/screen/payment/payment_methods.dart';
import 'package:theleast/utils/json_conveters.dart';
part 'payment.freezed.dart';
part 'payment.g.dart';

@freezed
class Payment with _$Payment {
  const factory Payment({
    String? id,
    required double amount,
    required String houseId,
    required String userId,
    required PaymentType paymentType,
    @TimestampConverter() Timestamp? dateCreated,
  }) = _Payment;

  factory Payment.fromJson(Map<String, Object?> json) =>
      _$PaymentFromJson(json);
}

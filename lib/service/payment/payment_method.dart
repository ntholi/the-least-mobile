import 'package:freezed_annotation/freezed_annotation.dart';
part 'payment_method.freezed.dart';
part 'payment_method.g.dart';

enum PaymentType {
  mpesa('M-Pesa'),
  card('Card'),
  payPall('PayPal');

  final String value;
  const PaymentType(this.value);
}

@freezed
class PaymentMethod with _$PaymentMethod {
  const factory PaymentMethod({
    required String id, // number or username
    required PaymentType type,
    final Map<String, dynamic>? fields,
  }) = _PaymentMethod;

  factory PaymentMethod.fromJson(Map<String, Object?> json) =>
      _$PaymentMethodFromJson(json);
}

import 'package:freezed_annotation/freezed_annotation.dart';
part 'payment_method.freezed.dart';
part 'payment_method.g.dart';

class PaymentMethodNames {
  static const String mpesa = 'M-Pesa';
  static const String card = 'Card';
  static const String payPall = 'PayPal';
}

@freezed
class PaymentMethod with _$PaymentMethod {
  const factory PaymentMethod({
    required String name,
    required String id,
  }) = _PaymentMethod;

  factory PaymentMethod.fromJson(Map<String, Object?> json) =>
      _$PaymentMethodFromJson(json);
}

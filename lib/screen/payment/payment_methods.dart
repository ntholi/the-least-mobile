import 'package:flutter/material.dart';
import 'package:theleast/service/payment/payment_method.dart';
import 'package:theleast/ui/selection_button.dart';

enum PaymentTypeIcon {
  mpesa(PaymentType.mpesa, "mpesa.png", Icons.phone_android),
  card(PaymentType.card, "card.png", Icons.credit_card),
  paypal(PaymentType.payPall, "paypal.png", Icons.paypal);

  const PaymentTypeIcon(this.paymentType, this.image, this.icon);
  final PaymentType paymentType;
  final String image;
  final IconData icon;

  @override
  String toString() => paymentType.value;
}

class PaymentMethods extends StatefulWidget {
  final ValueSetter setPaymentType;
  const PaymentMethods({super.key, required this.setPaymentType});

  @override
  State<PaymentMethods> createState() => _PaymentMethodsState();
}

class _PaymentMethodsState extends State<PaymentMethods> {
  PaymentTypeIcon? paymentType;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Text(
            "Pay With:",
            style: TextStyle(
              color: Colors.grey.shade500,
              fontWeight: FontWeight.w500,
              letterSpacing: 1,
            ),
          ),
        ),
        const SizedBox(height: 20),
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: PaymentTypeIcon.values
                .map(
                  (type) => Container(
                    margin: const EdgeInsets.only(bottom: 16),
                    child: SelectionButton(
                      value: type,
                      icon: type.icon,
                      selected: type.paymentType == paymentType?.paymentType,
                      showCheckMark: true,
                      setValue: (value) {
                        setState(() {
                          paymentType = value;
                          widget.setPaymentType(value);
                        });
                      },
                    ),
                  ),
                )
                .toList(),
          ),
        ),
      ],
    );
  }
}

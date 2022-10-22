import 'package:flutter/material.dart';
import 'package:theleast/ui/selection_button.dart';

enum PaymentType {
  mpesa("M-Pesa"),
  card("Card"),
  paypal("PayPal");

  const PaymentType(this.text);
  final String text;

  @override
  String toString() => text;
}

class PaymentMethods extends StatefulWidget {
  final ValueSetter setPaymentType;
  const PaymentMethods({super.key, required this.setPaymentType});

  @override
  State<PaymentMethods> createState() => _PaymentMethodsState();
}

class _PaymentMethodsState extends State<PaymentMethods> {
  PaymentType? paymentType;

  @override
  Widget build(BuildContext context) {
    const double spaceHight = 13;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Pay With:",
        ),
        const SizedBox(height: 20),
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SelectionButton(
                value: PaymentType.mpesa,
                icon: "new.png",
                selected: paymentType == PaymentType.mpesa,
                setValue: (value) {
                  setState(() {
                    paymentType = value;
                    widget.setPaymentType(value);
                  });
                },
              ),
              const SizedBox(height: spaceHight),
              SelectionButton(
                value: PaymentType.card,
                icon: "new.png",
                selected: paymentType == PaymentType.card,
                setValue: (value) {
                  setState(() {
                    paymentType = value;
                    widget.setPaymentType(value);
                  });
                },
              ),
              const SizedBox(height: spaceHight),
              SelectionButton(
                value: PaymentType.paypal,
                icon: "new.png",
                selected: paymentType == PaymentType.paypal,
                setValue: (value) {
                  setState(() {
                    paymentType = value;
                    widget.setPaymentType(value);
                  });
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}

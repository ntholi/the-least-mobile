import 'package:flutter/material.dart';
import 'package:theleast/ui/selection_button.dart';

enum PaymentType {
  mpesa("M-Pesa", "mpesa.png", Icons.phone_android),
  card("Card", "card.png", Icons.credit_card),
  paypal("PayPal", "paypal.png", Icons.paypal);

  const PaymentType(this.name, this.image, this.icon);
  final String name;
  final String image;
  final IconData icon;

  @override
  String toString() => name;
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
              children: PaymentType.values
                  .map((type) => Container(
                        margin: const EdgeInsets.only(bottom: 16),
                        child: SelectionButton(
                          value: type,
                          icon: type.icon,
                          selected: type.name == paymentType?.name,
                          showCheckMark: true,
                          setValue: (value) {
                            setState(() {
                              paymentType = value;
                              widget.setPaymentType(value);
                            });
                          },
                        ),
                      ))
                  .toList()),
        ),
      ],
    );
  }
}

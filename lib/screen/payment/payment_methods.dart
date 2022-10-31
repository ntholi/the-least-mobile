import 'package:flutter/material.dart';
import 'package:theleast/service/payment/payment_method.dart';
import 'package:theleast/ui/selection_button.dart';

enum PaymentMethodIcons {
  mpesa(PaymentMethodNames.mpesa, "mpesa.png", Icons.phone_android),
  card(PaymentMethodNames.card, "card.png", Icons.credit_card),
  paypal(PaymentMethodNames.payPall, "paypal.png", Icons.paypal);

  const PaymentMethodIcons(this.name, this.image, this.icon);
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
  PaymentMethodIcons? paymentType;

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
            children: PaymentMethodIcons.values
                .map(
                  (type) => Container(
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
                  ),
                )
                .toList(),
          ),
        ),
      ],
    );
  }
}

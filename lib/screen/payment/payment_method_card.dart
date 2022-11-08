import 'package:flutter/material.dart';
import 'package:theleast/service/payment/payment_method.dart';

class PaymentMethodCard extends StatelessWidget {
  final PaymentMethod paymentMethod;
  const PaymentMethodCard(
    this.paymentMethod, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Column(
        children: [
          Card(
            child: Container(
              padding: const EdgeInsets.all(16),
              height: 120,
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    child: Image.asset(
                      'assets/images/mpesa.png',
                      width: 80,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "M-Pesa",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const Spacer(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text("Number"),
                            Text("****${obscured(paymentMethod.id)}"),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: OutlinedButton.icon(
              onPressed: () {},
              icon: Icon(Icons.edit_note, color: Colors.grey.shade900),
              label: Text(
                "Update",
                style: TextStyle(color: Colors.grey.shade900),
              ),
            ),
          )
        ],
      ),
    );
  }
}

String obscured(String str) {
  return str.substring(str.length - 3);
}

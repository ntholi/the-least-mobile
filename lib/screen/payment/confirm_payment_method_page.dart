import 'package:flutter/material.dart';

class ConfirmPaymentMethodPage extends StatelessWidget {
  const ConfirmPaymentMethodPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Confirm Payment Method"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              height: 120,
              decoration: BoxDecoration(
                color: Colors.green.shade50,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  Image.asset(
                    'assets/images/mpesa.png',
                  ),
                  const SizedBox(width: 16),
                  Column(
                    children: const [
                      Text(
                        "M-Pesa",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text("...763"),
                    ],
                  )
                ],
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: OutlinedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.edit_note),
                label: const Text("Update"),
              ),
            )
          ],
        ),
      ),
    );
  }
}

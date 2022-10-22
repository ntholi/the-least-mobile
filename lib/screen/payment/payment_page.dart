import 'package:flutter/material.dart';
import 'package:theleast/screen/payment/payment_amount.dart';
import 'package:theleast/screen/payment/payment_methods.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  PaymentType? paymentType;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Payment")),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                PaymentAmount(),
                PaymentMethods(
                  setPaymentType: (value) {
                    setState(() {
                      paymentType = paymentType != value ? value : null;
                    });
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

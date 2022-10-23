import 'package:flutter/material.dart';
import 'package:theleast/screen/payment/payment_amount_page.dart';
import 'package:theleast/screen/payment/payment_amount.dart';
import 'package:theleast/screen/payment/payment_methods.dart';
import 'package:theleast/service/house/house.dart';
import 'package:theleast/ui/button.dart';
import 'package:theleast/ui/colors.dart';

class PaymentPage extends StatefulWidget {
  final House house;
  const PaymentPage(this.house, {super.key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  PaymentType? paymentType;
  final amountKey = GlobalKey<FormFieldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Payment")),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              PaymentAmount(amountKey: amountKey),
              PaymentMethods(
                setPaymentType: (value) {
                  setState(() {
                    paymentType = paymentType != value ? value : null;
                  });
                },
              ),
              Button(
                onClick: () {
                  Navigator.of(context).push(
                    MaterialPageRoute<void>(
                      builder: (BuildContext context) =>
                          PaymentAmountPage(widget.house),
                    ),
                  );
                },
                title: "Continue",
                backgroundColor: AppColors.darkButton,
              )
            ],
          ),
        ),
      ),
    );
  }
}

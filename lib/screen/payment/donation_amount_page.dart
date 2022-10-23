import 'package:flutter/material.dart';
import 'package:theleast/screen/payment/confirm_payment_page.dart';
import 'package:theleast/screen/payment/donation_amount.dart';
import 'package:theleast/screen/payment/payment_methods.dart';
import 'package:theleast/service/house/house.dart';
import 'package:theleast/ui/button.dart';
import 'package:theleast/ui/colors.dart';

class DonationAmountPage extends StatefulWidget {
  final House house;
  const DonationAmountPage(this.house, {super.key});

  @override
  State<DonationAmountPage> createState() => _DonationAmountPageState();
}

class _DonationAmountPageState extends State<DonationAmountPage> {
  PaymentType? paymentType;
  final _amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Donation Amount")),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
                  const Text(
                    "Donate to ",
                    style: TextStyle(fontSize: 16),
                  ),
                  Text(
                    widget.house.name,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 40),
              PaymentAmount(amountController: _amountController),
              const SizedBox(height: 20),
              PaymentMethods(
                setPaymentType: (value) {
                  setState(() {
                    paymentType = paymentType != value ? value : null;
                  });
                },
              ),
              const Spacer(),
              ValueListenableBuilder<TextEditingValue>(
                valueListenable: _amountController,
                builder: (context, value, child) => Button(
                  disabled: double.tryParse(_amountController.text) == null,
                  onClick: () {
                    Navigator.of(context).push(
                      MaterialPageRoute<void>(
                        builder: (BuildContext context) => ConfirmPaymentPage(
                          widget.house,
                        ),
                      ),
                    );
                  },
                  title: "Continue",
                  backgroundColor: AppColors.primaryColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

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
  PaymentType? _paymentType;
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
                  const Icon(Icons.house),
                  const SizedBox(width: 5),
                  Text(
                    widget.house.name,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey.shade900,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              PaymentAmount(amountController: _amountController),
              const SizedBox(height: 20),
              PaymentMethods(
                setPaymentType: (value) {
                  setState(() {
                    _paymentType = value;
                  });
                },
              ),
              const Spacer(),
              ValueListenableBuilder<TextEditingValue>(
                valueListenable: _amountController,
                builder: (context, value, child) => Button(
                  disabled: double.tryParse(_amountController.text) == null ||
                      _paymentType == null,
                  onClick: () {
                    Navigator.of(context).push(
                      MaterialPageRoute<void>(
                        builder: (BuildContext context) => ConfirmPaymentPage(
                          house: widget.house,
                          amount: double.parse(value.text),
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

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
      backgroundColor: Colors.grey.shade100,
      body: Stack(
        children: [
          SizedBox(
            height: 180,
            child: AppBar(
              title: const Text("Donation Amount"),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(25),
                  bottomRight: Radius.circular(25),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 80, 16, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Icon(
                      Icons.house,
                      color: Colors.white,
                      size: 18,
                    ),
                    const SizedBox(width: 3),
                    Text(
                      widget.house.name,
                      style: const TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: PaymentAmount(amountController: _amountController),
                  ),
                ),
                const SizedBox(height: 10),
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: PaymentMethods(
                      setPaymentType: (value) {
                        setState(() {
                          _paymentType = value;
                        });
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.all(16),
              child: ValueListenableBuilder<TextEditingValue>(
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
            ),
          )
        ],
      ),
    );
  }
}

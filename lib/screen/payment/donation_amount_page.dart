import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:theleast/screen/payment/confirm_payment_page.dart';
import 'package:theleast/screen/payment/donation_amount.dart';
import 'package:theleast/screen/payment/methods/add_mpesa.dart';
import 'package:theleast/screen/payment/payment_methods.dart';
import 'package:theleast/service/house/house.dart';
import 'package:theleast/service/payment/payment_method.dart';
import 'package:theleast/service/user/user.dart';
import 'package:theleast/service/user/user_provider.dart';
import 'package:theleast/ui/button.dart';
import 'package:theleast/ui/colors.dart';

class DonationAmountPage extends ConsumerStatefulWidget {
  final House _house;
  const DonationAmountPage(this._house, {super.key});

  @override
  DonationAmountPageState createState() => DonationAmountPageState();
}

class DonationAmountPageState extends ConsumerState<DonationAmountPage> {
  PaymentTypeIcon? _paymentType;
  final _amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final user = ref.read(userProvider);
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
                      widget._house.name,
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
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: ValueListenableBuilder<TextEditingValue>(
        valueListenable: _amountController,
        builder: (context, value, child) => CustomFloatingButton(
          disabled: double.tryParse(_amountController.text) == null ||
              _paymentType == null,
          onClick: () {
            PaymentMethod? paymentMethod =
                _getPaymentMethod(user, PaymentType.mpesa);
            Navigator.of(context).push(
              MaterialPageRoute<void>(builder: (BuildContext context) {
                if (paymentMethod != null) {
                  return ConfirmPaymentPage(
                    house: widget._house,
                    amount: double.parse(value.text),
                    paymentMethod: paymentMethod,
                  );
                }
                return AddMpesaPage(
                    user: user,
                    house: widget._house,
                    amount: double.parse(value.text));
              }),
            );
          },
          title: "Continue",
        ),
      ),
    );
  }
}

PaymentMethod? _getPaymentMethod(User? user, PaymentType type) {
  final methods = user?.paymentMethods ?? [];
  for (final it in methods) {
    if (it.type == type) {
      return it;
    }
  }
  return null;
}

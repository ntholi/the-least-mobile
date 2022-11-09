import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:theleast/screen/payment/confirm_payment_page.dart';
import 'package:theleast/screen/payment/mpesa/add_mpesa_form.dart';
import 'package:theleast/service/house/house.dart';
import 'package:theleast/service/payment/payment_method.dart';
import 'package:theleast/service/payment/payment_service.dart';
import 'package:theleast/service/user/user.dart';
import 'package:theleast/ui/button.dart';
import 'package:theleast/ui/colors.dart';

class AddMpesaPage extends StatelessWidget {
  final _isProcessing = ValueNotifier<bool>(false);
  final formKey = GlobalKey<FormState>();
  final User? user;
  final House house;
  final double amount;
  late String _phoneNumber;

  AddMpesaPage(
      {this.user, required this.house, required this.amount, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text("M-Pesa"),
        elevation: 0,
      ),
      body: ColoredBox(
        color: AppColors.primaryColor,
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.grey.shade50,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(50),
              topRight: Radius.circular(50),
            ),
          ),
          child: SingleChildScrollView(
            child: AddMpesaForm(
              formKey: formKey,
              setPhoneNumber: (value) => _phoneNumber = value,
            ),
          ),
        ),
      ),
      floatingActionButton: ValueListenableBuilder(
          valueListenable: _isProcessing,
          builder: (context, value, child) {
            return CustomFloatingButton(
              isProcessing: _isProcessing.value,
              title: "Save",
              onClick: ([bool mounted = true]) async {
                formKey.currentState?.save();
                if (formKey.currentState?.validate() == false) {
                  return;
                }
                _isProcessing.value = true;
                final method = PaymentMethod(
                  id: _phoneNumber.trim(),
                  type: PaymentType.mpesa,
                );
                await addPaymentMethod(user, method);
                if (!mounted) return;

                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => ConfirmPaymentPage(
                      house: house,
                      amount: amount,
                      paymentMethod: method,
                    ),
                  ),
                );
              },
            );
          }),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

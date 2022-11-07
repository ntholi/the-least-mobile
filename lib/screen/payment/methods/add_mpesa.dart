import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:theleast/service/payment/payment_method.dart';
import 'package:theleast/service/payment/payment_service.dart';
import 'package:theleast/service/user/user.dart';
import 'package:theleast/service/user/user_provider.dart';
import 'package:theleast/ui/button.dart';
import 'package:theleast/ui/colors.dart';

class AddMpesaPage extends ConsumerWidget {
  final formKey = GlobalKey<FormState>();
  final User user;
  late String _phoneNumber;
  late String _password;
  AddMpesaPage(this.user, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(
                  height: 200,
                  child: Image.asset("assets/images/digital-wallet.png"),
                ),
                Text(
                  "Add M-Pesa Number",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueGrey.shade500,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  "Please enter the your M-Pesa Phone number to process payment",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.grey),
                ),
                const SizedBox(height: 30),
                Form(
                  key: formKey,
                  child: TextFormField(
                    onSaved: (value) => _phoneNumber = value ?? "",
                    decoration: const InputDecoration(
                      labelText: "Phone Number",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(height: 40),
                Button(
                  title: "Save",
                  onClick: () {
                    formKey.currentState?.save();
                    Map<String, dynamic> fields = {
                      "password": _password,
                    };
                    final method = PaymentMethod(
                      id: _phoneNumber,
                      type: PaymentType.mpesa,
                      fields: fields,
                    );
                    addPaymentMethod(method, user);
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

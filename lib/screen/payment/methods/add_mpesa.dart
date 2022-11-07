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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Stack(
            children: [
              SizedBox(
                height: 140,
                child: AppBar(
                  title: const Text("M-Pesa"),
                  elevation: 0,
                ),
              ),
              Container(
                height: 70,
                margin: const EdgeInsets.only(top: 70),
                child: const Center(
                  child: SizedBox(
                    // child: Image.asset('assets/images/mpesa.png'),
                    child: Icon(
                      Icons.phone_android,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: ColoredBox(
              color: AppColors.primaryColor,
              child: Container(
                padding: const EdgeInsets.only(top: 80, left: 30, right: 30),
                decoration: BoxDecoration(
                  color: Colors.grey.shade50,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50),
                  ),
                ),
                child: SingleChildScrollView(
                  child: Form(
                    key: formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          onSaved: (value) => _phoneNumber = value ?? "",
                          decoration: const InputDecoration(
                            labelText: "Phone Number",
                            border: OutlineInputBorder(),
                          ),
                        ),
                        const SizedBox(height: 20),
                        TextFormField(
                          onSaved: (value) => _password = value ?? "",
                          obscureText: true,
                          decoration: const InputDecoration(
                            labelText: "Password",
                            border: OutlineInputBorder(),
                          ),
                        ),
                        const SizedBox(height: 50),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 30,
              vertical: 16,
            ),
            child: Button(
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
            ),
          )
        ],
      ),
    );
  }
}

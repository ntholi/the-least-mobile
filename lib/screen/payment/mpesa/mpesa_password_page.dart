import 'package:flutter/material.dart';
import 'package:theleast/service/payment/payment_method.dart';
import 'package:theleast/ui/button.dart';
import 'package:theleast/ui/colors.dart';

class MpesaPasswordPage extends StatelessWidget {
  final PaymentMethod paymentMethod;
  final formKey = GlobalKey<FormState>();
  final _isProcessing = ValueNotifier<bool>(false);
  late String _password;
  MpesaPasswordPage({
    required this.paymentMethod,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Center(
        child: Container(
          margin: const EdgeInsets.all(16),
          child: Card(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 50),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text(
                    "M-Pesa PIN",
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 30),
                  Form(
                    key: formKey,
                    child: TextFormField(
                        decoration: const InputDecoration(
                          labelText: "Enter Password",
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return "Please Enter Password";
                          }
                          return null;
                        },
                        onSaved: (newValue) => _password = newValue ?? ""),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: ValueListenableBuilder<bool>(
        valueListenable: _isProcessing,
        builder: (context, value, child) {
          return CustomFloatingButton(
            onClick: ([bool mounted = true]) async {
              _isProcessing.value = true;
              print("Password: $_password");
              await Future.delayed(const Duration(seconds: 1));
            },
            title: "Confirm",
            isProcessing: _isProcessing.value,
            textColor: Colors.grey.shade700,
            backgroundColor: Colors.white,
          );
        },
      ),
    );
  }
}

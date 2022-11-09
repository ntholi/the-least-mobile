import 'package:flutter/material.dart';
import 'package:theleast/service/payment/payment_method.dart';
import 'package:theleast/ui/colors.dart';
import 'package:numeric_keyboard/numeric_keyboard.dart';

class MpesaPasswordPage extends StatefulWidget {
  final PaymentMethod paymentMethod;

  const MpesaPasswordPage({
    required this.paymentMethod,
    Key? key,
  }) : super(key: key);

  @override
  State<MpesaPasswordPage> createState() => _MpesaPasswordPageState();
}

class _MpesaPasswordPageState extends State<MpesaPasswordPage> {
  final _passwordController = TextEditingController();
  final _isProcessing = ValueNotifier<bool>(false);

  late String _password;
  String text = "";

  @override
  Widget build(BuildContext context) {
    onKeyboardTap(String value) {
      setState(() {
        _passwordController.text = _passwordController.text + value;
      });
    }

    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Center(
              child: Container(
                width: MediaQuery.of(context).size.width / 1.1,
                padding: const EdgeInsets.all(16),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SizedBox(height: 25),
                    Text(
                      "M-Pesa Password",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.grey.shade800,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 30),
                    TextField(
                      controller: _passwordController,
                      enabled: false,
                      obscureText: true,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 15),
                    Text(
                      "Phone Number: ${obscured(widget.paymentMethod.id)}",
                      style: TextStyle(
                        color: Colors.grey.shade700,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 25),
                  ],
                ),
              ),
            ),
          ),
          ColoredBox(
            color: Colors.white,
            child: NumericKeyboard(
              onKeyboardTap: onKeyboardTap,
              textColor: Colors.grey.shade600,
              rightButtonFn: () {},
              rightIcon: const Icon(
                Icons.check_sharp,
                color: AppColors.primaryColor,
              ),
              leftButtonFn: () {
                setState(() {
                  _passwordController.text = _passwordController.text
                      .substring(0, _passwordController.text.length - 1);
                });
              },
              leftIcon: Icon(
                Icons.backspace,
                color: Colors.red.shade300,
              ),
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:theleast/screen/payment/payment_successful_page.dart';
import 'package:theleast/service/house/house.dart';
import 'package:theleast/service/payment/payment_method.dart';
import 'package:theleast/service/payment/payment_service.dart';
import 'package:theleast/ui/colors.dart';
import 'package:numeric_keyboard/numeric_keyboard.dart';

class MpesaPasswordPage extends StatefulWidget {
  final PaymentMethod paymentMethod;
  final House house;
  final double amount;

  const MpesaPasswordPage({
    required this.paymentMethod,
    Key? key,
    required this.house,
    required this.amount,
  }) : super(key: key);

  @override
  State<MpesaPasswordPage> createState() => _MpesaPasswordPageState();
}

class _MpesaPasswordPageState extends State<MpesaPasswordPage> {
  final _passwordController = TextEditingController();
  bool _isProcessing = false;

  late String _password;
  String text = "";

  @override
  Widget build(BuildContext context) {
    onKeyboardTap(String value) {
      setState(() {
        _passwordController.text = _passwordController.text + value;
      });
    }

    return LoaderOverlay(
      overlayOpacity: 0.8,
      overlayColor: Colors.black,
      child: Scaffold(
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
                    borderRadius: BorderRadius.all(
                      Radius.circular(5),
                    ),
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
                rightButtonFn: () async {
                  context.loaderOverlay.show();
                  await onConfirmPayment(context);
                  if (!mounted) return;
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          PaymentSuccessfulPage(house: widget.house),
                    ),
                  );
                },
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
      ),
    );
  }

  Future<void> onConfirmPayment(BuildContext context) async {
    try {
      await makePayment(widget.house, widget.amount, widget.paymentMethod);
    } catch (error, stack) {
      print(stack);
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text("Error!"),
          content: Text("Error ${error.toString()}"),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(ctx).pop();
              },
              child: const Text("Close"),
            ),
          ],
        ),
      );
    }
  }
}

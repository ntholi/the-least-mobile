import 'package:flutter/material.dart';
import 'package:theleast/screen/payment/mpesa/mpesa_password_page.dart';
import 'package:theleast/screen/payment/payment_method_card.dart';
import 'package:theleast/screen/payment/payment_successful_page.dart';
import 'package:theleast/service/house/house.dart';
import 'package:theleast/service/payment/payment_method.dart';
import 'package:theleast/service/payment/payment_service.dart';
import 'package:theleast/ui/button.dart';

class ConfirmPaymentPage extends StatelessWidget {
  final _isProcessing = ValueNotifier<bool>(false);
  final House house;
  final double amount;
  final PaymentMethod paymentMethod;

  ConfirmPaymentPage({
    super.key,
    required this.house,
    required this.amount,
    required this.paymentMethod,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: Stack(
        children: [
          SizedBox(
            height: 180,
            child: AppBar(
              title: const Text("Confirm Payment"),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(25),
                  bottomRight: Radius.circular(25),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 80, 16, 16),
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
                      house.name,
                      style: const TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                PaymentMethodCard(paymentMethod),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Amount",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                                color: Colors.grey.shade900),
                          ),
                          Text(
                            "M$amount",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey.shade900,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 30),
                    ValueListenableBuilder<bool>(
                      valueListenable: _isProcessing,
                      builder: (context, value, child) {
                        return Button(
                          onClick: ([bool mounted = true]) async {
                            _isProcessing.value = true;
                            if (!mounted) return;
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => MpesaPasswordPage(
                                  house: house,
                                  amount: amount,
                                  paymentMethod: paymentMethod,
                                ),
                              ),
                            );
                          },
                          title: "Confirm Payment",
                          isProcessing: _isProcessing.value,
                        );
                      },
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

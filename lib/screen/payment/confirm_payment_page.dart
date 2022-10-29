import 'package:flutter/material.dart';
import 'package:theleast/screen/payment/payment_method_card.dart';
import 'package:theleast/service/house/house.dart';
import 'package:theleast/ui/button.dart';

class ConfirmPaymentPage extends StatelessWidget {
  final House _house;
  final double amount;
  const ConfirmPaymentPage(
      {super.key, required House house, required this.amount})
      : _house = house;

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
                      _house.name,
                      style: const TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                const PaymentMethodCard(),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.all(16),
              child: Button(onClick: () {}, title: "Confirm Payment"),
            ),
          ),
        ],
      ),
    );
  }
}

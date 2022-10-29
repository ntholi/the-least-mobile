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
                      _house.name,
                      style: const TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                const PaymentMethodCard(),
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
                                color: Colors.grey.shade900),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 30),
                    Button(onClick: () {}, title: "Confirm Payment")
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

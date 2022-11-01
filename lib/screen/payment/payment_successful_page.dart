import 'package:flutter/material.dart';
import 'package:theleast/screen/landing_page.dart';
import 'package:theleast/service/house/house.dart';
import 'package:theleast/ui/button.dart';
import 'package:theleast/ui/colors.dart';

class PaymentSuccessfulPage extends StatelessWidget {
  final House _house;
  const PaymentSuccessfulPage({super.key, required House house})
      : _house = house;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.check_circle,
              color: Colors.white,
              size: 150,
            ),
            const SizedBox(height: 10),
            const Text(
              "Payment Successful",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              "Thank you for adding hope to ${_house.name}",
              style: const TextStyle(color: Colors.white),
            ),
            const SizedBox(height: 60),
            SizedBox(
              width: MediaQuery.of(context).size.width / 1.5,
              child: Button(
                onClick: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LandingPage(),
                    ),
                  );
                },
                title: "Done",
                textColor: AppColors.primaryColor,
                backgroundColor: Colors.white,
              ),
            )
          ],
        ),
      ),
    );
  }
}

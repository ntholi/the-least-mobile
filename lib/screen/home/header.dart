import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 250,
      decoration: BoxDecoration(
        color: Colors.green[300],
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Image.asset("assets/images/donation.png"),
        ),
      ),
    );
  }
}

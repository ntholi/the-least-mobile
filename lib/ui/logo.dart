import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  late double fontSize;

  Logo({Key? key, double fontSize = 60}) : super(key: key) {
    this.fontSize = fontSize;
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      "TheLeast",
      style: TextStyle(
        fontSize: fontSize,
        color: Colors.white,
        fontFamily: 'Righteous',
        shadows: [
          Shadow(
            color: Colors.black.withOpacity(0.3),
            offset: const Offset(1, 1),
          )
        ],
      ),
    );
  }
}

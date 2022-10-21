import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  final double fontSize;

  const Logo({super.key, this.fontSize = 60});

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

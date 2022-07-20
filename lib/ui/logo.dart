import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  Logo({Key? key, Color? color_work_on_it}) : super(key: key) {
    // this.color = color ?? Colors.white;
  }
  // late final Color color;

  @override
  Widget build(BuildContext context) {
    return Text(
      "TheLeast",
      style: TextStyle(
        fontSize: 60,
        color: Colors.white,
        fontFamily: 'Righteous',
        shadows: [
          Shadow(
            color: Colors.black.withOpacity(0.5),
            offset: const Offset(2, 2),
          )
        ],
      ),
    );
  }
}

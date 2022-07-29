import 'package:flutter/material.dart';
import 'package:theleast/ui/colors.dart';

class Button extends StatelessWidget {
  Button(this.title, {required this.onClick, bool? whiteBackground, Key? key})
      : super(key: key) {
    if (whiteBackground == null) {
      this.whiteBackground = false;
    } else {
      this.whiteBackground = whiteBackground;
    }
  }

  late final bool whiteBackground;
  final String title;
  final VoidCallback onClick;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        border: Border.all(color: Colors.white),
        color: whiteBackground ? Colors.white : AppColors.primaryColor,
      ),
      child: MaterialButton(
        onPressed: onClick,
        child: Text(
          title.toUpperCase(),
          style: TextStyle(
            color: (whiteBackground ? AppColors.primaryColor : Colors.white),
          ),
        ),
      ),
    );
  }
}

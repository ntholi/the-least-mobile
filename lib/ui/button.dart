// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:theleast/ui/colors.dart';

class Button extends StatelessWidget {
  final String title;
  final VoidCallback onClick;
  final Color backgroundColor;
  final Color textColor;
  final bool disabled;

  const Button({
    Key? key,
    required this.title,
    required this.onClick,
    this.backgroundColor = AppColors.primaryColor,
    this.textColor = Colors.white,
    this.disabled = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        border: Border.all(color: Colors.white),
        color: backgroundColor,
      ),
      child: TextButton(
        onPressed: disabled ? null : onClick,
        child: Text(
          title.toUpperCase(),
          style: TextStyle(
            color: textColor,
          ),
        ),
      ),
    );
  }
}

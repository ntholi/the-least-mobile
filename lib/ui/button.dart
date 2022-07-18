import 'package:flutter/material.dart';
import 'package:theleast/ui/colors.dart';

class Button extends StatelessWidget {
  const Button(this.title, {required this.onClick, Key? key}) : super(key: key);

  final String title;
  final VoidCallback onClick;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      width: MediaQuery.of(context).size.width / 1.4,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        color: AppColors.primaryColor,
      ),
      child: MaterialButton(
        onPressed: onClick,
        child: Text(
          title,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}

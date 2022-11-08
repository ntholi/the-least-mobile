// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:theleast/ui/colors.dart';

class CustomFloatingButton extends Button {
  const CustomFloatingButton({
    Key? key,
    super.isProcessing,
    required super.title,
    required super.onClick,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      constraints: const BoxConstraints.expand(height: 48),
      child: super.build(context),
    );
  }
}

class Button extends StatelessWidget {
  final String title;
  final VoidCallback onClick;
  final Color backgroundColor;
  final Color textColor;
  final bool disabled;
  final bool isProcessing;

  const Button(
      {Key? key,
      required this.title,
      required this.onClick,
      this.backgroundColor = AppColors.primaryColor,
      this.textColor = Colors.white,
      this.disabled = false,
      this.isProcessing = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: disabled || isProcessing ? null : onClick,
      style: ButtonStyle(
        backgroundColor: ButtonColor(backgroundColor),
        padding: MaterialStateProperty.all<EdgeInsets>(
          const EdgeInsets.symmetric(vertical: 16),
        ),
      ),
      child: !isProcessing
          ? _createText()
          : Builder(builder: (context) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 16,
                    width: 16,
                    child: CircularProgressIndicator(
                      color: Colors.white,
                      strokeWidth: 2,
                    ),
                  ),
                  const SizedBox(width: 10),
                  _createText(),
                ],
              );
            }),
    );
  }

  Text _createText() {
    return Text(
      title.toUpperCase(),
      style: TextStyle(
        color: textColor,
      ),
    );
  }
}

class ButtonColor extends MaterialStateColor {
  final Color _defaultColor;
  ButtonColor(this._defaultColor) : super(_defaultColor.value);

  @override
  Color resolve(Set<MaterialState> states) {
    if (states.contains(MaterialState.pressed)) {
      return _defaultColor.withAlpha(200);
    }
    if (states.contains(MaterialState.disabled)) {
      return Colors.grey;
    }
    return _defaultColor;
  }
}

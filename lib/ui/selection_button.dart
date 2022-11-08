import 'package:flutter/material.dart';

class SelectionButton<T> extends StatelessWidget {
  final T value;
  final IconData? icon;
  final bool selected;
  final ValueSetter setValue;
  final double height;
  final double? width;
  final TextAlign textAlign;
  final bool showCheckMark;
  final Color? backgroundColor;

  const SelectionButton({
    Key? key,
    required this.value,
    this.icon,
    required this.setValue,
    required this.selected,
    this.height = 60,
    this.width,
    this.textAlign = TextAlign.left,
    this.showCheckMark = false,
    this.backgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () {
        setValue(value);
      },
      style: ButtonStyle(
        backgroundColor: selected
            ? MaterialStateProperty.all<Color>(Colors.green.shade50)
            : MaterialStateProperty.all<Color>(
                backgroundColor ?? Colors.grey.shade50),
        side: selected
            ? MaterialStateProperty.all<BorderSide>(
                BorderSide(color: Colors.green.shade400))
            : MaterialStateProperty.all<BorderSide>(
                BorderSide(color: Colors.grey.shade400)),
      ),
      child: SizedBox(
        height: height,
        width: width,
        child: Row(
          children: [
            if (icon != null)
              Icon(
                icon,
                color: Colors.blueGrey,
              )
            else
              const SizedBox.shrink(),
            SizedBox(width: icon == null ? 0 : 10),
            Expanded(
              child: Text(
                value.toString(),
                textAlign: textAlign,
                style: TextStyle(
                  color: Colors.grey.shade700,
                ),
              ),
            ),
            selected && showCheckMark
                ? const Icon(Icons.check)
                : const SizedBox.shrink()
          ],
        ),
      ),
    );
  }
}

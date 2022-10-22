import 'package:flutter/material.dart';

class SelectionButton<T> extends StatelessWidget {
  final T value;
  final String? icon;
  final bool selected;
  final ValueSetter setValue;
  final double height;
  final double? width;
  final TextAlign textAlign;

  const SelectionButton({
    Key? key,
    required this.value,
    this.icon,
    required this.setValue,
    required this.selected,
    this.height = 60,
    this.width,
    this.textAlign = TextAlign.left,
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
            : null,
        side: selected
            ? MaterialStateProperty.all<BorderSide>(
                BorderSide(color: Colors.green.shade400))
            : null,
      ),
      child: SizedBox(
        height: height,
        width: width,
        child: Row(
          children: [
            icon == null
                ? const SizedBox.shrink()
                : Image.asset('assets/images/$icon', height: 20),
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
            selected ? const Icon(Icons.check) : const SizedBox.shrink()
          ],
        ),
      ),
    );
  }
}

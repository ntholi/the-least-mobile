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
    this.height = 55,
    this.width,
    this.textAlign = TextAlign.left,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        setValue(value);
      },
      child: Container(
        height: height,
        width: width,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          border: Border.all(
            color: selected ? Colors.green.shade400 : Colors.grey.shade300,
          ),
          color: selected ? Colors.green.shade50 : Colors.grey.shade100,
          borderRadius: BorderRadius.circular(10),
        ),
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

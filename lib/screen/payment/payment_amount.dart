import 'package:flutter/material.dart';
import 'package:theleast/ui/selection_button.dart';

const amounts = [30, 80, 200, 500];

class PaymentAmount extends StatelessWidget {
  final buttonSize = 50.0;
  final amountController = TextEditingController();
  PaymentAmount({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: amountController,
          decoration: InputDecoration(
            labelText: "Amount",
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.shade300),
            ),
            border: const OutlineInputBorder(),
          ),
        ),
        Container(
          height: buttonSize + 30,
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: amounts
                .map((value) => Container(
                      margin: const EdgeInsets.only(right: 10),
                      child: SelectionButton(
                        value: value,
                        setValue: (value) {},
                        selected: false,
                        textAlign: TextAlign.center,
                        width: buttonSize,
                        height: buttonSize,
                      ),
                    ))
                .toList(),
          ),
        )
      ],
    );
  }
}

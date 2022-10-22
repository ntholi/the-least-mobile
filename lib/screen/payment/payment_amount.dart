import 'package:flutter/material.dart';
import 'package:theleast/ui/selection_button.dart';

const double m20 = 20;
const double m50 = 50;
const double m100 = 100;
const double m300 = 300;

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
          decoration: const InputDecoration(
            labelText: "Amount",
            border: OutlineInputBorder(),
          ),
        ),
        Container(
          height: buttonSize + 10,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              SelectionButton(
                value: "$m20",
                setValue: (value) {},
                selected: false,
                textAlign: TextAlign.center,
                width: buttonSize,
                height: buttonSize,
              ),
              SelectionButton(
                value: "$m50",
                setValue: (value) {},
                selected: false,
                textAlign: TextAlign.center,
                width: buttonSize,
                height: buttonSize,
              ),
              SelectionButton(
                value: "$m100",
                setValue: (value) {},
                selected: false,
                textAlign: TextAlign.center,
                width: buttonSize,
                height: buttonSize,
              ),
              SelectionButton(
                value: "$m300",
                setValue: (value) {},
                selected: false,
                textAlign: TextAlign.center,
                width: buttonSize,
                height: buttonSize,
              ),
            ],
          ),
        )
      ],
    );
  }
}

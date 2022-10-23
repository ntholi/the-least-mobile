import 'package:flutter/material.dart';
import 'package:theleast/ui/selection_button.dart';

const amounts = [20, 50, 100, 300, 500, 900];

class PaymentAmount extends StatefulWidget {
  final GlobalKey<FormFieldState> amountKey;
  const PaymentAmount({super.key, required this.amountKey});

  @override
  State<PaymentAmount> createState() => _PaymentAmountState();
}

class _PaymentAmountState extends State<PaymentAmount> {
  final amountController = TextEditingController();

  final buttonSize = 50.0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          key: widget.amountKey,
          controller: amountController,
          decoration: const InputDecoration(
            labelText: "Amount",
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey),
            ),
            border: OutlineInputBorder(),
          ),
          validator: (value) {
            if (value == null || double.tryParse(value) == null) {
              return "Enter numeric value";
            }
            return null;
          },
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
                        setValue: (value) {
                          setState(() {
                            amountController.text = value.toString();
                          });
                        },
                        selected:
                            double.tryParse(amountController.text) == value,
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

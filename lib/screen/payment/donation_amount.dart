import 'package:flutter/material.dart';
import 'package:theleast/ui/selection_button.dart';

const amounts = [20, 50, 100, 300, 500, 900];

class PaymentAmount extends StatefulWidget {
  final TextEditingController _amountController;
  const PaymentAmount(
      {super.key, required TextEditingController amountController})
      : _amountController = amountController;

  @override
  State<PaymentAmount> createState() => _PaymentAmountState();
}

class _PaymentAmountState extends State<PaymentAmount> {
  final amountKey = GlobalKey<FormFieldState>();
  final double buttonSize = 40;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          key: amountKey,
          controller: widget._amountController,
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
                .map(
                  (value) => Container(
                    margin: const EdgeInsets.only(right: 10),
                    child: SelectionButton(
                      value: value,
                      setValue: (value) {
                        setState(() {
                          widget._amountController.text = value.toString();
                        });
                      },
                      selected:
                          double.tryParse(widget._amountController.text) ==
                              value,
                      textAlign: TextAlign.center,
                      width: buttonSize,
                      height: buttonSize,
                    ),
                  ),
                )
                .toList(),
          ),
        )
      ],
    );
  }
}

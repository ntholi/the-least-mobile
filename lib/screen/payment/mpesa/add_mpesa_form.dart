import 'package:flutter/material.dart';

class AddMpesaForm extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final ValueSetter setPhoneNumber;
  const AddMpesaForm({
    required this.formKey,
    required this.setPhoneNumber,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBox(
          height: 200,
          child: Image.asset("assets/images/digital-wallet.png"),
        ),
        Text(
          "Add M-Pesa Number",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Colors.blueGrey.shade500,
          ),
        ),
        const SizedBox(height: 10),
        const Text(
          "Please enter the your M-Pesa Phone number to process payment",
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.grey),
        ),
        const SizedBox(height: 30),
        Form(
          key: formKey,
          child: TextFormField(
            onSaved: (value) => setPhoneNumber(value ?? ""),
            keyboardType: TextInputType.phone,
            decoration: const InputDecoration(
              labelText: "Phone Number",
              border: OutlineInputBorder(),
            ),
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return "Cannot be empty";
              }
              return null;
            },
          ),
        ),
      ],
    );
  }
}

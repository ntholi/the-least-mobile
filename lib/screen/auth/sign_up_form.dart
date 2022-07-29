import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:theleast/ui/button.dart';
import 'package:theleast/utils/validations.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({Key? key}) : super(key: key);

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _firstName = TextEditingController();
  final _lastName = TextEditingController();
  final _email = TextEditingController();
  final _password = TextEditingController();
  final _confirmPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextFormField(
            controller: _lastName,
            decoration: const InputDecoration(
              label: Text("Names"),
            ),
          ),
          TextFormField(
            controller: _email,
            validator: (value) => validateEmail(value),
            decoration: const InputDecoration(
              label: Text("Email"),
            ),
          ),
          TextFormField(
            decoration: const InputDecoration(
              label: Text("Password"),
            ),
            obscureText: true,
            validator: (value) => validatePassword(value),
            controller: _password,
          ),
          TextFormField(
            decoration: const InputDecoration(
              label: Text("Confirm Password"),
            ),
            obscureText: true,
            validator: (value) {
              String? msg = validatePassword(value);
              if (msg == null && _password.text != value) {
                return "Passwords Must Match";
              }
              return msg;
            },
            controller: _confirmPassword,
          ),
          SizedBox(height: 20),
          Button(
            "REGISTER",
            onClick: () async {
              log("Signing in..");
            },
          )
        ],
      ),
    );
  }
}

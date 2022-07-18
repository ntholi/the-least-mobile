import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:theleast/colors.dart';
import 'package:theleast/utils/validations.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({Key? key}) : super(key: key);

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  final _formKey = GlobalKey<FormState>();
  final _email = TextEditingController();
  final _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
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
          Container(
            margin: const EdgeInsets.only(top: 20),
            width: MediaQuery.of(context).size.width / 1.4,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(20)),
              color: AppColors.primaryColor,
            ),
            child: MaterialButton(
              child: const Text(
                "SIGN IN",
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  log("Signing in..");
                  // await signin(_email.text, _password.text);
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}

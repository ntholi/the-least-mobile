import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:theleast/ui/button.dart';
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
      child: SizedBox(
        width: MediaQuery.of(context).size.width / 1.4,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
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
            Button(
              "SIGN IN",
              onClick: () async {
                log("Signing in..");
              },
            )
          ],
        ),
      ),
    );
  }
}

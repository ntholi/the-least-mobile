import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:theleast/ui/button.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({Key? key}) : super(key: key);

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  final _email = TextEditingController();
  final _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      child: SizedBox(
        width: MediaQuery.of(context).size.width / 1.4,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
              controller: _email,
              decoration: const InputDecoration(
                label: Text("Email"),
              ),
            ),
            TextFormField(
              decoration: const InputDecoration(
                label: Text("Password"),
              ),
              obscureText: true,
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

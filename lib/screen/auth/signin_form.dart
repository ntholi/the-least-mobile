import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:theleast/service/auth/auth_service.dart';
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
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
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
            const SizedBox(height: 20),
            Button(
              "SIGN IN",
              onClick: () async {
                await signin(_email.text, _password.text);
                if (!mounted) return;
                Navigator.of(context).pop();
              },
            )
          ],
        ),
      ),
    );
  }
}

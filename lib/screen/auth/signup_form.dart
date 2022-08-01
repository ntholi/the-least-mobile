import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:theleast/service/user/user.dart';
import 'package:theleast/service/user/user_service.dart';
import 'package:theleast/ui/button.dart';
import 'package:theleast/utils/validations.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({Key? key}) : super(key: key);

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();
  final _firstName = TextEditingController();
  final _lastName = TextEditingController();
  final _email = TextEditingController();
  final _password = TextEditingController();
  final _confirmPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              controller: _firstName,
              decoration: const InputDecoration(
                label: Text("First Name"),
              ),
            ),
            TextFormField(
              controller: _lastName,
              decoration: const InputDecoration(
                label: Text("Last Name"),
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
                if (_password.text != value) {
                  return "Passwords Must Match";
                }
                return null;
              },
              controller: _confirmPassword,
            ),
            const SizedBox(height: 20),
            Button(
              "REGISTER",
              onClick: () async {
                if (_formKey.currentState!.validate()) {
                  User user = User(
                    _firstName.text,
                    _lastName.text,
                    _email.text,
                    _password.text,
                  );
                  await createUser(user);
                  if (!mounted) return;
                  Navigator.of(context).pop();
                }
              },
            )
          ],
        ),
      ),
    );
  }
}

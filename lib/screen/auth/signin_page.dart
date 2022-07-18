import 'package:flutter/material.dart';
import 'package:theleast/screen/auth/signin_form.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SignInForm(),
    );
  }
}

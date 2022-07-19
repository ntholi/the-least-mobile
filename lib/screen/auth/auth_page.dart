import 'package:flutter/material.dart';
import 'package:theleast/ui/button.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Image.asset("images/logo.png"),
          Button("Sign Up", onClick: () {}),
          Button("Sign In", whiteBackground: true, onClick: () {}),
        ],
      ),
    );
  }
}

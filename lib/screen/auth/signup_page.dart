import 'package:flutter/material.dart';
import 'package:theleast/screen/auth/signup_form.dart';
import 'package:theleast/ui/colors.dart';
import 'package:theleast/ui/logo.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 30,
            child: Container(
              color: AppColors.primaryColor,
              child: Center(child: Logo(fontSize: 50)),
            ),
          ),
          Expanded(
            flex: 70,
            child: Container(
              width: MediaQuery.of(context).size.width / 1.4,
              alignment: Alignment.center,
              child: const SignUpForm(),
            ),
          )
        ],
      ),
    );
  }
}

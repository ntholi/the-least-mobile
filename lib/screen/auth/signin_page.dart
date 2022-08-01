import 'package:flutter/material.dart';
import 'package:theleast/screen/auth/signin_form.dart';
import 'package:theleast/ui/colors.dart';
import 'package:theleast/ui/logo.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 45,
            child: Container(
              color: AppColors.primaryColor,
              child: Center(child: Logo(fontSize: 50)),
            ),
          ),
          Expanded(
            flex: 55,
            child: Container(
              width: MediaQuery.of(context).size.width / 1.4,
              alignment: Alignment.center,
              child: const SignInForm(),
            ),
          )
        ],
      ),
    );
  }
}

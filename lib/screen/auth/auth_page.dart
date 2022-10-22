import 'package:flutter/material.dart';
import 'package:theleast/screen/auth/signin_page.dart';
import 'package:theleast/screen/auth/signup_page.dart';
import 'package:theleast/ui/button.dart';
import 'package:theleast/ui/colors.dart';
import 'package:theleast/ui/logo.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: SizedBox(
              width: double.maxFinite,
              child: Center(child: Logo()),
            ),
          ),
          Container(
            height: 200,
            width: MediaQuery.of(context).size.width / 1.4,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Button(
                    title: "Sign Up",
                    backgroundColor: Colors.white,
                    textColor: AppColors.primaryColor,
                    onClick: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SignUpPage(),
                        ),
                      );
                    }),
                const SizedBox(height: 20),
                Button(
                    title: "Sign In",
                    onClick: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SignInPage(),
                        ),
                      );
                    }),
              ],
            ),
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:theleast/screen/auth/signin_page.dart';
import 'package:theleast/ui/button.dart';
import 'package:theleast/ui/colors.dart';
import 'package:theleast/ui/logo.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 4,
            child: Container(
              width: double.maxFinite,
              decoration: BoxDecoration(
                color: AppColors.primaryColor,
                borderRadius: const BorderRadius.only(
                  bottomRight: Radius.circular(90),
                ),
              ),
              child: Center(child: Logo()),
            ),
          ),
          Expanded(
            flex: 6,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Button("Sign Up", whiteBackground: true, onClick: () {}),
                Button("Sign In", onClick: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SignInPage(),
                    ),
                  );
                }),
                const SizedBox(height: 50),
                const Text(
                  "Or sign in with Social Media",
                  style: TextStyle(color: Colors.grey),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.facebook_rounded,
                        color: AppColors.primaryColor,
                        size: 35,
                      ),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
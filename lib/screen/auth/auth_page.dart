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
      backgroundColor: AppColors.primaryColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Container(
              width: double.maxFinite,
              decoration: BoxDecoration(
                color: AppColors.primaryColor,
                // borderRadius: const BorderRadius.only(
                //   bottomRight: Radius.circular(90),
                // ),
              ),
              child: Center(child: Logo()),
            ),
          ),
          SizedBox(
            height: 200,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
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
              ],
            ),
          )
        ],
      ),
    );
  }
}

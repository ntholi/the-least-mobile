import 'package:flutter/material.dart';
import 'package:theleast/service/auth_service.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              decoration: const InputDecoration(
                label: Text("Username"),
              ),
              controller: _email,
            ),
            TextField(
              decoration: const InputDecoration(
                label: Text("Password"),
              ),
              obscureText: true,
              controller: _password,
            ),
            Container(
              margin: const EdgeInsets.only(top: 20),
              width: MediaQuery.of(context).size.width / 1.4,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              child: MaterialButton(
                  onPressed: () async {
                    await signin(_email.text, _password.text);
                  },
                  child: const Text("SignIn")),
            ),
          ],
        ),
      ),
    );
  }
}

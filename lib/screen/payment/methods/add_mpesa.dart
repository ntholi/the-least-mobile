import 'package:flutter/material.dart';
import 'package:theleast/ui/button.dart';
import 'package:theleast/ui/colors.dart';

class AddMpesaPage extends StatelessWidget {
  const AddMpesaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Stack(
            children: [
              SizedBox(
                height: 250,
                child: AppBar(
                  title: const Text("M-Pesa"),
                  elevation: 0,
                ),
              ),
              Container(
                height: 70,
                margin: const EdgeInsets.only(top: 80),
                child: const Center(
                  child: SizedBox(
                    // child: Image.asset('assets/images/mpesa.png'),
                    child: Icon(
                      size: 130,
                      Icons.phone_android,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: ColoredBox(
              color: AppColors.primaryColor,
              child: Container(
                padding: const EdgeInsets.only(top: 80, left: 30, right: 30),
                decoration: BoxDecoration(
                  color: Colors.grey.shade50,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50),
                  ),
                ),
                child: SingleChildScrollView(
                  child: Form(
                    child: Column(
                      children: [
                        TextFormField(
                          decoration: const InputDecoration(
                            labelText: "Phone Number",
                            border: OutlineInputBorder(),
                          ),
                        ),
                        const SizedBox(height: 20),
                        TextFormField(
                          obscureText: true,
                          decoration: const InputDecoration(
                            labelText: "Password",
                            border: OutlineInputBorder(),
                          ),
                        ),
                        const SizedBox(height: 50),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 30,
              vertical: 16,
            ),
            child: Button(title: "Save", onClick: () {}),
          )
        ],
      ),
    );
  }
}

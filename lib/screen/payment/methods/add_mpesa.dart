import 'package:flutter/material.dart';
import 'package:theleast/ui/button.dart';
import 'package:theleast/ui/colors.dart';

class AddMpesaPage extends StatelessWidget {
  const AddMpesaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        SizedBox(
          height: 180,
          child: AppBar(
            title: const Text("Add M-Pesa Number"),
            elevation: 0,
          ),
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
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      TextFormField(
                        decoration: const InputDecoration(
                          labelText: "Phone Number",
                          border: OutlineInputBorder(),
                        ),
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        decoration: const InputDecoration(
                          labelText: "Password",
                          border: OutlineInputBorder(),
                        ),
                      ),
                      const SizedBox(height: 50),
                      Button(title: "Save", onClick: () {})
                    ],
                  ),
                ),
              ),
            ),
          ),
        )
      ]),
    );
  }
}

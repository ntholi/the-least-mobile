import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: const [
          Expanded(
            child: Text("Hello Thabo",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                )),
          ),
          CircleAvatar(
            backgroundImage: AssetImage('assets/images/avatar.jpg'),
          ),
        ],
      ),
    );
  }
}

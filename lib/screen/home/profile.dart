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
            child: Text("TheLeast",
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Righteous',
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                )),
          ),
          CircleAvatar(
            radius: 15,
            backgroundImage: AssetImage('assets/images/avatar.jpg'),
          ),
        ],
      ),
    );
  }
}

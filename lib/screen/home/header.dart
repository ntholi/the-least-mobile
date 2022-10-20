import 'package:flutter/material.dart';
import 'package:theleast/screen/home/profile.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height / 4,
      decoration: BoxDecoration(
        color: Colors.green[300],
      ),
      child: Stack(
        children: [
          const Profile(),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Center(
              child: Padding(
                //TODO: test left padding on a different screen
                padding: const EdgeInsets.only(left: 20),
                child: Image.asset("assets/images/donation.png"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

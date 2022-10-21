import 'package:flutter/material.dart';
import 'package:theleast/ui/prograss_bar.dart';

class GoalInfo extends StatelessWidget {
  final double donated;
  final double target;

  const GoalInfo({super.key, required this.donated, required this.target});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Text(
              "Donated",
              style: TextStyle(color: Colors.grey),
            ),
            Text(
              "Target",
              style: TextStyle(color: Colors.grey),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "M$donated",
              style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 24),
            ),
            Text(
              "M$target",
              style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 24),
            ),
          ],
        ),
        Container(height: 20, child: ProgressBar(donated, target)),
      ],
    );
  }
}

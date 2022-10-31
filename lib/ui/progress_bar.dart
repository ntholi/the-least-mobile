import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import 'colors.dart';

class ProgressBar extends StatelessWidget {
  final num? value;
  final num? total;
  final double lineHeight;

  const ProgressBar(this.value, this.total, {super.key, this.lineHeight = 9});

  @override
  Widget build(BuildContext context) {
    double percent = 0;
    if (value != null && total != null) {
      percent = value! / total!;
    }

    return LinearPercentIndicator(
      lineHeight: lineHeight,
      percent: percent > 1 ? 1 : percent,
      backgroundColor: Colors.grey.shade100,
      progressColor: AppColors.primaryColor.shade400,
      padding: EdgeInsets.zero,
    );
  }
}

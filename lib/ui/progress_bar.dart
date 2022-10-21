import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import 'colors.dart';

class ProgressBar extends StatelessWidget {
  final double value;
  final double total;
  final double lineHeight;

  const ProgressBar(this.value, this.total, {super.key, this.lineHeight = 9});

  @override
  Widget build(BuildContext context) {
    return LinearPercentIndicator(
      lineHeight: lineHeight,
      percent: value / total,
      backgroundColor: Colors.grey.shade200,
      progressColor: AppColors.primaryColor,
      padding: EdgeInsets.zero,
    );
  }
}

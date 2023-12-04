import 'package:flutter/material.dart';
import 'package:progresso/progresso.dart';
import 'package:shamaa/style/custom_colors.dart';

class ProgressBar extends StatelessWidget {
  const ProgressBar({
    super.key,
    required this.progress,
  });
  final double progress;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 28),
      child: Progresso(
          progress: progress,
          progressStrokeCap: StrokeCap.round,
          backgroundStrokeCap: StrokeCap.round,
          backgroundColor: ExtraLightGrey,
          progressColor: purple,
          backgroundStrokeWidth: 10.0),
    );
  }
}

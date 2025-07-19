import 'package:flutter/material.dart';
import 'package:simple_circular_progress_bar/simple_circular_progress_bar.dart';

class PProgressBar extends StatelessWidget {
  const PProgressBar({
    super.key,
    this.size,
    this.progressColors,
    this.backColor,
    this.fullProgressColor
  });

  final double? size;
  final List<Color>? progressColors;
  final Color? backColor;
  final Color? fullProgressColor;


  @override
  Widget build(BuildContext context) {
    return SimpleCircularProgressBar(
      size: size ?? 25,
      progressColors: progressColors ?? [],
      backColor: backColor ?? Colors.grey,
      fullProgressColor: fullProgressColor ?? Colors.orangeAccent,
    );
  }
}


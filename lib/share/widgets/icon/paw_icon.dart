import 'package:flutter/material.dart';

class PAccountAvatarIcon extends StatelessWidget {
  const PAccountAvatarIcon({
    super.key,
    this.color,
    this.size,
    this.weight
  });

  final Color? color;
  final double? size;
  final double? weight;

  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.account_circle_outlined,
      color: color ?? Colors.white,
      size: size ?? 25,
      weight: weight ?? 25,
    );
  }
}

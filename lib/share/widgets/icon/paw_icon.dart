import 'package:flutter/material.dart';
import 'package:paw_fund_shelter_owner/share/bootstrap/utils/paw_utils.dart';

class PIcon extends StatelessWidget {
  const PIcon({
    super.key,

    this.iconData,

    this.iconButtonData,

    this.color,
    this.size,
    this.weight,

    this.isButton,
    this.onPress
  });

  final IconData? iconData;
  final IconData? iconButtonData;
  final Color? color;
  final double? size;
  final double? weight;

  final bool? isButton;
  final VoidCallback? onPress;

  @override
  Widget build(BuildContext context) {

    return PWidgetUtils.chooseWithCondition(
        PObjectUtils.requiredNonNullOrElse(isButton, false),
        IconButton(
            onPressed: onPress,
            icon: Icon(
              iconButtonData,
              color: color ?? Colors.white,
              size: size ?? 25,
              weight: weight ?? 25,
            )
        ),
        Icon(
          iconData,
          color: color ?? Colors.white,
          size: size ?? 25,
          weight: weight ?? 25,
        )
    );
  }
}

import 'package:flutter/material.dart';
import 'package:paw_fund_shelter_owner/share/constans/paw_constant.dart';
import 'package:paw_fund_shelter_owner/share/utils/paw_utils.dart';

class PMenuItem extends StatelessWidget {
  const PMenuItem({
    super.key,
    required this.child,
    this.paddingLeft,
    this.paddingRight,
    this.paddingBottom,
    this.paddingTop,
    this.paddingAll,
    this.height,
    this.width,
    this.backgroundColor
  });

  final Widget child;

  final double? paddingLeft;
  final double? paddingRight;
  final double? paddingTop;
  final double? paddingBottom;
  final double? paddingAll;

  final double? height;
  final double? width;

  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: PObjectUtils.isNotNull(paddingAll) ? EdgeInsets.all(paddingAll!)
          : EdgeInsets.only(
          left: PObjectUtils.requiredNonNullOrElse(paddingLeft, 20),
          right: PObjectUtils.requiredNonNullOrElse(paddingRight, 20),
          top: PObjectUtils.requiredNonNullOrElse(paddingTop, 20) ,
          bottom: PObjectUtils.requiredNonNullOrElse(paddingBottom, 20)
      ),
      child: Container(
        height: PObjectUtils.requiredNonNullOrElse(height, 300),
        width: PObjectUtils.requiredNonNullOrElse(width, 150),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
            color: PObjectUtils.requiredNonNullOrElse(backgroundColor, PConstant.transparent)
        ),
        child: Center(
          child: child,
        ),
      ),
    );
  }
}

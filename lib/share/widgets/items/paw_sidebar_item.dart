import 'package:flutter/material.dart';
import 'package:paw_fund_shelter_owner/share/constans/paw_constant.dart';
import 'package:paw_fund_shelter_owner/share/utils/paw_utils.dart';
import 'package:paw_fund_shelter_owner/share/widgets/items/paw_menu_items.dart';
import 'package:paw_fund_shelter_owner/share/widgets/text/paw_text.dart';

class PSideBarItem extends StatelessWidget {
  const PSideBarItem({
    super.key,
    this.backgroundColor,
    this. borderRadius,
    required this.onTap,
    required this.onHover,
    this.menuPaddingLeft,
    this.menuPaddingRight,
    this.menuPaddingBottom,
    this.menuPaddingTop,
    this.marginLeft,
    this.marginRight,
    this.marginBottom,
    this.marginTop,
    this.width,
    this.height,
    required this.title,
    this.fontWeight,
    this.fontSize,
    this.textColor,
    this.wordSpacing
  });

  final Color? backgroundColor;
  final double? borderRadius;
  final VoidCallback onTap;
  final ValueChanged<bool> onHover;
  final double? menuPaddingLeft;
  final double? menuPaddingRight;
  final double? menuPaddingBottom;
  final double? menuPaddingTop;
  final double? marginLeft;
  final double? marginRight;
  final double? marginTop;
  final double? marginBottom;
  final double? width;
  final double? height;
  final String title;
  final FontWeight? fontWeight;
  final double? fontSize;
  final Color? textColor;
  final double? wordSpacing;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          left: PObjectUtils.requiredNonNullOrElse(marginLeft, 10.0),
          right: PObjectUtils.requiredNonNullOrElse(marginRight, 10.0),
          top: PObjectUtils.requiredNonNullOrElse(marginTop, 5.0),
          bottom: PObjectUtils.requiredNonNullOrElse(marginBottom, 5.0)
      ),
      decoration: BoxDecoration(
        color: PObjectUtils.requiredNonNullOrElse(backgroundColor, PConstant.transparent),
        borderRadius: BorderRadius.circular(PObjectUtils.requiredNonNullOrElse(borderRadius, 10.0)),
      ),
      child: InkWell(
        onTap: onTap,
        onHover: onHover,
        child: PText(
          content: title,
          wordSpacing: PObjectUtils.requiredNonNullOrElse(wordSpacing, 2.0),
          fontWeight: PObjectUtils.requiredNonNullOrElse(fontWeight, FontWeight.bold),
          fontSize: PObjectUtils.requiredNonNullOrElse(fontSize, 15),
          textColor: PObjectUtils.requiredNonNullOrElse(textColor, PConstant.black),
        ),
      ),
    );
  }
}

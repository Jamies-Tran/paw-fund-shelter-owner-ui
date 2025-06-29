import 'package:flutter/material.dart';
import 'package:paw_fund_shelter_owner/share/constans/paw_constant.dart';
import 'package:paw_fund_shelter_owner/share/utils/paw_utils.dart';

class PText extends StatelessWidget {
  const PText({
    super.key,
    required this.content,
    this.textAlign,
    this.textOverflow,
    this.fontWeight,
    this.textDecoration,
    this.textColor,
    this.backgroundColor,
    this.wordSpacing,
    this.fontFamily,
    this.fontSize
  });

  final String content;

  final TextAlign? textAlign;

  final TextOverflow? textOverflow;
  final FontWeight? fontWeight;
  final TextDecoration? textDecoration;
  final Color? textColor;
  final Color? backgroundColor;
  final double? wordSpacing;
  final String? fontFamily;
  final double? fontSize;

  @override
  Widget build(BuildContext context) {
    return Text(
      content,
      style: TextStyle(
        overflow: PObjectUtils.requiredNonNullOrElse(textOverflow, TextOverflow.fade),
        fontWeight: PObjectUtils.requiredNonNullOrElse(fontWeight, FontWeight.normal),
        decoration: PObjectUtils.requiredNonNullOrElse(textDecoration, TextDecoration.none),
        color: PObjectUtils.requiredNonNullOrElse(textColor, PConstant.black),
        backgroundColor: PObjectUtils.requiredNonNullOrElse(backgroundColor, PConstant.transparent),
        wordSpacing: PObjectUtils.requiredNonNullOrElse(wordSpacing, 1.0),
        fontSize: PObjectUtils.requiredNonNullOrElse(fontSize, 10),
      ),
      textAlign: textAlign ?? TextAlign.center,
    );
  }
}

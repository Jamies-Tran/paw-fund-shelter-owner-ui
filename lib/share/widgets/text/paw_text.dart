import 'package:flutter/material.dart';
import 'package:paw_fund_shelter_owner/share/bootstrap/utils/paw_utils.dart';
import 'package:paw_fund_shelter_owner/share/constans/paw_constant.dart';

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

class PTextFormField extends StatelessWidget {
  const PTextFormField({
    super.key,

    required this.labelText,
    required this.hintText,
    required this.suffixIcon,

    this.obscureText,
    this.labelColor,
    this.labelFontSize,
    this.wordSpacing,
    this.fontStyle,
    this.enableBorderColor,
    this.focusBorderColor,
    this.enableBorderStyle,
    this.focusBorderStyle,
    this.enableBorderRadius,
    this.focusBorderRadius,
    this.width,
    this.textInputType,

    this.validate,
    this.onChanged,
    this.onTap,
    this.onTapOutside
  });

  final String labelText;
  final String hintText;
  final Icon suffixIcon;

  final bool? obscureText;
  final Color? labelColor;
  final double? labelFontSize;
  final double? wordSpacing;
  final FontStyle? fontStyle;
  final Color? enableBorderColor;
  final Color? focusBorderColor;
  final BorderStyle? enableBorderStyle;
  final BorderStyle? focusBorderStyle;
  final double? enableBorderRadius;
  final double? focusBorderRadius;
  final double? width;
  final TextInputType? textInputType;


  final FormFieldValidator<String>? validate;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onTap;
  final ValueChanged<PointerDownEvent>? onTapOutside;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: PObjectUtils.requiredNonNullOrElse(width, 200),
      child: TextFormField(
        obscureText: PObjectUtils.requiredNonNullOrElse(obscureText, false),
        keyboardType: PObjectUtils
            .requiredNonNullOrElse(textInputType, TextInputType.text),
        autovalidateMode: AutovalidateMode.onUserInteraction,
        decoration: InputDecoration(
          labelText: labelText,
          labelStyle: TextStyle(
            color: PObjectUtils.requiredNonNullOrElse(
                labelColor, PConstant.orangeAccent),
            fontSize: PObjectUtils.requiredNonNullOrElse(labelFontSize, 15.0),
            wordSpacing: PObjectUtils.requiredNonNullOrElse(wordSpacing, 1.0),
            fontStyle: PObjectUtils.requiredNonNullOrElse(fontStyle, FontStyle.normal),
          ),
          hintText: hintText,
          hintFadeDuration: Duration(seconds: 1),
          hintStyle: TextStyle(
            color: Color(Colors.grey.shade400.toARGB32())
          ),
          suffixIcon: suffixIcon,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: PObjectUtils.requiredNonNullOrElse(
                    enableBorderColor, Color(PConstant.black.toARGB32())),
                style: PObjectUtils.requiredNonNullOrElse(enableBorderStyle,
                    BorderStyle.solid),
            ),
            borderRadius: BorderRadius.circular(PObjectUtils
                .requiredNonNullOrElse(enableBorderRadius, 1.0))
          ),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: PObjectUtils.requiredNonNullOrElse(
                      focusBorderColor, Color(PConstant.black.toARGB32())),
                  style: PObjectUtils.requiredNonNullOrElse(enableBorderStyle,
                      BorderStyle.solid)
              ),
              borderRadius: BorderRadius.circular(PObjectUtils
                  .requiredNonNullOrElse(focusBorderRadius, 1.0))
          ),
        ),
        validator: validate,
        onChanged: onChanged,
        onTap: onTap,
        onTapOutside: onTapOutside,
      ),
    );
  }
}

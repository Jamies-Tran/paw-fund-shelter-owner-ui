import 'package:flutter/material.dart';
import 'package:paw_fund_shelter_owner/share/bootstrap/utils/paw_utils.dart';
import 'package:paw_fund_shelter_owner/share/constans/paw_constant.dart';

class PButton extends StatelessWidget {
  const PButton({
    super.key,
    required this.onPress,
    required this.title,
    this.backgroundColor,
    this.shadowColor,
    this.padding,
    this.shape,

    this.width,
    this.height
  });

  final VoidCallback onPress;
  final Widget title;
  final Color? backgroundColor;
  final Color? shadowColor;
  final EdgeInsetsGeometry? padding;
  final OutlinedBorder? shape;

  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: PObjectUtils.requiredNonNullOrElse(width, 50),
      height: PObjectUtils.requiredNonNullOrElse(height, 50),
      child: ElevatedButton(
          onPressed: onPress,
          style: ElevatedButton.styleFrom(
            backgroundColor: PObjectUtils.requiredNonNullOrElse(backgroundColor, PConstant.transparent),
            shadowColor: PObjectUtils.requiredNonNullOrElse(shadowColor, PConstant.transparent),
            padding: PObjectUtils.requiredNonNullOrElse(padding, EdgeInsets.symmetric(horizontal: 40, vertical: 16)) ,
            shape: PObjectUtils.requiredNonNullOrElse(
              shape,
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(PConstant.circular)
            ),)
          ),
          child: title,
      ),
    );
  }
}

class PHoverButton extends StatelessWidget {
  const PHoverButton({
    super.key,
    required this.onPress,
    required this.title,

    this.backgroundColor,
    this.backgroundColorHover,

    this.shadowColor,
    this.shadowColorHover,

    this.padding,
    this.paddingHover,

    this.shape,
    this.shapeHover,

    this.width,
    this.widthHover,

    this.height,
    this.heightHover,

    this.textSize,
    this.textSizeHover,

    this.textColor,
    this.textColorHover,

    this.fontWeight,
    this.fontWeightHover
  });

  final VoidCallback onPress;
  final Widget title;
  final Color? backgroundColor;
  final Color? backgroundColorHover;
  final Color? shadowColor;
  final Color? shadowColorHover;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? paddingHover;
  final OutlinedBorder? shape;
  final OutlinedBorder? shapeHover;

  final double? width;
  final double? widthHover;
  final double? height;
  final double? heightHover;

  final double? textSize;
  final double? textSizeHover;

  final Color? textColor;
  final Color? textColorHover;

  final FontWeight? fontWeight;
  final FontWeight? fontWeightHover;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: PObjectUtils.requiredNonNullOrElse(width, 50),
      height: PObjectUtils.requiredNonNullOrElse(height, 50),
      child: ElevatedButton(
        onPressed: onPress,
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.resolveWith((states) {
                if (states.contains(WidgetState.hovered)) {
                  return PObjectUtils.requiredNonNullOrElse(backgroundColorHover, backgroundColor);
                }
                
                return backgroundColor;
          }),
          shadowColor: WidgetStateProperty.resolveWith((states) {
            if (states.contains(WidgetState.hovered)) {
              return PObjectUtils.requiredNonNullOrElse(shadowColorHover, shadowColor);
            }
            
            return shadowColor;
          },),
          shape: WidgetStateProperty.resolveWith((states) {
            if (states.contains(WidgetState.hovered)) {
              return PObjectUtils.requiredNonNullOrElse(shapeHover, shape);
            }
            
            return shape;
          },),
          fixedSize: WidgetStateProperty.resolveWith((states) {
            if (states.contains(WidgetState.hovered)) {
              return Size(
                  PObjectUtils.requiredNonNullOrElse(widthHover, width!),
                  PObjectUtils.requiredNonNullOrElse(heightHover, height!)
              );
            }

            return Size(width!, height!);
          },),
          textStyle: WidgetStateProperty.resolveWith((states) {
            if (states.contains(WidgetState.hovered)) {
              return TextStyle(
                fontSize: PObjectUtils.requiredNonNullOrElse(textSizeHover, textSize),
                fontWeight: PObjectUtils.requiredNonNullOrElse(fontWeightHover, fontWeight)
              );
            }

            return TextStyle(
                fontSize: textSize,
                fontWeight: fontWeight
            );
          },),
          foregroundColor: WidgetStateProperty.resolveWith((states) {
            if (states.contains(WidgetState.hovered)) {
              return PObjectUtils.requiredNonNullOrElse(textColorHover, textColor);
            }

            return textColor;
          },)
        ),

        child: title,
      ),
    );
  }
}

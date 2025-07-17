import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:paw_fund_shelter_owner/share/bootstrap/utils/paw_utils.dart';
import 'package:paw_fund_shelter_owner/share/constans/paw_constant.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

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

    this.controller,

    this.enable,
    this.readOnly,

    required this.labelText,
    required this.hintText,
    required this.suffixIcon,

    this.obscureText,
    this.labelColor,
    this.labelFontSize,
    this.wordSpacing,
    this.fontStyle,
    this.enableBorderColor,
    this.errorBorderColor,
    this.focusBorderColor,
    this.focusErrorBorderColor,
    this.enableBorderStyle,
    this.errorBorderStyle,
    this.focusBorderStyle,
    this.focusErrorBorderStyle,
    this.enableBorderRadius,
    this.focusBorderRadius,
    this.width,
    this.textInputType,

    this.validate,
    this.onChanged,
    this.onTap,
    this.onTapOutside
  });
  final TextEditingController? controller;

  final bool? enable;
  final bool? readOnly;

  final String labelText;
  final String hintText;
  final Widget suffixIcon;

  final bool? obscureText;
  final Color? labelColor;
  final double? labelFontSize;
  final double? wordSpacing;
  final FontStyle? fontStyle;
  final Color? enableBorderColor;
  final Color? errorBorderColor;
  final Color? focusBorderColor;
  final Color? focusErrorBorderColor;
  final BorderStyle? enableBorderStyle;
  final BorderStyle? errorBorderStyle;
  final BorderStyle? focusBorderStyle;
  final BorderStyle? focusErrorBorderStyle;
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
        controller: controller,
        enabled: PObjectUtils.requiredNonNullOrElse(enable, true),
        readOnly: PObjectUtils.requiredNonNullOrElse(readOnly, false),
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
                  style: PObjectUtils.requiredNonNullOrElse(focusBorderStyle,
                      BorderStyle.solid)
              ),
              borderRadius: BorderRadius.circular(PObjectUtils
                  .requiredNonNullOrElse(focusBorderRadius, 1.0))
          ),
          errorBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: PObjectUtils.requiredNonNullOrElse(
                      errorBorderColor, Color(Colors.red.toARGB32())),
                  style: PObjectUtils.requiredNonNullOrElse(errorBorderStyle,
                      BorderStyle.solid)
              ),
               borderRadius: BorderRadius.circular(PObjectUtils
                  .requiredNonNullOrElse(focusBorderRadius, 1.0))
          ),
          focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: PObjectUtils.requiredNonNullOrElse(
                      focusErrorBorderColor, Color(PConstant.red.toARGB32())),
                  style: PObjectUtils.requiredNonNullOrElse(focusErrorBorderStyle,
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


class PDateRangePicker extends StatefulWidget {
  const PDateRangePicker({
    super.key,

    this.controller,
    this.enable,

    required this.labelText,
    required this.hintText,
    required this.suffixIcon,

    this.obscureText,
    this.labelColor,
    this.labelFontSize,
    this.wordSpacing,
    this.fontStyle,
    this.enableBorderColor,
    this.errorBorderColor,
    this.focusBorderColor,
    this.focusErrorBorderColor,
    this.enableBorderStyle,
    this.errorBorderStyle,
    this.focusBorderStyle,
    this.focusErrorBorderStyle,
    this.enableBorderRadius,
    this.focusBorderRadius,
    this.width,
    this.textInputType,

    this.backgroundColor,
    this.selectionColor,
    this.selectionMode,
    this.initialSelectDate,
    this.initialSelectDates,
    this.initialSelectDateRange,
    this.showTodayButton,
    this.showActionButtons,
    this.dateRangePickerView,
    this.minDate,
    this.maxDate,

    this.validate,
    this.onChanged,
    this.onSelectionChanged
  });

  final bool? enable;

  final TextEditingController? controller;

  final String labelText;
  final String hintText;
  final Widget suffixIcon;

  final bool? obscureText;
  final Color? labelColor;
  final double? labelFontSize;
  final double? wordSpacing;
  final FontStyle? fontStyle;
  final Color? enableBorderColor;
  final Color? errorBorderColor;
  final Color? focusBorderColor;
  final Color? focusErrorBorderColor;
  final BorderStyle? enableBorderStyle;
  final BorderStyle? errorBorderStyle;
  final BorderStyle? focusBorderStyle;
  final BorderStyle? focusErrorBorderStyle;
  final double? enableBorderRadius;
  final double? focusBorderRadius;
  final double? width;
  final TextInputType? textInputType;
  final bool? showActionButtons;
  final DateRangePickerView? dateRangePickerView;
  final bool? showTodayButton;

  final Color? backgroundColor;
  final Color? selectionColor;
  final DateRangePickerSelectionMode? selectionMode;
  final DateTime? initialSelectDate;
  final List<DateTime>? initialSelectDates;
  final List<PickerDateRange>? initialSelectDateRange;
  final DateTime? minDate;
  final DateTime? maxDate;
  
  final FormFieldValidator<String>? validate;
  final ValueChanged<String>? onChanged;
  final ValueChanged<DateRangePickerSelectionChangedArgs>? onSelectionChanged;

  @override
  State<PDateRangePicker> createState() => _PDateRangePickerState();
}

class _PDateRangePickerState extends State<PDateRangePicker> {
  OverlayEntry? _overlayEntry;
  final LayerLink _layerLink = LayerLink();
  
  
  void _closeDateRangePicker() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }

  void _showDateRangePicker() {
    DateTime minDate = PObjectUtils.requiredNonNullOrElse(widget.minDate, DateTime.now());
    _overlayEntry = OverlayEntry(
      builder: (context) {
        return Positioned(
          width: 410,
          child: CompositedTransformFollower(
            link: _layerLink,
            showWhenUnlinked: false,
            offset: Offset(0, 50),
            child: Material(
              elevation: 4,
              child: SfDateRangePicker(
                selectionMode: PObjectUtils
                    .requiredNonNullOrElse(widget.selectionMode, DateRangePickerSelectionMode.single),
                selectionColor: PObjectUtils
                    .requiredNonNullOrElse(widget.selectionColor, Color(Colors.white54.toARGB32())),
                backgroundColor: PObjectUtils
                    .requiredNonNullOrElse(widget.backgroundColor, Color(Colors.orangeAccent.toARGB32())),
                monthViewSettings: DateRangePickerMonthViewSettings(showTrailingAndLeadingDates: false),
                initialSelectedDate: PObjectUtils
                    .requiredNonNullOrElse(widget.initialSelectDate, DateTime.now()),
                initialSelectedDates: PObjectUtils
                    .requiredNonNullOrElse(widget.initialSelectDates, []),
                initialSelectedRanges: PObjectUtils
                    .requiredNonNullOrElse(widget.initialSelectDateRange, []),
                onSelectionChanged: widget.onSelectionChanged,
                onSubmit: (p0) => _closeDateRangePicker(),
                showActionButtons: PObjectUtils
                    .requiredNonNullOrElse(widget.showActionButtons, true),
                view: PObjectUtils
                    .requiredNonNullOrElse(widget.dateRangePickerView, DateRangePickerView.year),
                showTodayButton: PObjectUtils
                    .requiredNonNullOrElse(widget.showActionButtons, true),
                maxDate: widget.maxDate,
                minDate: widget.minDate,
              ),
            ),
          ),
        );
      },);

    Overlay.of(context).insert(_overlayEntry!);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: PObjectUtils.requiredNonNullOrElse(widget.width, 200),
      child: CompositedTransformTarget (
        link: _layerLink,
        child: TextFormField(
          controller: widget.controller,
          enabled: PObjectUtils.requiredNonNullOrElse(widget.enable, true),
          readOnly: true,
          obscureText: PObjectUtils.requiredNonNullOrElse(widget.obscureText, false),
          keyboardType: PObjectUtils
              .requiredNonNullOrElse(widget.textInputType, TextInputType.text),
          autovalidateMode: AutovalidateMode.onUserInteraction,
          decoration: InputDecoration(
            labelText: widget.labelText,
            labelStyle: TextStyle(
              color: PObjectUtils.requiredNonNullOrElse(
                  widget.labelColor, PConstant.orangeAccent),
              fontSize: PObjectUtils.requiredNonNullOrElse(widget.labelFontSize, 15.0),
              wordSpacing: PObjectUtils.requiredNonNullOrElse(widget.wordSpacing, 1.0),
              fontStyle: PObjectUtils.requiredNonNullOrElse(widget.fontStyle, FontStyle.normal),
            ),
            hintText: widget.hintText,
            hintFadeDuration: Duration(seconds: 1),
            hintStyle: TextStyle(
                color: Color(Colors.grey.shade400.toARGB32())
            ),
            suffixIcon: widget.suffixIcon,
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: PObjectUtils.requiredNonNullOrElse(
                      widget.enableBorderColor, Color(PConstant.black.toARGB32())),
                  style: PObjectUtils.requiredNonNullOrElse(widget.enableBorderStyle,
                      BorderStyle.solid),
                ),
                borderRadius: BorderRadius.circular(PObjectUtils
                    .requiredNonNullOrElse(widget.enableBorderRadius, 1.0))
            ),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    color: PObjectUtils.requiredNonNullOrElse(
                        widget.focusBorderColor, Color(PConstant.black.toARGB32())),
                    style: PObjectUtils.requiredNonNullOrElse(widget.focusBorderStyle,
                        BorderStyle.solid)
                ),
                borderRadius: BorderRadius.circular(PObjectUtils
                    .requiredNonNullOrElse(widget.focusBorderRadius, 1.0))
            ),
            errorBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    color: PObjectUtils.requiredNonNullOrElse(
                        widget.errorBorderColor, Color(Colors.red.toARGB32())),
                    style: PObjectUtils.requiredNonNullOrElse(widget.errorBorderStyle,
                        BorderStyle.solid)
                ),
                borderRadius: BorderRadius.circular(PObjectUtils
                    .requiredNonNullOrElse(widget.focusBorderRadius, 1.0))
            ),
            focusedErrorBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    color: PObjectUtils.requiredNonNullOrElse(
                        widget.focusErrorBorderColor, Color(PConstant.red.toARGB32())),
                    style: PObjectUtils.requiredNonNullOrElse(widget.focusErrorBorderStyle,
                        BorderStyle.solid)
                ),
                borderRadius: BorderRadius.circular(PObjectUtils
                    .requiredNonNullOrElse(widget.focusBorderRadius, 1.0))
            ),
          ),
          validator: widget.validate,
          onTap: () {
            if (PObjectUtils.isNull(_overlayEntry)) {
              _showDateRangePicker();
            } else {
              _closeDateRangePicker();
            }
          },
        ),
      ),
    );
  }
}

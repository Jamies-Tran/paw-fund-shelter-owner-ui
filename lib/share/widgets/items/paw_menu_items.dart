import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:paw_fund_shelter_owner/share/bootstrap/configuration/route/routes.dart';
import 'package:paw_fund_shelter_owner/share/bootstrap/utils/paw_utils.dart';
import 'package:paw_fund_shelter_owner/share/constans/paw_constant.dart';
import 'package:paw_fund_shelter_owner/share/widgets/button/paw_button.dart';
import 'package:paw_fund_shelter_owner/share/widgets/icon/paw_icon.dart';
import 'package:paw_fund_shelter_owner/share/widgets/text/paw_text.dart';

class PMenuItem extends StatelessWidget {
  const PMenuItem({
    super.key,

    this.paddingLeft,
    this.paddingRight,
    this.paddingBottom,
    this.paddingTop,
    this.paddingAll,

    this.height,
    this.width,
    this.backgroundColor,

    required this.onExit,
    required this.onEnter,

    required this.onTap,
    required this.title,

    this.textSize,
    this.textColor
  });
  final double? paddingLeft;
  final double? paddingRight;
  final double? paddingTop;
  final double? paddingBottom;
  final double? paddingAll;

  final double? height;
  final double? width;

  final Color? backgroundColor;

  final ValueChanged<PointerEnterEvent> onEnter;
  final ValueChanged<PointerExitEvent> onExit;

  final VoidCallback onTap;
  final String title;

  final double? textSize;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: onEnter,
      onExit: onExit,
      child: Padding(
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
            child: InkWell(
              onTap: onTap,
              child: PText(
                content: title,
                wordSpacing: 2.0,
                fontWeight: FontWeight.bold,
                fontSize: PObjectUtils.requiredNonNullOrElse(textSize, 15),
                textColor: PObjectUtils.requiredNonNullOrElse(textColor, PConstant.black),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class PSubMenuItem extends StatefulWidget {
  const PSubMenuItem({
    super.key,

    required this.textSize,
    required this.textColor,

    this.textSizeHover,
    this.textColorHover,

    required this.iconSize,
    required this.iconColor,

    this.iconSizeHover,
    this.iconColorHover,

    required this.title,

    required this.backgroundColor,
    this.backgroundColorHover
  });

  final double iconSize;
  final Color iconColor;

  final double? iconSizeHover;
  final Color? iconColorHover;

  final double textSize;
  final Color textColor;

  final double? textSizeHover;
  final Color? textColorHover;

  final String title;

  final Color backgroundColor;
  final Color? backgroundColorHover;

  @override
  State<PSubMenuItem> createState() => _PSubMenuItemState();
}

class _PSubMenuItemState extends State<PSubMenuItem> {
  OverlayEntry? _overlayEntry;
  final LayerLink _layerLink = LayerLink();
  late bool _isHover = false;

  @override
  void dispose() {
    _hideMenu();
    super.dispose();
  }

  void _showMenu() {
    if (_overlayEntry != null) return;

    _overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        width: 300,
        height: 100,
        child: CompositedTransformFollower(
            link: _layerLink,
            offset: Offset(-15, 75),
            showWhenUnlinked: false,
            child: MouseRegion(
              onExit: (_) {
                setState(() {
                  _isHover = false;
                });
                _hideMenu();
              },
              child: Material(
                elevation: 4,
                color: PConstant.orangeAccent,
                child: Padding(
                  padding: const EdgeInsets.symmetric(),
                  child: Column(
                    children: [
                      PHoverButton(
                        onPress: () {
                          Get.toNamed(PRoute.registrationView);
                        },
                        width: MediaQuery.of(context).size.width,
                        height: 50,
                        backgroundColor: Colors.white,
                        backgroundColorHover: Colors.orangeAccent,
                        fontWeight: FontWeight.bold,
                        shape: RoundedRectangleBorder(),
                        textSize: 13,
                        textSizeHover: 17,
                        textColor: Colors.orangeAccent,
                        textColorHover: Colors.white,
                        title: Text("Đăng ký"),
                      ),
                      PHoverButton(
                        onPress: () {
                          Get.toNamed(PRoute.loginView);
                        },
                        width: MediaQuery.of(context).size.width,
                        height: 50,
                        backgroundColor: Colors.white,
                        backgroundColorHover: Colors.orangeAccent,
                        fontWeight: FontWeight.bold,
                        shape: RoundedRectangleBorder(),
                        textSize: 13,
                        textSizeHover: 17,
                        textColor: Colors.orangeAccent,
                        textColorHover: Colors.white,
                        title: Text("Đăng nhập"),
                      ),
                    ],
                  ),
                ),
              ),
            ),
        ),
    ),);

    Overlay.of(context).insert(_overlayEntry!);
  }

  void _hideMenu() {
    _overlayEntry?.remove();
    _overlayEntry = null;

  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: _isHover == true
            ? PObjectUtils.requiredNonNullOrElse(widget.backgroundColorHover, widget.backgroundColor)
            : widget.backgroundColor,
        border: Border.symmetric(
            vertical: BorderSide(
                style: BorderStyle.solid,
                color: PConstant.white
            )
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 15.0),
        child: MouseRegion(
          onEnter: (_) {
            setState(() {
              _isHover = true;
            });
            _showMenu();
          },

          child: CompositedTransformTarget(
            link: _layerLink,
            child: Center(
              child: Row(
                children: [
                  PIcon(
                    iconData: Icons.account_circle_outlined,
                    size: _isHover == true
                        ? PObjectUtils.requiredNonNullOrElse(widget.iconSizeHover, widget.iconSize)
                        : widget.iconSize,
                    color: _isHover == true
                        ? PObjectUtils.requiredNonNullOrElse(widget.iconColorHover, widget.iconColor)
                        : widget.iconColor,
                  ),
                  PConstant.vDistance5,
                  PText(
                    content: widget.title,
                    textColor: _isHover == true
                        ? PObjectUtils.requiredNonNullOrElse(widget.textColorHover, widget.textColor)
                        : widget.textColor,
                    fontWeight: FontWeight.bold,
                    wordSpacing: 2.0,
                    fontSize: _isHover == true
                        ? PObjectUtils.requiredNonNullOrElse(widget.textSizeHover, widget.textSize)
                        : widget.textSize,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}


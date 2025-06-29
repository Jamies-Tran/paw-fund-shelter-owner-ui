import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:paw_fund_shelter_owner/share/constans/enums/paw_enums.dart';
import 'package:paw_fund_shelter_owner/share/constans/paw_constant.dart';
import 'package:paw_fund_shelter_owner/share/constans/route/routes.dart';
import 'package:paw_fund_shelter_owner/share/controller/header/paw_item_menu_controller.dart';
import 'package:paw_fund_shelter_owner/share/responsive_design/responsive_design.dart';
import 'package:paw_fund_shelter_owner/share/widgets/button/paw_button.dart';
import 'package:paw_fund_shelter_owner/share/widgets/icon/paw_icon.dart';
import 'package:paw_fund_shelter_owner/share/widgets/image/paw_image.dart';
import 'package:paw_fund_shelter_owner/share/widgets/items/paw_menu_items.dart';
import 'package:paw_fund_shelter_owner/share/widgets/items/paw_sidebar_item.dart';
import 'package:paw_fund_shelter_owner/share/widgets/text/paw_text.dart';

class PHeader extends StatelessWidget implements PreferredSizeWidget {
  const PHeader({
    super.key,
    required this.layoutVersion
  });

  final ELayoutVersion layoutVersion;

  @override
  Widget build(BuildContext context) {
    switch (layoutVersion) {
      case ELayoutVersion.verOne:
        return HeaderV1();
      case ELayoutVersion.verTwo:
        return HeaderV2();
    }
  }

  @override
  Size get preferredSize => Size.fromHeight(50);
}

class HeaderV1 extends StatelessWidget {
  const HeaderV1({super.key});

  @override
  Widget build(BuildContext context) {
    MenuItemController menuItemController = Get.find();
    return ResponsiveDesign(
        desktop: PDesktopLayoutV1(menuItemController: menuItemController,),
        tablet: PTabletLayoutV1(),
        mobile: PMobileLayoutV1()
    );
  }
}

class PDesktopLayoutV1 extends StatefulWidget {
  const PDesktopLayoutV1({
    super.key,
    required this.menuItemController
  });

  final MenuItemController menuItemController;

  @override
  State<PDesktopLayoutV1> createState() => _PDesktopLayoutV1State();
}

class _PDesktopLayoutV1State extends State<PDesktopLayoutV1> {
  GlobalKey targetKey = GlobalKey();
  OverlayEntry? _overlayEntry;
  final LayerLink _layerLink = LayerLink();

  void _showMenu() {
    if (_overlayEntry != null) return;

    _overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        width: 300,
        height: 90,
        child: CompositedTransformFollower(
          link: _layerLink,
          showWhenUnlinked: false,
          offset: Offset(-15, 75),
          child: MouseRegion(
            onExit: (event)  {
              widget.menuItemController.setIsSubMenuItemHovering(false);
              _hideMenu();
            },
            child: Material(
              elevation: 4,
              color: PConstant.orangeAccent,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    PHoverButton(
                      onPress: () {},
                      width: 200,
                      height: 30,
                      backgroundColor: PConstant.white,
                      fontWeight: FontWeight.bold,
                      textSize: 13,
                      textSizeHover: 17,
                      textColor: PConstant.black,
                      textColorHover: PConstant.orangeAccent,
                      title: Text("Đăng ký"),
                    ),
                    PConstant.hDistance10,
                    PHoverButton(
                      onPress: () {},
                      width: 200,
                      height: 30,
                      backgroundColor: PConstant.white,
                      fontWeight: FontWeight.bold,
                      textSize: 13,
                      textSizeHover: 17,
                      textColor: PConstant.black,
                      textColorHover: PConstant.orangeAccent,
                      title: Text("Đăng nhập"),

                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );

    Overlay.of(context).insert(_overlayEntry!);
  }

  void _hideMenu() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }

  @override
  void dispose() {
    _hideMenu();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() => Container(
      height: 75,
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        color: PConstant.orangeAccent,
        boxShadow: [
          BoxShadow(blurRadius: 8.0, color: PConstant.black, blurStyle: BlurStyle.outer)
        ],
      ),
      child: Row(
        children: [
          Expanded(
            flex: 4,
            child: PImage(
              url: PConstant.pawFundLogo,
              imageType: EImageType.network,
              width: 150,
              height: 150,
              boxFit: BoxFit.fitWidth,
            ),
          ),

          Expanded(
              flex: 3,
              child: MouseRegion(
                onHover: (event) => widget.menuItemController
                    .setCurrentHoveringRoute(PRoute.homeScreen),
                onExit: (event) => widget.menuItemController
                    .setCurrentHoveringRoute(""),
                child: MouseRegion (
                  onHover: (event) => widget.menuItemController
                      .setCurrentHoveringRoute(PRoute.homeScreen),
                  onExit: (event) => widget.menuItemController
                    .setCurrentHoveringRoute(""),
                  child: PMenuItem(
                    paddingAll: 0.0,
                    child: PSideBarItem(
                      onTap: () {
                        Get.toNamed(PRoute.homeScreen);
                      },
                      onHover: (value) {},
                      title: "Giới thiệu",
                      backgroundColor: widget.menuItemController.getIsMenuItemSelected(PRoute.homeScreen)
                            ? PConstant.orangeAccent
                            : PConstant.transparent,
                      fontSize: widget.menuItemController.getIsMenuItemHovering(PRoute.homeScreen)
                          ? 17
                          : widget.menuItemController.getIsMenuItemSelected(PRoute.homeScreen)
                          ? 15
                          : 13,
                      textColor: widget.menuItemController.getIsMenuItemHovering(PRoute.homeScreen)
                      ? PConstant.white
                      : widget.menuItemController.getIsMenuItemSelected(PRoute.homeScreen)
                          ? PConstant.white
                          : PConstant.black,
                    ),),
                ),
              )
          ),

          Expanded(
            flex: 3,
            child: MouseRegion(
              onHover: (event) => widget.menuItemController
                  .setCurrentHoveringRoute(PRoute.shelterIntroScreen),
              onExit: (event) => widget.menuItemController
                  .setCurrentHoveringRoute(""),
              child: PMenuItem(
                paddingAll: 0.0,
                child: PSideBarItem(
                  onTap: () {
                    Get.toNamed(PRoute.shelterIntroScreen);
                  },
                  onHover: (value) {},
                  title: "Trung tâm cứu trợ",
                  fontWeight: FontWeight.bold,
                  backgroundColor: widget.menuItemController.getIsMenuItemSelected(PRoute.shelterIntroScreen)
                      ? PConstant.orangeAccent
                      : PConstant.transparent,
                  fontSize: widget.menuItemController.getIsMenuItemHovering(PRoute.shelterIntroScreen)
                      ? 17
                      : widget.menuItemController.getIsMenuItemSelected(PRoute.shelterIntroScreen)
                      ? 15
                      : 13,
                  textColor: widget.menuItemController.getIsMenuItemHovering(PRoute.shelterIntroScreen)
                      ? PConstant.white
                      : widget.menuItemController.getIsMenuItemSelected(PRoute.shelterIntroScreen)
                      ? PConstant.white
                      : PConstant.black,

                ),
              ),
            ),
          ),

          Expanded(
            flex: 3,
            child: MouseRegion(
              onHover: (event) => widget.menuItemController
                  .setCurrentHoveringRoute(PRoute.contractScreen),
              onExit: (event) => widget.menuItemController
                  .setCurrentHoveringRoute(""),
              child: PMenuItem(
                paddingAll: 0.0,
                child: PSideBarItem(
                  onTap: () {
                    Get.toNamed(PRoute.contractScreen);
                  },
                  onHover: (value) {},
                  title: "Liên hệ",
                  backgroundColor: widget.menuItemController.getIsMenuItemSelected(PRoute.contractScreen)
                      ? PConstant.orangeAccent
                      : PConstant.transparent,
                  fontSize: widget.menuItemController.getIsMenuItemHovering(PRoute.contractScreen)
                      ? 17
                      : widget.menuItemController.getIsMenuItemSelected(PRoute.contractScreen)
                      ? 15
                      : 13,
                  textColor: widget.menuItemController.getIsMenuItemHovering(PRoute.contractScreen)
                      ? PConstant.white
                      : widget.menuItemController.getIsMenuItemSelected(PRoute.contractScreen)
                      ? PConstant.white
                      : PConstant.black,

                ),
              ),
            ),
          ),

          Expanded(
            flex: 3,
            child: Container(
              decoration: BoxDecoration(
                color: widget.menuItemController.getIsSubMenuItemHovering()
                    ? PConstant.white
                    : PConstant.orangeAccent,
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
                      widget.menuItemController.setIsSubMenuItemHovering(true);
                      _showMenu();
                    },
                    child: CompositedTransformTarget(
                      link: _layerLink,
                      child: Center(
                        child: Row(
                          children: [
                            PAccountAvatarIcon(
                              size: widget.menuItemController.getIsSubMenuItemHovering()
                                ? 25
                                : 30,
                              color: widget.menuItemController.getIsSubMenuItemHovering()
                                  ? PConstant.orangeAccent
                                  : PConstant.white,
                            ),
                            PConstant.vDistance5,
                            PText(
                              content: "Thành viên",
                              textColor: widget.menuItemController.getIsSubMenuItemHovering()
                                  ? PConstant.orangeAccent
                                  : PConstant.white,
                              fontWeight: FontWeight.bold,
                              wordSpacing: 2.0,
                              fontSize: widget.menuItemController.getIsSubMenuItemHovering()
                                ? 17
                                : 15,
                            )
                          ],
                        ),
                      ),
                    )
                ),
              ),
            ),
          )
        ],
      ),
    ),);
  }
}


class PTabletLayoutV1 extends StatelessWidget {
  const PTabletLayoutV1({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      shape: BeveledRectangleBorder(),
      backgroundColor: PConstant.white,
      elevation: 8.0,
      shadowColor: PConstant.black,
      title: Text("Chào mừng bạn đến Paw Fund"),
      centerTitle: true,
    );
  }
}

class PMobileLayoutV1 extends StatelessWidget {
  const PMobileLayoutV1({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      shape: BeveledRectangleBorder(),
      backgroundColor: PConstant.white,
      elevation: 8.0,
      shadowColor: PConstant.black,
      title: Text("Chào mừng bạn đến Paw Fund"),
      centerTitle: true,
    );
  }
}

class HeaderV2 extends StatelessWidget {
  const HeaderV2({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}


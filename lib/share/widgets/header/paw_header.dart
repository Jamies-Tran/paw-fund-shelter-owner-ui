import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:paw_fund_shelter_owner/share/constans/enums/paw_enums.dart';
import 'package:paw_fund_shelter_owner/share/constans/paw_constant.dart';
import 'package:paw_fund_shelter_owner/share/constans/route/routes.dart';
import 'package:paw_fund_shelter_owner/share/controller/header/paw_item_menu_controller.dart';
import 'package:paw_fund_shelter_owner/share/responsive_design/responsive_design.dart';
import 'package:paw_fund_shelter_owner/share/widgets/button/paw_button.dart';
import 'package:paw_fund_shelter_owner/share/widgets/image/paw_image.dart';
import 'package:paw_fund_shelter_owner/share/widgets/items/paw_menu_items.dart';
import 'package:paw_fund_shelter_owner/share/widgets/items/paw_sidebar_item.dart';

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

class PDesktopLayoutV1 extends StatelessWidget {
  const PDesktopLayoutV1({
    super.key,
    required this.menuItemController
  });
  final MenuItemController menuItemController;


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
              child: PMenuItem(
                onTap: () {
                  Get.toNamed(PRoute.homeScreen);
                },
                onEnter: (_) => menuItemController
                    .setCurrentHoveringRoute(PRoute.homeScreen),
                onExit: (_) => menuItemController
                    .setCurrentHoveringRoute(""),
                paddingAll: 0.0,
                title: "Giới thiệu",
                backgroundColor: menuItemController.getIsMenuItemSelected(PRoute.homeScreen)
                    ? PConstant.orangeAccent
                    : PConstant.transparent,
                textSize: menuItemController.getIsMenuItemHovering(PRoute.homeScreen)
                    ? 17
                    : menuItemController.getIsMenuItemSelected(PRoute.homeScreen)
                    ? 15
                    : 13,
                textColor: menuItemController.getIsMenuItemHovering(PRoute.homeScreen)
                    ? PConstant.white
                    : menuItemController.getIsMenuItemSelected(PRoute.homeScreen)
                    ? PConstant.white
                    : PConstant.black,)
          ),

          Expanded(
            flex: 3,
            child: PMenuItem(
              onTap: () {
                Get.toNamed(PRoute.shelterIntroScreen);
              },
              onEnter: (_) => menuItemController
                  .setCurrentHoveringRoute(PRoute.shelterIntroScreen),
              onExit: (_) => menuItemController
                  .setCurrentHoveringRoute(""),
              paddingAll: 0.0,
              title: "Trung tâm cứu trợ",
              backgroundColor: menuItemController.getIsMenuItemSelected(PRoute.shelterIntroScreen)
                  ? PConstant.orangeAccent
                  : PConstant.transparent,
              textSize: menuItemController.getIsMenuItemHovering(PRoute.shelterIntroScreen)
                  ? 17
                  : menuItemController.getIsMenuItemSelected(PRoute.shelterIntroScreen)
                  ? 15
                  : 13,
              textColor: menuItemController.getIsMenuItemHovering(PRoute.shelterIntroScreen)
                  ? PConstant.white
                  : menuItemController.getIsMenuItemSelected(PRoute.shelterIntroScreen)
                  ? PConstant.white
                  : PConstant.black,
            ),
          ),

          Expanded(
            flex: 3,
            child: PMenuItem(
              onTap: () => Get.toNamed(PRoute.contractScreen),
              onEnter: (_) => menuItemController
                  .setCurrentHoveringRoute(PRoute.contractScreen),
              onExit: (_) => menuItemController
                  .setCurrentHoveringRoute(""),
              paddingAll: 0.0,
              title: "Liên hệ",
              backgroundColor: menuItemController.getIsMenuItemSelected(PRoute.contractScreen)
                  ? PConstant.orangeAccent
                  : PConstant.transparent,
              textSize: menuItemController.getIsMenuItemHovering(PRoute.contractScreen)
                  ? 17
                  : menuItemController.getIsMenuItemSelected(PRoute.contractScreen)
                  ? 15
                  : 13,
              textColor: menuItemController.getIsMenuItemHovering(PRoute.contractScreen)
                  ? PConstant.white
                  : menuItemController.getIsMenuItemSelected(PRoute.contractScreen)
                  ? PConstant.white
                  : PConstant.black,
            ),
          ),

          Expanded(
            flex: 3,
            child: PSubMenuItem(
                textSize: 15,
                textSizeHover: 17,
                textColor: PConstant.white,
                textColorHover: PConstant.orangeAccent,
                iconSize: 25,
                iconSizeHover: 30,
                iconColor: PConstant.white,
                iconColorHover: PConstant.orangeAccent,
                title: "Thành viên",
                backgroundColor: PConstant.orangeAccent,
                backgroundColorHover: PConstant.white,
            ),
          ),
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


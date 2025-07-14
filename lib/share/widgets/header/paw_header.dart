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
                  Get.toNamed(PRoute.homeView);
                },
                onEnter: (_) => menuItemController
                    .setCurrentHoveringRoute(PRoute.homeView),
                onExit: (_) => menuItemController
                    .setCurrentHoveringRoute(""),
                paddingAll: 0.0,
                title: "Giới thiệu",
                backgroundColor: menuItemController.getIsMenuItemSelected(PRoute.homeView)
                    ? PConstant.orangeAccent
                    : PConstant.transparent,
                textSize: menuItemController.getIsMenuItemHovering(PRoute.homeView)
                    ? 17
                    : menuItemController.getIsMenuItemSelected(PRoute.homeView)
                    ? 15
                    : 13,
                textColor: menuItemController.getIsMenuItemHovering(PRoute.homeView)
                    ? PConstant.white
                    : menuItemController.getIsMenuItemSelected(PRoute.homeView)
                    ? PConstant.white
                    : PConstant.black,)
          ),

          Expanded(
            flex: 3,
            child: PMenuItem(
              onTap: () {
                Get.toNamed(PRoute.shelterIntroView);
              },
              onEnter: (_) => menuItemController
                  .setCurrentHoveringRoute(PRoute.shelterIntroView),
              onExit: (_) => menuItemController
                  .setCurrentHoveringRoute(""),
              paddingAll: 0.0,
              title: "Trung tâm cứu trợ",
              backgroundColor: menuItemController.getIsMenuItemSelected(PRoute.shelterIntroView)
                  ? PConstant.orangeAccent
                  : PConstant.transparent,
              textSize: menuItemController.getIsMenuItemHovering(PRoute.shelterIntroView)
                  ? 17
                  : menuItemController.getIsMenuItemSelected(PRoute.shelterIntroView)
                  ? 15
                  : 13,
              textColor: menuItemController.getIsMenuItemHovering(PRoute.shelterIntroView)
                  ? PConstant.white
                  : menuItemController.getIsMenuItemSelected(PRoute.shelterIntroView)
                  ? PConstant.white
                  : PConstant.black,
            ),
          ),

          Expanded(
            flex: 3,
            child: PMenuItem(
              onTap: () => Get.toNamed(PRoute.contractView),
              onEnter: (_) => menuItemController
                  .setCurrentHoveringRoute(PRoute.contractView),
              onExit: (_) => menuItemController
                  .setCurrentHoveringRoute(""),
              paddingAll: 0.0,
              title: "Liên hệ",
              backgroundColor: menuItemController.getIsMenuItemSelected(PRoute.contractView)
                  ? PConstant.orangeAccent
                  : PConstant.transparent,
              textSize: menuItemController.getIsMenuItemHovering(PRoute.contractView)
                  ? 17
                  : menuItemController.getIsMenuItemSelected(PRoute.contractView)
                  ? 15
                  : 13,
              textColor: menuItemController.getIsMenuItemHovering(PRoute.contractView)
                  ? PConstant.white
                  : menuItemController.getIsMenuItemSelected(PRoute.contractView)
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


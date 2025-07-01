import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:paw_fund_shelter_owner/share/constans/enums/paw_enums.dart';
import 'package:paw_fund_shelter_owner/share/constans/paw_constant.dart';
import 'package:paw_fund_shelter_owner/share/constans/route/routes.dart';
import 'package:paw_fund_shelter_owner/share/controller/header/paw_item_menu_controller.dart';
import 'package:paw_fund_shelter_owner/share/widgets/button/paw_button.dart';
import 'package:paw_fund_shelter_owner/share/widgets/image/paw_image.dart';
import 'package:paw_fund_shelter_owner/share/widgets/items/paw_menu_items.dart';
import 'package:paw_fund_shelter_owner/share/widgets/items/paw_sidebar_item.dart';
import 'package:paw_fund_shelter_owner/share/widgets/text/paw_text.dart';

class PSideBar extends StatelessWidget {
  const PSideBar({super.key});

  @override
  Widget build(BuildContext context) {
    MenuItemController menuItemController = Get.find();
    return Obx(() => Container(
      color: PConstant.orangeAccent,
      child: Column(
        children: [
          PImage(
            url: PConstant.pawFundLogo,
            imageType: EImageType.network,
            width: 350,
            height: 100,
            boxFit: BoxFit.fitWidth,
          ),

          PConstant.hDistance50,

          PMenuItem(
            onTap: () {
              Get.toNamed(PRoute.homeScreen);
            },
            onEnter: (_) => menuItemController
                .setCurrentHoveringRoute(PRoute.homeScreen),
            onExit: (_) => menuItemController
                .setCurrentHoveringRoute(""),
            title: "Giới thiệu",
            paddingAll: 0.0,
            height: 50,
            width: 300,
            backgroundColor: menuItemController.getIsMenuItemHovering(PRoute.homeScreen)
                ? PConstant.white
                : menuItemController.getIsMenuItemSelected(PRoute.homeScreen)
                ? PConstant.white
                : PConstant.transparent,
            textSize: menuItemController.getIsMenuItemHovering(PRoute.homeScreen)
                ? 17
                : menuItemController.getIsMenuItemSelected(PRoute.homeScreen)
                ? 15
                : 13,
            textColor: menuItemController.getIsMenuItemHovering(PRoute.homeScreen)
                ? PConstant.orangeAccent
                : menuItemController.getIsMenuItemSelected(PRoute.homeScreen)
                ? PConstant.orangeAccent
                : PConstant.white,),

          PConstant.hDistance10,

          PMenuItem(
            onTap: () {
              Get.toNamed(PRoute.shelterIntroScreen);
            },
            onEnter: (_) => menuItemController
                .setCurrentHoveringRoute(PRoute.shelterIntroScreen),
            onExit: (_) => menuItemController
                .setCurrentHoveringRoute(""),
            title: "Trung tâm cứu trợ",
            paddingAll: 0.0,
            height: 50,
            width: 300,
            backgroundColor: menuItemController.getIsMenuItemHovering(PRoute.shelterIntroScreen)
                ? PConstant.white
                : menuItemController.getIsMenuItemSelected(PRoute.shelterIntroScreen)
                ? PConstant.white
                : PConstant.transparent,
            textSize: menuItemController.getIsMenuItemHovering(PRoute.shelterIntroScreen)
                ? 17
                : menuItemController.getIsMenuItemSelected(PRoute.shelterIntroScreen)
                ? 15
                : 13,
            textColor: menuItemController.getIsMenuItemHovering(PRoute.shelterIntroScreen)
                ? PConstant.orangeAccent
                : menuItemController.getIsMenuItemSelected(PRoute.shelterIntroScreen)
                ? PConstant.orangeAccent
                : PConstant.white,),

          PConstant.hDistance10,

          PMenuItem(
            onTap: () {
              Get.toNamed(PRoute.contractScreen);
            },
            onEnter: (_) => menuItemController
                .setCurrentHoveringRoute(PRoute.contractScreen),
            onExit: (_) => menuItemController
                .setCurrentHoveringRoute(""),
            title: "Liên hệ",
            paddingAll: 0.0,
            height: 50,
            width: 300,
            backgroundColor: menuItemController.getIsMenuItemHovering(PRoute.contractScreen)
                ? PConstant.white
                : menuItemController.getIsMenuItemSelected(PRoute.contractScreen)
                ? PConstant.white
                : PConstant.transparent,
            textSize: menuItemController.getIsMenuItemHovering(PRoute.contractScreen)
                ? 17
                : menuItemController.getIsMenuItemSelected(PRoute.contractScreen)
                ? 15
                : 13,
            textColor: menuItemController.getIsMenuItemHovering(PRoute.contractScreen)
                ? PConstant.orangeAccent
                : menuItemController.getIsMenuItemSelected(PRoute.contractScreen)
                ? PConstant.orangeAccent
                : PConstant.white,),

          PConstant.hDistance250,

          PSideBarFooterV1()
        ],
      ),
    ),);
  }
}

class PSideBarFooterV1 extends StatelessWidget {
  const PSideBarFooterV1({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PHoverButton(
          onPress: () {},
          width: 250,
          height: 50,
          backgroundColor: PConstant.white,
          fontWeight: FontWeight.bold,
          textSize: 13,
          textSizeHover: 17,
          textColor: PConstant.orangeAccent,
          textColorHover: PConstant.purple,
          title: Text("Đăng ký"),
        ),

        PConstant.hDistance10,

        PHoverButton(
          onPress: () {},
          width: 250,
          height: 50,
          backgroundColor: PConstant.white,
          fontWeight: FontWeight.bold,
          textSize: 13,
          textSizeHover: 17,
          textColor: PConstant.orangeAccent,
          textColorHover: PConstant.green,
          title: Text("Đăng nhập"),
        ),
      ],
    );
  }
}


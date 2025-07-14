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
              Get.toNamed(PRoute.homeView);
            },
            onEnter: (_) => menuItemController
                .setCurrentHoveringRoute(PRoute.homeView),
            onExit: (_) => menuItemController
                .setCurrentHoveringRoute(""),
            title: "Giới thiệu",
            paddingAll: 0.0,
            height: 50,
            width: 300,
            backgroundColor: menuItemController.getIsMenuItemHovering(PRoute.homeView)
                ? PConstant.white
                : menuItemController.getIsMenuItemSelected(PRoute.homeView)
                ? PConstant.white
                : PConstant.transparent,
            textSize: menuItemController.getIsMenuItemHovering(PRoute.homeView)
                ? 17
                : menuItemController.getIsMenuItemSelected(PRoute.homeView)
                ? 15
                : 13,
            textColor: menuItemController.getIsMenuItemHovering(PRoute.homeView)
                ? PConstant.orangeAccent
                : menuItemController.getIsMenuItemSelected(PRoute.homeView)
                ? PConstant.orangeAccent
                : PConstant.white,),

          PConstant.hDistance10,

          PMenuItem(
            onTap: () {
              Get.toNamed(PRoute.shelterIntroView);
            },
            onEnter: (_) => menuItemController
                .setCurrentHoveringRoute(PRoute.shelterIntroView),
            onExit: (_) => menuItemController
                .setCurrentHoveringRoute(""),
            title: "Trung tâm cứu trợ",
            paddingAll: 0.0,
            height: 50,
            width: 300,
            backgroundColor: menuItemController.getIsMenuItemHovering(PRoute.shelterIntroView)
                ? PConstant.white
                : menuItemController.getIsMenuItemSelected(PRoute.shelterIntroView)
                ? PConstant.white
                : PConstant.transparent,
            textSize: menuItemController.getIsMenuItemHovering(PRoute.shelterIntroView)
                ? 17
                : menuItemController.getIsMenuItemSelected(PRoute.shelterIntroView)
                ? 15
                : 13,
            textColor: menuItemController.getIsMenuItemHovering(PRoute.shelterIntroView)
                ? PConstant.orangeAccent
                : menuItemController.getIsMenuItemSelected(PRoute.shelterIntroView)
                ? PConstant.orangeAccent
                : PConstant.white,),

          PConstant.hDistance10,

          PMenuItem(
            onTap: () {
              Get.toNamed(PRoute.contractView);
            },
            onEnter: (_) => menuItemController
                .setCurrentHoveringRoute(PRoute.contractView),
            onExit: (_) => menuItemController
                .setCurrentHoveringRoute(""),
            title: "Liên hệ",
            paddingAll: 0.0,
            height: 50,
            width: 300,
            backgroundColor: menuItemController.getIsMenuItemHovering(PRoute.contractView)
                ? PConstant.white
                : menuItemController.getIsMenuItemSelected(PRoute.contractView)
                ? PConstant.white
                : PConstant.transparent,
            textSize: menuItemController.getIsMenuItemHovering(PRoute.contractView)
                ? 17
                : menuItemController.getIsMenuItemSelected(PRoute.contractView)
                ? 15
                : 13,
            textColor: menuItemController.getIsMenuItemHovering(PRoute.contractView)
                ? PConstant.orangeAccent
                : menuItemController.getIsMenuItemSelected(PRoute.contractView)
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


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
    return Column(
      children: [
        PConstant.hDistance10,

        PImage(
          url: PConstant.pawFundLogo,
          imageType: EImageType.network,
          width: 200,
          height: 50,
          boxFit: BoxFit.fitWidth,
        ),

        PConstant.hDistance50,

        PSideBarItem(
          onTap: () {
            Get.toNamed(PRoute.homeScreen);
          },
          onHover: (value) {},
          title: "Giới thiệu",
          backgroundColor: menuItemController.getIsMenuItemSelected(PRoute.homeScreen) ? PConstant.orangeAccent : PConstant.transparent,
          fontSize: menuItemController.getIsMenuItemSelected(PRoute.homeScreen) ? 17 : 15,
          textColor: menuItemController.getIsMenuItemSelected(PRoute.homeScreen) ? PConstant.white : PConstant.black,

        ),

        PConstant.hDistance10,

        PSideBarItem(
          onTap: () {
            Get.toNamed(PRoute.shelterIntroScreen);
          },
          onHover: (value) {},
          title: "Trung tâm cứu trợ",
          backgroundColor: menuItemController.getIsMenuItemSelected(PRoute.shelterIntroScreen) ? PConstant.orangeAccent : PConstant.transparent,
          fontSize: menuItemController.getIsMenuItemSelected(PRoute.shelterIntroScreen) ? 17 : 15,
          textColor: menuItemController.getIsMenuItemSelected(PRoute.shelterIntroScreen) ? PConstant.white : PConstant.black,

        ),

        PConstant.hDistance10,

        PSideBarItem(
          onTap: () {
            Get.toNamed(PRoute.contractScreen);
          },
          onHover: (value) {},
          title: "Liên hệ",
          backgroundColor: menuItemController.getIsMenuItemSelected(PRoute.contractScreen) ? PConstant.orangeAccent : PConstant.transparent,
          fontSize: menuItemController.getIsMenuItemSelected(PRoute.contractScreen) ? 17 : 15,
          textColor: menuItemController.getIsMenuItemSelected(PRoute.contractScreen) ? PConstant.white : PConstant.black,

        ),

        PConstant.hDistance250,

        PSideBarFooterV1()
      ],
    );
  }
}

class PSideBarFooterV1 extends StatelessWidget {
  const PSideBarFooterV1({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PButton(
          onPress: () => {},
          width: 250,
          title: PText(
            content: "Đăng ký",
            textColor: PConstant.white,
            fontWeight: FontWeight.bold,
            fontSize: 13,
            wordSpacing: 1.5,
          ),
          backgroundColor: PConstant.purple,
        ),

        PConstant.hDistance10,

        PButton(
          onPress: () => {},
          width: 250,
          title: PText(
            content: "Đăng nhập",
            textColor: PConstant.white,
            fontWeight: FontWeight.bold,
            fontSize: 13,
            wordSpacing: 1.5,
          ),
          backgroundColor: PConstant.orangeAccent,
        ),
      ],
    );
  }
}


import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:paw_fund_shelter_owner/screens/home/screen/home.dart';
import 'package:paw_fund_shelter_owner/screens/shelter_intro/screen/shelter_intro_view.dart';
import 'package:paw_fund_shelter_owner/share/constans/route/routes.dart';

class PAppRoute {
  static List<GetPage> pages = [
    GetPage(name: PRoute.homeScreen, page: () => HomeScreen(),),
    GetPage(name: PRoute.shelterIntroScreen, page: () => ShelterIntroScreen(),),
    GetPage(name: PRoute.contractScreen, page: () => HomeScreen(),),
    GetPage(name: PRoute.loginScreen, page: () => HomeScreen(),),
    GetPage(name: PRoute.registrationScreen, page: () => HomeScreen())
  ];
}
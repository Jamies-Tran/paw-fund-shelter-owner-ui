import 'package:get/get.dart';
import 'package:paw_fund_shelter_owner/screens/account_registration/controller/register/registration_controller.dart';
import 'package:paw_fund_shelter_owner/screens/account_registration/controller/verification/account_verification_controller.dart';
import 'package:paw_fund_shelter_owner/screens/account_registration/controller/verification/sending_verification_controller.dart';
import 'package:paw_fund_shelter_owner/screens/account_registration/views/registration/registration_view.dart';
import 'package:paw_fund_shelter_owner/screens/account_registration/views/verification/sending_verification_view.dart';
import 'package:paw_fund_shelter_owner/screens/home/views/home.dart';

import 'package:paw_fund_shelter_owner/screens/shelter_intro/views/shelter_intro_view.dart';
import 'package:paw_fund_shelter_owner/share/bootstrap/configuration/middleware/paw_middleware.dart';
import 'package:paw_fund_shelter_owner/share/bootstrap/configuration/route/routes.dart';

class PAppRoute {
  static List<GetPage> pages = [
    GetPage(
      name: PRoute.homeView,
      page: () => HomeScreen(),
    ),
    GetPage(
      name: PRoute.shelterIntroView,
      page: () => ShelterIntroScreen(),
    ),
    GetPage(
      name: PRoute.contractView,
      page: () => HomeScreen(),
    ),
    GetPage(
      name: PRoute.loginView,
      page: () => HomeScreen(),
    ),
    GetPage(
        name: PRoute.registrationView,
        page: () => RegistrationView(),
        bindings: [
          BindingsBuilder(() => Get
              .lazyPut<RegistrationController>(() => RegistrationController(),))
        ],
    ),
    GetPage(
        name: PRoute.sendingVerificationView,
        page: () => SendingVerificationView(),
        bindings: [
          BindingsBuilder(() => Get
              .lazyPut<SendingVerificationController>(() => SendingVerificationController(),),)
        ]
    ),
  ];
}
import 'package:get/get.dart';
import 'package:paw_fund_shelter_owner/screens/account_registration/%20views/registration/registration_view.dart';
import 'package:paw_fund_shelter_owner/screens/account_registration/%20views/varification/sending_verification_view.dart';
import 'package:paw_fund_shelter_owner/screens/account_registration/controller/register/registration_controller.dart';
import 'package:paw_fund_shelter_owner/screens/account_registration/controller/verification/sending_verification_controller.dart';
import 'package:paw_fund_shelter_owner/screens/home/views/home.dart';
import 'package:paw_fund_shelter_owner/screens/medias/repository/firebase/media_firebase.dart';
import 'package:paw_fund_shelter_owner/screens/shelter_intro/views/shelter_intro_view.dart';
import 'package:paw_fund_shelter_owner/share/bootstrap/configuration/route/routes.dart';
import 'package:paw_fund_shelter_owner/share/controller/image/paw_image_controller.dart';

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
              .put<RegistrationController>(RegistrationController())),
          BindingsBuilder(() => Get
              .put<IMediaFirebase>(MediaFirebaseImpl()))
        ],
    ),
    GetPage(
        name: PRoute.sendingVerificationView,
        page: () => SendingVerificationView(),
        binding: BindingsBuilder(() => Get
            .put<SendingVerificationController>(SendingVerificationController()),)
    )
  ];
}
import 'package:get/get.dart';
import 'package:paw_fund_shelter_owner/screens/account_registration/repository/api/register/registration_api.dart';
import 'package:paw_fund_shelter_owner/screens/medias/repository/firebase/media_firebase.dart';
import 'package:paw_fund_shelter_owner/share/controller/header/paw_item_menu_controller.dart';
import 'package:paw_fund_shelter_owner/share/controller/image/paw_image_controller.dart';

class PDataBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MenuItemController(),);
    Get.lazyPut(() => ImageController(),);
    Get.lazyPut<IRegistrationApi>(() => RegistrationApiImpl(),);
    Get.lazyPut<IMediaFirebase>(() => MediaFirebaseImpl(),);
  }

}
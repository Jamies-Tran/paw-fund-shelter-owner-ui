import 'package:get/get.dart';
import 'package:paw_fund_shelter_owner/repository/api/account/account_api.dart';
import 'package:paw_fund_shelter_owner/repository/api/register/registration_api.dart';
import 'package:paw_fund_shelter_owner/repository/firebase/media/media_firebase.dart';
import 'package:paw_fund_shelter_owner/share/controller/header/paw_item_menu_controller.dart';
import 'package:paw_fund_shelter_owner/share/controller/image/paw_image_controller.dart';

class PDataBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MenuItemController(),);
    Get.lazyPut(() => ImageController(),);
    Get.lazyPut<IRegistrationApi>(() => RegistrationApiImpl(),);
    Get.lazyPut<IAccountApi>(() => AccountApiImpl(),);
    Get.lazyPut<IMediaFirebase>(() => MediaFirebaseImpl(),);
  }

}
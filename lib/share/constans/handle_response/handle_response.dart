import 'package:get/get.dart';
import 'package:paw_fund_shelter_owner/share/bootstrap/utils/paw_utils.dart';
import 'package:paw_fund_shelter_owner/share/constans/paw_constant.dart';

class HandleResponse {
  static void onError(String? message) {
    Get.snackbar(
      "Lỗi",
      PObjectUtils.requiredNonNullOrElse(message, "Có lỗi xảy ra!"),
      backgroundColor: PConstant.red,
      colorText: PConstant.white,
      duration: Duration(seconds: 30)
    );
  }

  static void onSuccess(String? message) {
    Get.snackbar(
        "Hoàn thành",
        PObjectUtils.requiredNonNullOrElse(message, "Dịch vụ đã được thực hiện thành công!"),
        backgroundColor: PConstant.green,
        colorText: PConstant.white,
        duration: Duration(seconds: 30)
    );
  }
}
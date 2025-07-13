import 'package:get/get.dart';
import 'package:paw_fund_shelter_owner/share/bootstrap/utils/paw_utils.dart';
import 'package:paw_fund_shelter_owner/share/constans/paw_constant.dart';

class HandleResponse {
  static void onError(String? message) {
    Get.snackbar(
      "Thông báo",
      PObjectUtils.requiredNonNullOrElse(message, "Có lỗi xảy ra!"),
      backgroundColor: PConstant.red,
      colorText: PConstant.white,
      duration: Duration(seconds: 5),
      snackPosition: SnackPosition.BOTTOM,
      snackStyle: SnackStyle.FLOATING,
      maxWidth: 500
    );
  }

  static void onSuccess(String? message) {
    Get.snackbar(
        "Thông báo",
        PObjectUtils.requiredNonNullOrElse(message, "Dịch vụ đã được thực hiện thành công!"),
        backgroundColor: PConstant.green,
        colorText: PConstant.white,
        duration: Duration(seconds: 5),
        snackPosition: SnackPosition.BOTTOM,
        snackStyle: SnackStyle.FLOATING,
        maxWidth: 500
    );
  }
}

class ValueResponse {
  final dynamic data;
  final String? status;
  final bool? success;
  final String? errorCode;
  final DateTime? responseAt;
  final String? message;

  ValueResponse({
    this.data,
    this.status,
    this.success,
    this.errorCode,
    this.responseAt,
    this.message
  });

  factory ValueResponse.fromJson(Map<String, dynamic> json) {
    return ValueResponse(
      data: json['model'],
      status: json['status'],
      success: json['success'],
      errorCode: json['errorCode'],
      responseAt: DateTime.tryParse(json['responseAt']),
      message: json['message']
    );
  }
}
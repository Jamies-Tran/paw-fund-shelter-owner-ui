import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:paw_fund_shelter_owner/repository/api/login/login_api.dart';
import 'package:paw_fund_shelter_owner/share/bootstrap/configuration/route/routes.dart';
import 'package:paw_fund_shelter_owner/share/bootstrap/utils/paw_utils.dart';

class LoginController extends GetxController {
  late ILoginApi _loginApi;

  @override
  void onInit() {
    super.onInit();
    fetchEmailIfExist();
    _loginApi = Get.find();
  }

  void fetchEmailIfExist() {
    final args = Get.arguments as Map<String, dynamic>?;
    if (PObjectUtils.isNotNull(args) && PStringUtils.isNotEmpty(args?["email"])) {
      _emailController.value.text = args?["email"];
      _isEmailValidate.value = true;
    }
  }

  // email
  final Rx<TextEditingController> _emailController = TextEditingController().obs;
  final Rx<bool> _isEmailFocus = false.obs;
  final Rx<bool> _isEmailEditing = false.obs;
  final Rx<bool> _isEmailValidate = false.obs;

  TextEditingController getEmailController() {
    return _emailController.value;
  }

  void clearEmailText() {
    _emailController.value.clear();
  }

  void setIsEmailFocus(bool isFocus) {
    _isPasswordFocus.value = false;
    _isEmailFocus.value = isFocus;
  }

  bool getIsEmailFocus() {
    return _isEmailFocus.value;
  }

  void setIsEmailEditing() {
    _isEmailEditing.value = PStringUtils.isNotEmpty(_emailController.value.text);
  }

  bool getIsEmailEditing() {
    return _isEmailEditing.value;
  }

  void setIsEmailValidate(bool isValidate) {
    _isEmailValidate.value = isValidate;
  }

  // Mật khẩu
  final Rx<TextEditingController> _passwordController = TextEditingController().obs;
  final Rx<bool> _isPasswordFocus = false.obs;
  final Rx<bool> _isPasswordEditing = false.obs;
  final Rx<bool> _isPasswordValidate = false.obs;

  TextEditingController getPasswordController() {
    return _passwordController.value;
  }

  void clearPasswordText() {
    _passwordController.value.clear();
  }

  void setIsPasswordFocus(bool isFocus) {
    _isEmailFocus.value = false;
    _isPasswordFocus.value = isFocus;
  }

  bool getIsPasswordFocus() {
    return _isPasswordFocus.value;
  }

  void setIsPasswordEditing() {
    _isPasswordEditing.value = PStringUtils.isNotEmpty(_passwordController.value.text);
  }

  bool getIsPasswordEditing() {
    return _isPasswordEditing.value;
  }

  void setIsPasswordValidate(bool isValidate) {
    _isPasswordValidate.value = isValidate;
  }

  // Xác thực dữ liệu
  bool getIsDataValidated() {
    return _isEmailValidate.value
        && _isPasswordValidate.value;
  }

  final Rx<bool> _isApiPending = false.obs;

  bool getIsApiPending() {
    return _isApiPending.value;
  }

  Future<void> login() async {
    try {
      _isApiPending.value = true;
      bool response = await _loginApi
          .login(_emailController.value.text, _passwordController.value.text, null, null, "Đăng nhập thành công");
      if (response) {
        Get.toNamed(PRoute.homeView);
      }
    } finally {
      _isApiPending.value = false;
    }
  }
}
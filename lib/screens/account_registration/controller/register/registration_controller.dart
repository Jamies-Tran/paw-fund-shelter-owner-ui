import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:paw_fund_shelter_owner/repository/api/models/account/account_model.dart';
import 'package:paw_fund_shelter_owner/repository/api/register/registration_api.dart';
import 'package:paw_fund_shelter_owner/share/bootstrap/configuration/route/routes.dart';
import 'package:paw_fund_shelter_owner/share/bootstrap/utils/paw_utils.dart';
import 'package:paw_fund_shelter_owner/share/constans/handle_response/handle_response.dart';

class RegistrationController extends GetxController {
  late IRegistrationApi _registrationApi;

  @override
  void onInit() {
    super.onInit();
    _registrationApi = Get.find();
  }

  // logo đặt dưới nút đăng ký
  final Rx<String> _logoRegisterUrl = "".obs;
  final Rx<bool> _isLogoRegPending = true.obs;

  void setLogoRegisterUrl(String url) {
    _logoRegisterUrl.value = url;
  }

  String getLogoRegisterUrl() {
    return _logoRegisterUrl.value;
  }

  bool getIsLogoRegPending() {
    return _isLogoRegPending.value;
  }

  // họ
  final Rx<TextEditingController> _firstNameController = TextEditingController().obs;
  final Rx<bool> _isFirstNameHover = false.obs;
  final Rx<bool> _isFirstNameValidate = false.obs;

  TextEditingController getFirstNameController() {
    return _firstNameController.value;
  }

  void clearFirstNameText() {
    _firstNameController.value.clear();
  }

  void setIsFirstNameHover(bool isFirstNameHover) {
    _isLastNameHover.value = false;
    _isEmailHover.value = false;
    _isPhoneHover.value = false;
    _isBirthdayHover.value = false;
    _isPasswordHover.value = false;
    _isRePasswordHover.value = false;
    _isFirstNameHover.value = isFirstNameHover;
  }

  bool getIsFirstNameHover() {
    return _isFirstNameHover.value;
  }

  bool getIsFirstNameEditing() {
    return PStringUtils.isNotEmpty(_firstNameController.value.text);
  }

  bool getIsFirstNameValidate() {
    return _isFirstNameValidate.value;
  }

  void setIsFirstNameValidate(bool validate) {
    _isFirstNameValidate.value = validate;
  }

  // tên
  final Rx<TextEditingController> _lastNameController = TextEditingController().obs;
  final Rx<bool> _isLastNameHover = false.obs;
  final Rx<bool> _isLastNameValidate = false.obs;

  TextEditingController getLastNameController() {
    return _lastNameController.value;
  }

  void clearLastNameText() {
    _lastNameController.value.clear();
  }

  void setIsLastNameHover(bool isLastNameHover) {
    _isFirstNameHover.value = false;
    _isEmailHover.value = false;
    _isPhoneHover.value = false;
    _isBirthdayHover.value = false;
    _isPasswordHover.value = false;
    _isRePasswordHover.value = false;
    _isLastNameHover.value = isLastNameHover;
  }

  bool getIsLastNameHover() {
    return _isLastNameHover.value;
  }

  bool getIsLastNameEditing() {
    return PStringUtils.isNotEmpty(_lastNameController.value.text);
  }

  bool getIsLastNameValidate() {
    return _isLastNameValidate.value;
  }

  void setIsLastNameValidate(bool validate) {
    _isLastNameValidate.value = validate;
  }

  // ngày sinh
  final Rx<TextEditingController> _birthdayController = TextEditingController().obs;
  final Rx<bool> _isBirthdayHover = false.obs;
  final Rx<bool> _isBirthdayValidate = false.obs;

  TextEditingController getBirthdayController() {
    return _birthdayController.value;
  }

  void setBirthdayControllerText(String text) {
    _birthdayController.value.text = text;
  }

  void clearBirthdayText() {
    _birthdayController.value.clear();
  }

  void setIsBirthdayHover(bool isBirthdayHover) {
    _isFirstNameHover.value = false;
    _isLastNameHover.value = false;
    _isEmailHover.value = false;
    _isPhoneHover.value = false;
    _isPasswordHover.value = false;
    _isRePasswordHover.value = false;
    _isBirthdayHover.value = isBirthdayHover;
  }

  bool getIsBirthdayHover() {
    return _isBirthdayHover.value;
  }

  bool getIsBirthdayEditing() {
    return PStringUtils.isNotEmpty(_birthdayController.value.text);
  }

  bool getIsBirthdayValidate() {
    return _isBirthdayValidate.value;
  }

  void setIsBirthdayValidate() {
    _isBirthdayValidate.value = PStringUtils.isNotEmpty(_birthdayController.value.text);
  }

  // email
  final Rx<TextEditingController> _emailController = TextEditingController().obs;
  final Rx<bool> _isEmailHover = false.obs;
  final Rx<bool> _isEmailValidate = false.obs;

  TextEditingController getEmailController() {
    return _emailController.value;
  }

  void clearEmailText() {
    _emailController.value.clear();
  }

  void setIsEmailHover(bool isEmailHover) {
    _isFirstNameHover.value = false;
    _isLastNameHover.value = false;
    _isPhoneHover.value = false;
    _isBirthdayHover.value = false;
    _isPasswordHover.value = false;
    _isRePasswordHover.value = false;
    _isEmailHover.value = isEmailHover;
  }

  bool getIsEmailHover() {
    return _isEmailHover.value;
  }

  bool getIsEmailEditing() {
    return PStringUtils.isNotEmpty(_emailController.value.text);
  }

  bool getIsEmailValidate() {
    return _isEmailValidate.value;
  }

  void setIsEmailValidate(bool validate) {
    _isEmailValidate.value = validate;
  }


  // số điện thoại
  final Rx<TextEditingController> _phoneController = TextEditingController().obs;
  final Rx<bool> _isPhoneHover = false.obs;
  final Rx<bool> _isPhoneValidate = false.obs;

  TextEditingController getPhoneController() {
    return _phoneController.value;
  }

  void clearPhoneText() {
    return _phoneController.value.clear();
  }

  void setIsPhoneHover(bool isPhoneHover) {
    _isFirstNameHover.value = false;
    _isLastNameHover.value = false;
    _isEmailHover.value = false;
    _isBirthdayHover.value = false;
    _isPasswordHover.value = false;
    _isRePasswordHover.value = false;
    _isPhoneHover.value = isPhoneHover;
  }

  bool getIsPhoneHover() {
    return _isPhoneHover.value;
  }

  bool getIsPhoneEditing() {
    return PStringUtils.isNotEmpty(_phoneController.value.text);
  }

  bool getIsPhoneValidate() {
    return _isPhoneValidate.value;
  }

  void setIsPhoneValidate(bool validate) {
    _isPhoneValidate.value = validate;
  }

  // mật khẩu
  final Rx<TextEditingController> _passwordController = TextEditingController().obs;
  final Rx<bool> _isPasswordHover = false.obs;
  final Rx<bool> _isPasswordValidate = false.obs;

  TextEditingController getPasswordController() {
    return _passwordController.value;
  }

  void clearPasswordText() {
    _passwordController.value.clear();
  }

  void setIsPasswordHover(bool isPasswordHover) {
    _isBirthdayHover.value = false;
    _isFirstNameHover.value = false;
    _isLastNameHover.value = false;
    _isEmailHover.value = false;
    _isPhoneHover.value = false;
    _isPasswordHover.value = false;
    _isRePasswordHover.value = isPasswordHover;
  }

  bool getIsPasswordHover() {
    return _isPasswordHover.value;
  }

  bool getIsPasswordEditing() {
    return PStringUtils.isNotEmpty(_passwordController.value.text);
  }

  bool getIsPasswordValidate() {
    return _isPasswordValidate.value;
  }

  void setIsPasswordValidate(bool validate) {
    _isPasswordValidate.value = validate;
  }


  // xác nhận mật khẩu
  final Rx<TextEditingController> _rePasswordController = TextEditingController().obs;
  final Rx<bool> _isRePasswordHover = false.obs;
  final Rx<bool> _isRePasswordValidate = false.obs;

  TextEditingController getRePasswordController() {
    return _rePasswordController.value;
  }

  void clearRePasswordText() {
    _rePasswordController.value.clear();
  }

  void setIsRePasswordHover(bool isRePasswordHover) {
    _isBirthdayHover.value = false;
    _isFirstNameHover.value = false;
    _isLastNameHover.value = false;
    _isEmailHover.value = false;
    _isPhoneHover.value = false;
    _isRePasswordHover.value = false;
    _isPasswordHover.value = isRePasswordHover;

  }

  bool getIsRePasswordHover() {
    return _isRePasswordHover.value;
  }

  bool getIsRePasswordEditing() {
    return PStringUtils.isNotEmpty(_rePasswordController.value.text);
  }

  bool getIsRePasswordValidate() {
    return _isRePasswordValidate.value;
  }

  bool getIsRePasswordMatch() {
    return PObjectUtils
        .isEquals(_passwordController.value.text, _rePasswordController.value.text);
  }

  void setIsRePasswordValidate(bool validate) {
    _isRePasswordValidate.value = validate;
  }


  // đang call api service
  final Rx<bool> _isPending = false.obs;

  bool getIsPending() {
    return _isPending.value;
  }

  // validate dữ liệu


  bool getIsDataValidated() {

    return _isEmailValidate.value
        && _isPasswordValidate.value
        && _isBirthdayValidate.value
        && getIsRePasswordMatch()
        && _isFirstNameValidate.value
        && _isLastNameValidate.value
        && _isBirthdayValidate.value
        && _isPhoneValidate.value;
  }

  final Rx<bool> _isPassValidated = true.obs;


  bool getIsPassValidated() {
    return _isPassValidated.value;
  }

  void clearAllText() {
    _emailController.value.clear();
    _passwordController.value.clear();
    _rePasswordController.value.clear();
    _lastNameController.value.clear();
    _firstNameController.value.clear();
    _birthdayController.value.clear();
    _phoneController.value.clear();
  }

  Future<void> register() async {
    try {
      _isPending.value = true;

      Account account = Account(
          firstName: _firstNameController.value.text,
          lastName: _lastNameController.value.text,
          email: _emailController.value.text,
          phone: _phoneController.value.text,
          dateOfBirth: PDateTimeUtils.formatDateTime(_birthdayController.value.text, "yyyy-MM-dd"),
          password: _passwordController.value.text
      );

      ValueResponse valueResponse = await _registrationApi.register(account);
      if (PResponseStatusUtils.isSuccess(valueResponse)) {
        int accountId = valueResponse.data;
        Get.toNamed(PRoute.sendingVerificationView, arguments: {"accountId": accountId});
      }

    } finally {
      _isPending.value = false;
      clearAllText();
    }
  }
}
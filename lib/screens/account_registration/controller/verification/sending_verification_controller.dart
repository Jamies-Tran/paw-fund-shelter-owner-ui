import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:paw_fund_shelter_owner/repository/api/account/account_api.dart';
import 'package:paw_fund_shelter_owner/repository/api/models/account/account_model.dart';
import 'package:paw_fund_shelter_owner/repository/api/verification/verification_api.dart';
import 'package:paw_fund_shelter_owner/share/bootstrap/configuration/route/routes.dart';
import 'package:paw_fund_shelter_owner/share/bootstrap/utils/paw_utils.dart';

class SendingVerificationController extends GetxController {
  late IAccountApi _accountApi;
  late IVerificationApi _verificationApi;
  final Rx<int> _accountId = 0.obs;

  @override
  void onInit() {
    super.onInit();
    _accountApi = Get.find();
    _verificationApi = Get.find();
    fetchAccountId();
    fetchData();
  }

  void fetchAccountId() {
    final args = Get.arguments;
    if (PObjectUtils.isNotNull(args) && PObjectUtils.isNotNull(args["accountId"])) {
      _accountId.value = args["accountId"];
    } else {
      Future.delayed(Duration.zero).whenComplete(() => Get.toNamed(PRoute.registrationView),);
    }
  }

  void fetchData() {
    fetchAccountById(_accountId.value).whenComplete(() => fetchDataToView(),);
  }

  // tài khoản
  final Rx<Account> _account = Account().obs;


  // email
  final Rx<TextEditingController> _emailController = TextEditingController().obs;
  final Rx<bool> _isEmailFocus = false.obs;
  final Rx<bool> _isEmailValidate = false.obs;


  void clearEmailText() {
    _emailController.value.clear();
  }

  void setIsEmailFocus(bool isFocus) {
    _isBirthdayFocus.value = false;
    _isFirstNameFocus.value = false;
    _isLastNameFocus.value = false;
    _isPhoneFocus.value = false;
    _isEmailFocus.value = isFocus;
  }

  bool getIsEmailFocus() {
    return _isEmailFocus.value;
  }

  bool getIsEmailEditing() {
    return PStringUtils.isNotEmpty(_emailController.value.text);
  }

  void setIsEmailValidate(bool isValidate) {
    _isEmailValidate.value = isValidate;
  }

  // ngày sinh
  final Rx<TextEditingController> _birthdayController = TextEditingController().obs;
  final Rx<bool> _isBirthdayFocus = false.obs;
  final Rx<bool> _isBirthdayValidate = false.obs;

  TextEditingController getBirthdayController() {
    return _birthdayController.value;
  }

  void setBirthdayControllerText(String value) {
    _birthdayController.value.text = value;
  }

  void clearBirthdayText() {
    _birthdayController.value.clear();
  }

  void setIsBirthdayFocus(bool isFocus) {
    _isEmailFocus.value = false;
    _isFirstNameFocus.value = false;
    _isLastNameFocus.value = false;
    _isPhoneFocus.value = false;
    _isBirthdayFocus.value = isFocus;
  }

  bool getIsBirthdayFocus() {
    return _isBirthdayFocus.value;
  }

  void setIsBirthdayValidate() {
    _isBirthdayValidate.value = PStringUtils.isNotEmpty(_birthdayController.value.text);
  }

  // họ
  final Rx<TextEditingController> _firstNameController = TextEditingController().obs;
  final Rx<bool> _isFirstNameFocus = false.obs;
  final Rx<bool> _isFirstNameValidate = false.obs;

  TextEditingController getFirstNameController() {
    return _firstNameController.value;
  }

  void clearFirstNameText() {
    _firstNameController.value.clear();
  }

  void setIsFirstNameFocus(bool isFocus) {
    _isEmailFocus.value = false;
    _isBirthdayFocus.value = false;
    _isLastNameFocus.value = false;
    _isPhoneFocus.value = false;
    _isFirstNameFocus.value = isFocus;
  }

  bool getIsFirstNameFocus() {
    return _isFirstNameFocus.value;
  }

  void setIsFirstNameValidate(bool isValidate) {
    _isFirstNameValidate.value = isValidate;
  }

  // tên
  final Rx<TextEditingController> _lastNameController = TextEditingController().obs;
  final Rx<bool> _isLastNameFocus = false.obs;
  final Rx<bool> _isLastNameValidate = false.obs;

  TextEditingController getLastNameController() {
    return _lastNameController.value;
  }

  void clearLastNameText() {
    _lastNameController.value.clear();
  }

  void setIsLastNameFocus(bool isFocus) {
    _isEmailFocus.value = false;
    _isBirthdayFocus.value = false;
    _isFirstNameFocus.value = false;
    _isPhoneFocus.value = false;
    _isLastNameFocus.value = isFocus;
  }

  bool getIsLastNameFocus() {
    return _isLastNameFocus.value;
  }

  void setIsLastNameValidate(bool isValidate) {
    _isLastNameValidate.value = isValidate;
  }

  // số điện thoại
  final Rx<TextEditingController> _phoneController = TextEditingController().obs;
  final Rx<bool> _isPhoneFocus = false.obs;
  final Rx<bool> _isPhoneValidate = false.obs;

  TextEditingController getPhoneController() {
    return _phoneController.value;
  }

  void clearPhoneText() {
    _phoneController.value.clear();
  }

  void setIsPhoneFocus(bool isFocus) {
    _isEmailFocus.value = false;
    _isBirthdayFocus.value = false;
    _isFirstNameFocus.value = false;
    _isLastNameFocus.value = false;
    _isPhoneFocus.value = isFocus;
  }

  bool getIsPhoneFocus() {
    return _isPhoneFocus.value;
  }

  void setIsPhoneValidate(bool isValidate) {
    _isPhoneValidate.value = isValidate;
  }

  // mã xác nhận
  final Rx<TextEditingController> _verificationCodeController = TextEditingController().obs;
  final Rx<bool> _isVerificationCodeFocus = false.obs;
  final Rx<bool> _isVerificationCodeValidate = false.obs;

  TextEditingController getVerificationCodeController() {
    return _verificationCodeController.value;
  }

  void clearVerificationCodeText() {
    _verificationCodeController.value.clear();
  }

  void setIsVerificationCodeFocus(bool isFocus) {
    _isEmailFocus.value = false;
    _isBirthdayFocus.value = false;
    _isFirstNameFocus.value = false;
    _isLastNameFocus.value = false;
    _isPhoneFocus.value = false;
    _isVerificationCodeFocus.value = isFocus;
  }

  bool getIsVerificationCodeFocus() {
    return _isVerificationCodeFocus.value;
  }

  void setIsVerificationCodeValidate(bool isValidate) {
    _isVerificationCodeValidate.value = isValidate;
  }

  void fetchDataToView() {
    _emailController.value.text = _account.value.email ?? "";
    _birthdayController.value.text = _account.value.dateOfBirth?.toIso8601String().substring(0, 10) ?? "";
    _firstNameController.value.text = _account.value.firstName ?? "";
    _lastNameController.value.text = _account.value.lastName ?? "";
    _phoneController.value.text = _account.value.phone ?? "";
  }

  TextEditingController getEmailEditingController() {
    return _emailController.value;
  }

  // bật điều chỉnh account
  final Rx<bool> _isToggleAccountEdit = false.obs;

  void setIsToggleAccountEdit(bool isToggle) {
    _isToggleAccountEdit.value = isToggle;
  }

  bool getIsToggleAccountEdit() {
    return _isToggleAccountEdit.value;
  }

  // toggle nhập mã xác nhận
  final Rx<bool> _isToggleSendingCode = false.obs;

  void setIsToggleSendingCode(bool isToggle) {
    _isToggleSendingCode.value = isToggle;
  }

  bool getIsToggleSendingCode() {
    return _isToggleSendingCode.value;
  }

  // peding call api
  final Rx<bool> _isApiPending = false.obs;

  bool getIsApiPending() {
    return _isApiPending.value;
  }

  // validate dữ liệu
  bool getIsDataValidated() {
    return PStringUtils.isNotEmpty(_birthdayController.value.text)
        && PStringUtils.isNotEmpty(_firstNameController.value.text)
        && PStringUtils.isNotEmpty(_lastNameController.value.text)
        && PStringUtils.isNotEmpty(_phoneController.value.text)
        && PStringUtils.isNotEmpty(_birthdayController.value.text);
  }
  
  Future<void> fetchAccountById(int accountId) async {
     Account account = await _accountApi.findAccountById(accountId, null);
     _account.value = account;
     _isToggleAccountEdit.value = false;
  }

  Future<void> updateAccount() async {
    try {
      _isApiPending.value = true;

      Account account = Account(
          email: _emailController.value.text,
          firstName: _firstNameController.value.text,
          lastName: _lastNameController.value.text,
          password: _account.value.password,
          dateOfBirth: PDateTimeUtils.formatDateTime(_birthdayController.value.text, "yyyy-MM-dd"),
          phone: _phoneController.value.text
      );

      await _accountApi.updateAccount(_accountId.value, account, "Cập nhật tài khoản thành công");
    } finally {
      _isApiPending.value = false;
    }
  }

  Future<void> sendVerificationAccount() async {
    try {
      _isApiPending.value = true;

      String email = _emailController.value.text;
      await _verificationApi.sendVerifyAccount(email, "Đã gửi mã xác nhận đến $email")
          .whenComplete(() => _isToggleSendingCode.value = true,);
    } finally {
      _isApiPending.value = false;
    }
  }

  Future<void> activeAccount() async {
    try {
      _isApiPending.value = true;
      bool isSuccess = await _accountApi
          .activeAccount(_account.value.accountId!, _verificationCodeController.value.text, "Kích hoạt tài khoản thành công");
      isSuccess ? Get.toNamed(PRoute.loginView) : ();
    } finally {
      _isApiPending.value = false;
    }
  }
}
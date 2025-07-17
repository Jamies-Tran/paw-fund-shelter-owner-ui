import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:paw_fund_shelter_owner/repository/api/account/account_api.dart';
import 'package:paw_fund_shelter_owner/repository/api/models/account/account_model.dart';
import 'package:paw_fund_shelter_owner/share/bootstrap/utils/paw_utils.dart';

class SendingVerificationController extends GetxController {
  late IAccountApi _accountApi;
  late int _accountId;

  @override
  void onInit() {
    super.onInit();
    final args = Get.arguments as Map<String, dynamic>;
    _accountId = args["accountId"];
    _accountApi = Get.find();
    fetchAccountById(_accountId).whenComplete(() => fetchData(),);
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

  void fetchData() {
    _emailController.value.text = _account.value.email ?? "";
    _birthdayController.value.text = _account.value.dateOfBirth?.toIso8601String() ?? "";
    _firstNameController.value.text = _account.value.firstName ?? "";
    _lastNameController.value.text = _account.value.lastName ?? "";
    _phoneController.value.text = _account.value.phone ?? "";
  }

  TextEditingController getEmailEditingController() {
    return _emailController.value;
  }

  // bật điều chỉnh account
  final Rx<bool> _isToggleAccountEdit = true.obs;

  void setIsToggleAccountEdit(bool isToggle) {
    _isToggleAccountEdit.value = isToggle;
  }

  bool getIsToggleAccountEdit() {
    return _isToggleAccountEdit.value;
  }

  // peding call api
  final Rx<bool> _isApiPending = false.obs;

  bool getIsApiPending() {
    return _isApiPending.value;
  }

  // validate dữ liệu
  bool getIsDataValidate() {
    return _isEmailValidate.value && _isBirthdayValidate.value
        && _isFirstNameValidate.value && _isLastNameValidate.value
        && _isPhoneValidate.value;
  }
  
  Future<void> fetchAccountById(int accountId) async {
     Account account = await _accountApi.findAccountById(accountId);
     _account.value = account;
  }
}
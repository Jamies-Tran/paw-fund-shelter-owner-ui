import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:paw_fund_shelter_owner/screens/account_registration/repository/api/register/model/registration_model.dart';
import 'package:paw_fund_shelter_owner/screens/account_registration/repository/api/register/registration_api.dart';
import 'package:paw_fund_shelter_owner/screens/medias/repository/firebase/media_firebase.dart';
import 'package:paw_fund_shelter_owner/share/bootstrap/configuration/env_interop.dart';
import 'package:paw_fund_shelter_owner/share/bootstrap/utils/paw_utils.dart';

class RegistrationController extends GetxController {

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

  final Rx<TextEditingController> _firstNameController = TextEditingController().obs;
  final Rx<bool> _isFirstNameHover = false.obs;

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

  final Rx<TextEditingController> _lastNameController = TextEditingController().obs;
  final Rx<bool> _isLastNameHover = false.obs;

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


  final Rx<TextEditingController> _birthdayController = TextEditingController().obs;
  final Rx<bool> _isBirthdayHover = false.obs;

  TextEditingController getBirthdayController() {
    return _birthdayController.value;
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


  final Rx<TextEditingController> _emailController = TextEditingController().obs;
  final Rx<bool> _isEmailHover = false.obs;

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


  final Rx<TextEditingController> _phoneController = TextEditingController().obs;
  final Rx<bool> _isPhoneHover = false.obs;

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


  final Rx<TextEditingController> _passwordController = TextEditingController().obs;
  final Rx<bool> _isPasswordHover = false.obs;

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


  final Rx<TextEditingController> _rePasswordController = TextEditingController().obs;
  final Rx<bool> _isRePasswordHover = false.obs;

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

  final Rx<bool> _isPending = false.obs;

  bool getIsPending() {
    return _isPending.value;
  }

  final Rx<bool> _isDataValidated = true.obs;

  void setIsDataValidated(bool isDataValidated) {
    _isDataValidated.value = isDataValidated;
  }

  bool getIsDataValidated() {
    return _isDataValidated.value;
  }


  final Rx<bool> _isPassValidated = true.obs;

  void setValidatePass() {
    _isPassValidated.value = PObjectUtils.isEquals(_passwordController.value.text, _rePasswordController.value.text);
    _isDataValidated.value = PObjectUtils.isEquals(_passwordController.value.text, _rePasswordController.value.text);
  }

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

  late IRegistrationApi _registrationApi;

  late IMediaFirebase _mediaFirebase;

  @override
  void onInit() {
    super.onInit();
    _registrationApi = Get.find();
    _mediaFirebase = Get.find();
  }

  Future<void> register() async {
    try {
      _isPending.value = true;

      DateFormat dateFormat = DateFormat("yyyy-MM-dd");

      Account account = Account(
          firstName: _firstNameController.value.text,
          lastName: _lastNameController.value.text,
          email: _emailController.value.text,
          phone: _phoneController.value.text,
          dateOfBirth: dateFormat.parse(_birthdayController.value.text),
          password: _passwordController.value.text
      );

      await _registrationApi.register(account);
    } finally {
      _isPending.value = false;
      clearAllText();
    }
  }

  Future<void> getImageUrl(String path) async {
    try {
      _isLogoRegPending.value = true;
      String url = await _mediaFirebase.getUrl(path);
      _logoRegisterUrl.value = url;
    } catch (e) {
      print(e);
    } finally {
      _isLogoRegPending.value = false;
    }
  }
}
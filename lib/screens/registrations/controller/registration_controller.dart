import 'package:get/get.dart';
import 'package:paw_fund_shelter_owner/screens/registrations/api/data/registration_data.dart';
import 'package:paw_fund_shelter_owner/screens/registrations/api/registration_api.dart';

class RegistrationController {
  final Rx<String> _firstName = "".obs;
  final Rx<String> _lastName = "".obs;
  final Rx<String> _email = "".obs;
  final Rx<String> _phone = "".obs;
  final Rx<String> _password = "".obs;

  final Rx<bool> _isPending = false.obs;

  final IRegistrationApi _registrationApi = Get.find();

  void setFirstName(String firstName) {
    _firstName.value = firstName;
  }

  void setLastName(String lastName) {
    _lastName.value = lastName;
  }

  void setEmail(String email) {
    _email.value = email;
  }

  void setPhone(String phone) {
    _phone.value = phone;
  }

  void setPassword(String password) {
    _password.value = password;
  }

  Future<void> register() async {
    try {
      _isPending.value = true;
      Account account = Account(
          firstName: _firstName.value,
          lastName: _lastName.value,
          email: _email.value,
          phone: _phone.value,
          password: _password.value
      );

      await _registrationApi.register(account);
    } finally {
      _isPending.value = false;
    }
  }
}
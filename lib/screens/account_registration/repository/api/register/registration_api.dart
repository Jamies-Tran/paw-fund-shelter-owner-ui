import 'dart:async';

import 'package:get/get.dart';
import 'package:paw_fund_shelter_owner/screens/account_registration/repository/api/register/model/registration_model.dart';
import 'package:paw_fund_shelter_owner/share/bootstrap/configuration/env_interop.dart';
import 'package:paw_fund_shelter_owner/share/bootstrap/configuration/route/routes.dart';
import 'package:paw_fund_shelter_owner/share/bootstrap/utils/paw_api_utils.dart';
import 'package:paw_fund_shelter_owner/share/bootstrap/utils/paw_utils.dart';

abstract class IRegistrationApi {
  Future<dynamic> register(Account account);
}

class RegistrationApiImpl extends IRegistrationApi {
  late PApiUtils _api;

  RegistrationApiImpl() {
    _api = PApiUtils();
  }

  @override
  Future register(Account account) async {
    var response = await _api.doPost(PAW_REGISTRATION, account.toJson());
    if (PResponseStatusUtils.isSuccess(response)) {
      Get.toNamed(PRoute.sendingVerificationView);
    }
  }
}
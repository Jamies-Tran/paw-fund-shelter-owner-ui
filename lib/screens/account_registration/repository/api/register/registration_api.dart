import 'dart:async';

import 'package:get/get.dart';
import 'package:paw_fund_shelter_owner/screens/account_registration/repository/api/register/model/registration_model.dart';
import 'package:paw_fund_shelter_owner/share/bootstrap/configuration/env_interop.dart';
import 'package:paw_fund_shelter_owner/share/bootstrap/configuration/route/routes.dart';
import 'package:paw_fund_shelter_owner/share/bootstrap/utils/paw_api_utils.dart';
import 'package:paw_fund_shelter_owner/share/bootstrap/utils/paw_utils.dart';
import 'package:paw_fund_shelter_owner/share/constans/handle_response/handle_response.dart';

abstract class IRegistrationApi {
  Future<dynamic> register(Account account);
}

class RegistrationApiImpl extends IRegistrationApi {
  late PApiUtils _api;

  RegistrationApiImpl() {
    _api = PApiUtils();
  }

  @override
  Future<ValueResponse> register(Account account) async {
    return await _api.doPost(PAW_REGISTRATION, account.toJson());
  }
}
import 'package:dio/dio.dart';
import 'package:paw_fund_shelter_owner/repository/api/models/account/account_model.dart';
import 'package:paw_fund_shelter_owner/share/bootstrap/configuration/env_interop.dart';
import 'package:paw_fund_shelter_owner/share/bootstrap/utils/paw_api_utils.dart';
import 'package:paw_fund_shelter_owner/share/bootstrap/utils/paw_utils.dart';
import 'package:paw_fund_shelter_owner/share/constans/handle_response/handle_response.dart';

abstract class IAccountApi {
  Future<Account> findAccountById(int accountId);
}

class AccountApiImpl extends IAccountApi {
  late PApiUtils _apiUtils;

  AccountApiImpl() {
    _apiUtils = PApiUtils();
  }

  @override
  Future<Account> findAccountById(int accountId) async {
    ValueResponse response = await _apiUtils
        .doGet("$PAW_ACCOUNT_PUB_LOCAL/$accountId", null);

    return Account.fromJson(response.data);
  }
}
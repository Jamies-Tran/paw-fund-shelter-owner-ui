import 'package:dio/dio.dart';
import 'package:paw_fund_shelter_owner/repository/api/models/account/account_model.dart';
import 'package:paw_fund_shelter_owner/share/bootstrap/configuration/env_interop.dart';
import 'package:paw_fund_shelter_owner/share/bootstrap/utils/paw_api_utils.dart';
import 'package:paw_fund_shelter_owner/share/bootstrap/utils/paw_utils.dart';
import 'package:paw_fund_shelter_owner/share/constans/handle_response/handle_response.dart';

abstract class IAccountApi {
  Future<Account> findAccountById(int accountId, String? successMessage);

  Future<void> updateAccount(int accountId, Account account, String? successMessage);

  Future<bool> activeAccount(int accountId, String verificationCode, String? successMessage);
}

class AccountApiImpl extends IAccountApi {
  late PApiUtils _apiUtils;

  AccountApiImpl() {
    _apiUtils = PApiUtils();
  }

  @override
  Future<Account> findAccountById(int accountId, String? successMessage) async {
    ValueResponse response = await _apiUtils
        .doGet("$PAW_ACCOUNT_PUB/$accountId", null);
    if (PResponseStatusUtils.isSuccess(response)) {
      PStringUtils.isNotEmpty(successMessage)
          ? HandleResponse.onSuccess(successMessage)
          : ();
    }

    return Account.fromJson(response.data);
  }

  @override
  Future<void> updateAccount(int accountId, Account account, String? successMessage) async {
    ValueResponse response = await _apiUtils
        .doPut("$PAW_ACCOUNT_PUB/$accountId", account.toJson());
    if (PResponseStatusUtils.isSuccess(response)) {
      PStringUtils.isNotEmpty(successMessage)
        ? HandleResponse.onSuccess(successMessage)
        : ();
    }
  }

  @override
  Future<bool> activeAccount(int accountId, String verificationCode, String? successMessage) async {
    ValueResponse response = await _apiUtils
        .doPatch("$PAW_ACCOUNT_PUB/$accountId/active", {"verificationCode": verificationCode});
    if (PResponseStatusUtils.isSuccess(response)) {
      PStringUtils.isNotEmpty(successMessage)
          ? HandleResponse.onSuccess(successMessage)
          : ();
    }

    return response.success!;
  }
}
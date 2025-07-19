import 'package:paw_fund_shelter_owner/share/bootstrap/configuration/env_interop.dart';
import 'package:paw_fund_shelter_owner/share/bootstrap/utils/paw_api_utils.dart';
import 'package:paw_fund_shelter_owner/share/bootstrap/utils/paw_utils.dart';
import 'package:paw_fund_shelter_owner/share/constans/handle_response/handle_response.dart';

abstract class IVerificationApi {
  Future<void> sendVerifyAccount(String email, String? successMessage);
}

class VerificationApiImpl implements IVerificationApi {
  late PApiUtils _apiUtils;

  VerificationApiImpl() {
    _apiUtils = PApiUtils();
  }

  @override
  Future<void> sendVerifyAccount(String email, String? successMessage) async {
    ValueResponse response = await _apiUtils
        .doPost(PAW_VERIFICATION_ACCOUNT, {"email": email});
    if (PResponseStatusUtils.isSuccess(response)) {
      PStringUtils.isNotEmpty(successMessage)
          ? HandleResponse.onSuccess(successMessage)
          : ();
    }
  }

}
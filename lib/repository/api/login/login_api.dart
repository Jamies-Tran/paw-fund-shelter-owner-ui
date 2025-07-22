import 'package:get/get.dart';
import 'package:paw_fund_shelter_owner/repository/api/models/login_info/login_info_model.dart';
import 'package:paw_fund_shelter_owner/repository/hive/auth/auth_hive.dart';
import 'package:paw_fund_shelter_owner/repository/hive/models/auth_hive_model.dart';
import 'package:paw_fund_shelter_owner/share/bootstrap/configuration/env_interop.dart';
import 'package:paw_fund_shelter_owner/share/bootstrap/utils/paw_api_utils.dart';
import 'package:paw_fund_shelter_owner/share/bootstrap/utils/paw_utils.dart';
import 'package:paw_fund_shelter_owner/share/constans/handle_response/handle_response.dart';

abstract class ILoginApi {
  Future<bool> login(String email, String password, double? latitude,
      double? longitude,String? successMessage);
}

class LoginApiImpl extends ILoginApi {
  late PApiUtils _apiUtils;
  late IAuthHive _authHive;

  LoginApiImpl() {
    _apiUtils = PApiUtils();
    _authHive = Get.find();
  }

  @override
  Future<bool> login(String email, String password, double? latitude,
      double? longitude, String? successMessage) async {
    ValueResponse response = await _apiUtils
        .doPost(PAW_LOGIN, {"email": email, "password": password, "latitude": latitude, "longitude": longitude});
    if (PResponseStatusUtils.isSuccess(response)) {
      PStringUtils.isNotEmpty(successMessage)
          ? HandleResponse.onSuccess(successMessage)
          : ();
    }
    LoginInfo loginInfo = LoginInfo.fromJson(response.data);
    _authHive.saveAuth(AuthHive(
        accountId: loginInfo.account!.accountId!,
        accessToken: loginInfo.accessToken!,
        refreshToken: loginInfo.refreshToken!,
        latitude: loginInfo.latitude,
        longitude: loginInfo.longitude
    ));

    return response.success!;
  }
}


import 'dart:async';

import 'package:dio/dio.dart';
import 'package:paw_fund_shelter_owner/screens/registrations/api/data/registration_data.dart';
import 'package:paw_fund_shelter_owner/share/bootstrap/configuration/env_interop.dart';
import 'package:paw_fund_shelter_owner/share/constans/handle_response/handle_response.dart';

abstract class IRegistrationApi {
  Future<dynamic> register(Account account);
}

class RegistrationApiImpl extends IRegistrationApi {
  late Dio dio;

  RegistrationApiImpl() {
    dio = Dio();
    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        options.headers["Content-Type"] = "application/json";
        options.connectTimeout = Duration(minutes: 15);
        options.receiveDataWhenStatusError = true;

        return handler.next(options);
      },
      onResponse: (response, handler) {
        if(response.statusCode == 200) {
          HandleResponse.onSuccess(response.statusCode.toString());
        }
        return handler.next(response);
      },
      onError: (error, handler) {
        HandleResponse.onError(error.message);
        return handler.next(error);
      },
    ));
  }

  @override
  Future register(Account account) async {
    try {
       dio = Dio();
       await dio.post(PAW_REGISTRATION, data: account.toJson());
    } on TimeoutException catch (e) {
      HandleResponse.onError(e.message);
    } on Exception catch (e) {
      HandleResponse.onError(null);
    }
  }
}
import 'dart:async';

import 'package:dio/dio.dart';
import 'package:paw_fund_shelter_owner/share/bootstrap/utils/paw_utils.dart';
import 'package:paw_fund_shelter_owner/share/constans/handle_response/handle_response.dart';

class PApiUtils {
  late Dio _dio;

  PApiUtils() {
    _dio = Dio();
    _dio.interceptors.add(LogInterceptor(
        request: true,
        requestHeader: true,
        requestBody: true,
        responseHeader: true,
        responseBody: true
    ));
    _dio.interceptors.add(
        InterceptorsWrapper(
          onRequest: (options, handler) {
            options.headers["Content-Type"] = "application/json";
            options.connectTimeout = Duration(minutes: 10);
            options.sendTimeout = Duration(minutes: 10);
            options.receiveTimeout = Duration(minutes: 15);
            options.receiveDataWhenStatusError = true;

            handler.next(options);
          },

          onResponse: (response, handler) {
            ValueResponse valueResponse = ValueResponse.fromJson(response.data);
            HandleResponse.onSuccess(valueResponse.message);

            handler.resolve(response);
          },

          onError: (error, handler) {
            if(PObjectUtils.isNotNull(error.response)) {
              ValueResponse valueResponse = ValueResponse
                  .fromJson(error.response?.data);
              HandleResponse.onError(valueResponse.message);
            }
            HandleResponse.onError("Có lỗi xảy ra! xin vui lòng liên hệ để xử lý");

            handler.next(error);
          },
    ));
  }

  Future<ValueResponse> doPost(String endpoint, dynamic json) async {
    Response response = await _dio.post(endpoint, data: json);
    return ValueResponse.fromJson(response.data);
  }

  Future<ValueResponse> doGet(String endPoint, Map<String, String> queryParams) async {
    Response response = await _dio.get(endPoint, queryParameters: queryParams);
    return ValueResponse.fromJson(response.data);
  }
}
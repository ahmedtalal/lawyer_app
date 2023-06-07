
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:flutter/foundation.dart';
import 'package:hokok/core/api_paths.dart';
import 'package:hokok/core/sl.dart';
import 'package:hokok/core/status_code.dart';


import '../data/services/local/user_info_local_storage.dart';
import 'api_consumer.dart';
import 'app_interceptor.dart';

class DioConsumer implements ApiConsumer {
  final Dio _dio;

  DioConsumer(this._dio) {
    (_dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (HttpClient client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return client;
    };

    _dio.options
      ..baseUrl = BASE_URL
      ..headers = headers()
      ..responseType = ResponseType.plain
      ..followRedirects = false
      ..validateStatus = (status) {
        return status! < StatusCode.internalServerError;
      };
    _dio.interceptors.add(sl<AppInterceptor>());
    if (kDebugMode) {
      _dio.interceptors.add(sl<LogInterceptor>());
    }
  }

  @override
  Future<Response> get(String path,
      {Map<String, dynamic>? queryParameters, bool useToken = false}) async {
    return await _dio.get(path, queryParameters: queryParameters);
  }

  @override
  Future<Response> post(String path,
      {Map<String, dynamic>? body,
        bool formDataIsEnabled = false,
        Map<String, dynamic>? queryParameters}) async {
    return await _dio.post(path,
        queryParameters: queryParameters,
        data: formDataIsEnabled ? FormData.fromMap(body!) : body);
  }

  @override
  Future<Response> put(String path,
      {Map<String, dynamic>? body,
        bool formDataIsEnabled = false,
        Map<String, dynamic>? queryParameters}) async {
    return await _dio.put(path,
        queryParameters: queryParameters,
        data: formDataIsEnabled ? FormData.fromMap(body!) : body);
  }

  // dynamic _handleResponseAsJson(Response<dynamic> response) {
  //   final responseJson = jsonDecode(response.data.toString());
  //   return responseJson;
  // }

  @override
  Future<Response> delete(String path,
      {Map<String, dynamic>? body,
        Map<String, dynamic>? queryParameters,
        bool formDataIsEnabled = false}) async {
    return await _dio.delete(
      path,
      queryParameters: queryParameters,
      data: formDataIsEnabled ? FormData.fromMap(body!) : body,
    );

  }

  @override
  Future<Response> patch(String path,
      {Map<String, dynamic>? body,
        Map<String, dynamic>? queryParameters,
        bool formDataIsEnabled = false}) async {
    return await _dio.patch(
      path,
      queryParameters: queryParameters,
      data: formDataIsEnabled ? FormData.fromMap(body!) : body,
    );
  }


  void updateHeaderToken(){
    _dio.options.headers = headers();
  }
}
Map<String, String> headers() {

  String? token = UserInfoLocalService.instance().getUserToken().token;
  print('HEADERS =>>>>>>>>>>>');
  return  {
    'Accept': 'application/json',
    'lang':  'en',
    if(token != null)
      'authorization': 'Bearer $token',
  };
}
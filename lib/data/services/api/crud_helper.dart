// ignore_for_file: avoid_print

import 'dart:io';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:flutter/foundation.dart';
import 'package:hokok/core/api_paths.dart';

class CrudApiHelper {
  // here using singleton pattern
  static final CrudApiHelper _crudApiHelper = CrudApiHelper._internal();
  CrudApiHelper._internal();
  static CrudApiHelper get instance => _crudApiHelper;

  Dio _initDio() {
    Dio dio = Dio(
      BaseOptions(
        baseUrl: BASE_URL,
        contentType: "application/json",
        headers: {
          "Accept": "application/json",
        },
      ),
    );
    if (BASE_URL.toLowerCase().startsWith('https') && !kIsWeb) {
      (dio.httpClientAdapter as IOHttpClientAdapter).onHttpClientCreate =
          (HttpClient dioClient) {
        dioClient.badCertificateCallback =
            ((X509Certificate cert, String host, int port) => true);
        return dioClient;
      };
    }

    return dio;
  }

  Future<Response> postRequest({
    dynamic data,
    required String path,
    Map<String, dynamic>? parameters,
    Options? options,
  }) async {
    Response response = await _initDio().post(
      path,
      data: data,
      queryParameters: parameters,
      options: options,
    );
    print(response);
    return response;
  }

  Future<Response> getRequest({
    required String path,
    Map<String, dynamic>? parameters,
    Options? options,
    dynamic data,
  }) async {
    return await _initDio().get(
      path,
      queryParameters: parameters,
      options: options,
      data: data,
    );
  }

  Future<Response> putRequest({
    required String path,
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParameter,
    Options? options,
  }) async {
    return await _initDio().put(
      path,
      data: data,
      queryParameters: queryParameter,
      options: options,
    );
  }

  Future<Response> deleteRequest({
    required String path,
    Map<String, dynamic>? parameters,
    Map<String, dynamic>? data,
    Options? options,
  }) async {
    return await _initDio().delete(
      path,
      data: data,
      queryParameters: parameters,
      options: options,
    );
  }
}

import 'package:dio/dio.dart';

class DioExceptions implements Exception {
  static dioErrorHandling(DioError dioError) {
    switch (dioError.type) {
      case DioErrorType.cancel:
        return "request to api server was cancelled";
      case DioErrorType.connectionTimeout:
        return "Connection timeout with api server";
      case DioErrorType.receiveTimeout:
        return "receive timeout in connection with api server";
      case DioErrorType.sendTimeout:
        return "send timeout in connection with api server";
      case DioErrorType.connectionError:
        return "connection to api server failed due to internet connection";
      case DioErrorType.badResponse:
        return _handleErrorMessage(
            dioError.response!.statusCode, dioError.response!.data);
      default:
        return "something went wrong";
    }
  }

  static dynamic _handleErrorMessage(
      int? statusCode, Map<String, dynamic> error) {
    switch (statusCode) {
      case 400:
        return error["error"];
      case 404:
        return error["error"];
      case 409:
        return error["error"];
      case 500:
        return "internal server error";
      case 401:
        return "Unauthorized";
      case 422:
        return error["errors"].toString();
      case 405:
        return "method not allowed";
      default:
        return "oops something went wrong";
    }
  }
}

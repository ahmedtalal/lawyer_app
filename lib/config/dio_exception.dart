import 'package:dio/dio.dart';

class DioExceptions implements Exception {
  static dioErrorHandling(DioError dioError) {
    switch (dioError.type) {
      case DioErrorType.cancel:
        return "تم إلغاء الطلب";
      case DioErrorType.connectionTimeout:
        return "يوجد مشكله في الاتصال بالخادم";
      case DioErrorType.receiveTimeout:
        return "يوجد مشكله في الاتصال بالخادم";
      case DioErrorType.sendTimeout:
        return "يوجد مشكله في الاتصال بالخادم";
      case DioErrorType.unknown:
        return "يوجد مشكله في الاتصال بالخادم";
      case DioErrorType.badResponse:
        return _handleErrorMessage(
            dioError.response!.statusCode, dioError.error);
      default:
        return "حدث خطا ما تأكد بانك متصل بالانترنت";
    }
  }

  static String _handleErrorMessage(int? statusCode, dynamic error) {
    switch (statusCode) {
      case 400:
        return "يوجد مشكله ما حاول الاتصال مرة اخري";
      case 409:
        return "يوجد مشكله ما حاول الاتصال مرة اخري";
      case 500:
        return "يوجد مشكله ما حاول الاتصال مرة اخري";
      case 401:
        return "يوجد مشكله ما حاول الاتصال مرة اخري";
      default:
        return "يوجد مشكله ما حاول الاتصال مرة اخري";
    }
  }
}

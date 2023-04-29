import 'package:dio/dio.dart';
import 'package:hokok/config/dio_exception.dart';
import 'package:hokok/core/api_paths.dart';
import 'package:hokok/core/debug_prints.dart';
import 'package:hokok/core/response_api_model.dart';
import 'package:hokok/data/models/certification_model.dart';
import 'package:hokok/data/services/api/crud_helper.dart';
import 'package:hokok/data/services/local/user_info_local_storage.dart';

class CertificationsAPiServices {
  static CertificationsAPiServices? _certificationsAPiServices;
  CertificationsAPiServices._internal();
  static CertificationsAPiServices instance() {
    if (_certificationsAPiServices == null) {
      return _certificationsAPiServices = CertificationsAPiServices._internal();
    }
    return _certificationsAPiServices!;
  }

  Future<Map<String, dynamic>> addLawyerCertificationSer(String certImg) async {
    try {
      Options options = Options(headers: {
        "authorization":
            "Bearer ${UserInfoLocalService.instance().getUserToken().token}"
      });
      Response response = await CrudApiHelper.instance.postRequest(
          path: ADD_CERTIFICATE_REQUEST_PATH,
          options: options,
          data: {
            "certificate_img": certImg,
          });
      printDone("the add lawyer certification success => ${response.data}");
      return successRequest(response.data);
    } on DioError catch (error) {
      final message = DioExceptions.dioErrorHandling(error);
      printError(
          "the add lawyer certification error from dio catch => $message");
      return failedRequest(message);
    } catch (e) {
      printError("the add lawyer certification error from catch => $e");
      return failedRequest(e.toString());
    }
  }

  Future<List<CertificationInfoModel>> getAllLawyerCertificationsSer() async {
    try {
      Options options = Options(headers: {
        "authorization":
            "Bearer ${UserInfoLocalService.instance().getUserToken().token}"
      });
      Response response = await CrudApiHelper.instance.getRequest(
        path: GET_CERTIFICATES_REQUEST_PATH,
        options: options,
      );
      printDone(
          "the get all lawyer certifications success => ${response.data}");
      return CertificationModel.fromJson(response.data).data!;
    } on DioError catch (error) {
      final message = DioExceptions.dioErrorHandling(error);
      printError(
          "the get all lawyer certifications error from dio catch => $error");
      return [];
    } catch (e) {
      printError("the get all lawyer certifications error from catch => $e");
      return [];
    }
  }

  Future<Map<String, dynamic>> deleteLawyerCertificationSer(int cerId) async {
    try {
      Options options = Options(headers: {
        "authorization":
            "Bearer ${UserInfoLocalService.instance().getUserToken().token}"
      });
      Response response = await CrudApiHelper.instance.deleteRequest(
        path: DELETE_CERTIFICATE_REQUEST_PATH +"$cerId".toString(),
        options: options,
      );
      printDone("the delete lawyer certification success => ${response.data}");
      return successRequest(response.data);
    } on DioError catch (error) {
      final message = DioExceptions.dioErrorHandling(error);
      printError(
          "the delete lawyer certification inf error from catch => $message");
      return failedRequest(message);
    } catch (e) {
      printError("the delete lawyer certification inf error from catch => $e");
      return failedRequest(e.toString());
    }
  }
}

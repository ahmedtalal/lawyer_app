import 'dart:async';

import 'package:dio/dio.dart';
import 'package:hokok/config/dio_exception.dart';
import 'package:hokok/core/api_paths.dart';
import 'package:hokok/core/debug_prints.dart';
import 'package:hokok/core/response_api_model.dart';
import 'package:hokok/data/models/client_profile_model.dart';
import 'package:hokok/data/models/lawyer_profile_model.dart';
import 'package:hokok/data/services/api/crud_helper.dart';
import 'package:hokok/data/services/local/user_info_local_storage.dart';
import 'package:hokok/domain/entities/lawyer_profile_entity.dart';

import '../../../domain/entities/client_profile_entity.dart';

class ProfileAPiService {
  static ProfileAPiService? _profileAPiService;
  ProfileAPiService._internal();
  static ProfileAPiService instance() {
    if (_profileAPiService == null) {
      return _profileAPiService = ProfileAPiService._internal();
    }
    return _profileAPiService!;
  }

  FutureOr<LawyerProfileEntity?> getLawyerProfileApiService() async {
    try {
      Options options = Options(headers: {
        "authorization":
            "Bearer ${UserInfoLocalService.instance().getUserToken().token}",
      });
      Response response = await CrudApiHelper.instance.getRequest(
        path: GET_PROFILE_REQUEST_PATH,
        options: options,
      );
      printDone("the get lawyer profile success => ${response.data}");
      printDone(
          "the get lawyer profile model success => ${LawyerProfileModel.lawyerFromJson(response.data)}");
      return LawyerProfileModel.lawyerFromJson(response.data);
    } on DioError catch (error) {
      String message = DioExceptions.dioErrorHandling(error);
      printError("the lawyer get profile error from dio catch => $message");
      return null;
    } catch (e) {
      printError("the lawyer get profile error from catch => $e");
      return null;
    }
  }

  FutureOr<Map<String, dynamic>> getClientProfileApiService() async {
    try {
      Options options = Options(headers: {
        "authorization":
            "Bearer ${UserInfoLocalService.instance().getUserToken().token}",
      });
      Response response = await CrudApiHelper.instance.getRequest(
        path: GET_PROFILE_REQUEST_PATH,
        options: options,
      );
      printDone("the get client profile success => ${response.data}");
      return successRequest(ClientProfileModel.fromJson(response.data).data!);
    } on DioError catch (error) {
      String message = DioExceptions.dioErrorHandling(error);
      printError("the get client profile error from dio catch => $message");
      return failedRequest(message);
    } catch (e) {
      printError("the get client profile error from catch => $e");
      return failedRequest(e);
    }
  }

  FutureOr<bool> updateProfileApiService(Map<String, dynamic> data) async {
    try {
      Options options = Options(headers: {
        "authorization":
            "Bearer ${UserInfoLocalService.instance().getUserToken().token}"
      });
      Response response = await CrudApiHelper.instance.postRequest(
        path: UPDATE_PROFILE_REQUEST_PATH,
        data: data,
        options: options,
      );
      printInfo("the update profile model => $data");
      printDone("the update profile success => ${response.data}");
      return true;
    } on DioError catch (error) {
      String message = DioExceptions.dioErrorHandling(error);
      printError("the update profile failed from dio catch => $message");
      return false;
    } catch (e) {
      printError("the update profile failed from dio catch => $e");
      return false;
    }
  }
}

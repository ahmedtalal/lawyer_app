import 'dart:async';

import 'package:dio/dio.dart';
import 'package:hokok/config/dio_exception.dart';
import 'package:hokok/core/api_paths.dart';
import 'package:hokok/core/debug_prints.dart';
import 'package:hokok/data/models/user_model.dart';
import 'package:hokok/data/services/api/api_helper.dart';
import 'package:hokok/data/services/local/user_info_local_storage.dart';
import 'package:hokok/domain/entities/user_entity.dart';

class ProfileAPiService {
  static ProfileAPiService? _profileAPiService;
  ProfileAPiService._internal();
  static ProfileAPiService instance() {
    if (_profileAPiService == null) {
      return _profileAPiService = ProfileAPiService._internal();
    }
    return _profileAPiService!;
  }

  FutureOr<UserEntity?> getProfileApiService() async {
    try {
      Options options = Options(headers: {
        "authorization":
            "Bearer ${UserInfoLocalService.instance().getUserToken().token}",
      });
      Response response = await CurdApiHelper.instance.getRequest(
        path: GET_PROFILE_REQUEST_PATH,
        options: options,
      );
      printDone("the get profile success => ${response.data}");
      printDone(
          "the get profile model success => ${UserModel.fromJson(response.data)}");
      return UserModel.fromJson(response.data);
    } on DioError catch (error) {
      String message = DioExceptions.dioErrorHandling(error);
      printError("the get profile error from dio catch => $message");
      return null;
    } catch (e) {
      printError("the get profile error from catch => $e");
      return null;
    }
  }

  FutureOr<bool> updateProfileApiService(Map<String, dynamic> data) async {
    try {
      Options options = Options(headers: {
        "authorization":
            "Bearer ${UserInfoLocalService.instance().getUserToken().token}"
      });
      Response response = await CurdApiHelper.instance.postRequest(
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

import 'dart:async';
import 'package:dio/dio.dart';
import 'package:hokok/config/dio_exception.dart';
import 'package:hokok/core/api_paths.dart';
import 'package:hokok/core/debug_prints.dart';
import 'package:hokok/core/response_api_model.dart';
import 'package:hokok/data/models/user_local_model.dart';
import 'package:hokok/data/services/api/crud_helper.dart';
import 'package:hokok/data/services/local/user_info_local_storage.dart';

class AuthApiService {
  static AuthApiService? _authService;
  AuthApiService._internal();
  static AuthApiService instance() {
    if (_authService == null) {
      return _authService = AuthApiService._internal();
    }
    return _authService!;
  }

  Future<Map<String, dynamic>> sendOptNumberService(
      Map<String, dynamic> phoneNumber) async {
    try {
      Response response = await CrudApiHelper.instance
          .postRequest(path: LOGIN_OPT_REQUEST_PATH, data: phoneNumber);
      printDone("the send opt using number done => ${response.data}");
      return successRequest(response.data);
    } on DioError catch (error) {
      String message = DioExceptions.dioErrorHandling(error);
      printError(
          "the send opt using phone number failed from dio catch => $message");
      return failedRequest(message);
    } catch (e) {
      printError(
          "the send opt using phone number failed from normal catch => ${e.toString()}");
      return failedRequest(e.toString());
    }
  }

  Future<Map<String, dynamic>> loginPhoneNumberService(
      Map<String, dynamic> data) async {
    try {
      Response response = await CrudApiHelper.instance
          .postRequest(path: LOGIN_REQUEST_PATH, data: data);
      printDone("the login using number done => ${response.data}");
      printInfo("the type => ${response.data["data"]["type"]}");
      UserLocalModel userModel = UserLocalModel.fromJson(response.data);
      printInfo("the user type => ${userModel.data!.userType}");
      UserData? userData = userModel.data;
      Map<String, dynamic> userMap = userData!.toJson();
      printInfo("the userlocal model is ${userMap["type"]}");
      final result =
          await UserInfoLocalService.instance().saveUserInfo(userMap);
      printDone("the response is $result");
      return successRequest(response.data);
    } on DioError catch (error) {
      String message = DioExceptions.dioErrorHandling(error);
      printError(
          "the login using phone number failed from dio catch => $message");
      return failedRequest(message);
    } catch (e) {
      printError(
          "the login using phone number failed from normal catch => ${e.toString()}");
      return failedRequest(e.toString());
    }
  }

  Future<Map<String, dynamic>> register(Map<String, dynamic> data) async {
    try {
      Response response = await CrudApiHelper.instance
          .postRequest(path: REGISTER_REQUEST_PATH, data: data);
      printDone("the register done => ${response.data}");

      return successRequest(response.data);
    } on DioError catch (error) {
      String message = DioExceptions.dioErrorHandling(error);
      printError("the register failed from dio catch => $message");
      return failedRequest(message);
    } catch (e) {
      printError("the user failed from dio catch => ${e.toString()}");
      return failedRequest(e.toString());
    }
  }

  bool checkIsUserLoginedService() {
    final result = UserInfoLocalService.instance().getUserInfo();
    printInfo("the user from storage is $result");
    if (result[mapValue] != "user not found") {
      return true;
    }
    return false;
  }

  FutureOr<bool> logOutApiService() async {
    try {
      Map<String, dynamic> userMap =
          UserInfoLocalService.instance().getUserInfo();
      UserData userData = UserData.fromJson(userMap);
      Options options =
          Options(headers: {"authorization": "Bearer ${userData.token}"});
      Response response = await CrudApiHelper.instance.postRequest(
        path: LOGOUT_REQUEST_PATH,
        options: options,
      );
      printDone("the logout request success => ${response.data}");
      await UserInfoLocalService.instance().deleteUserInfo();
      return true;
    } on DioError catch (error) {
      String message = DioExceptions.dioErrorHandling(error);
      printError("the logout request failed from dio catch => $message");
      return false;
    } catch (e) {
      printError("the logout request failed from  catch => $e");
      return false;
    }
  }
}

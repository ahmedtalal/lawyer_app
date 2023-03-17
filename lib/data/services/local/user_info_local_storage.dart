import 'dart:convert';

import 'package:get_storage/get_storage.dart';
import 'package:hokok/core/debug_prints.dart';
import 'package:hokok/core/response_api_model.dart';
import 'package:hokok/data/models/user_local_model.dart';

class UserInfoLocalService {
  static UserInfoLocalService? _userInfoLocalService;
  UserInfoLocalService._internal();
  static UserInfoLocalService instance() {
    if (_userInfoLocalService == null) {
      return _userInfoLocalService = UserInfoLocalService._internal();
    }
    return _userInfoLocalService!;
  }

  final GetStorage _getStorage = GetStorage();
  final String _userKey = "userKey";

  Future<bool> saveUserInfo(Map<String, dynamic> model) async {
    try {
      await _getStorage.write(_userKey, model);
      return true;
    } catch (e) {
      return false;
    }
  }

  Map<String, dynamic> getUserInfo() {
    return _getStorage.read(_userKey) ?? failedRequest("user not found");
  }

  Future<void> deleteUserInfo() async {
    await _getStorage.remove(_userKey);
  }

  UserLocalModel convertStringToJson(String data) {
    printInfo("the info data is $data");
    Map<String, dynamic> d =
        json.decode(data.toString()).cast<Map<String, dynamic>>();
    printInfo("the data is $d");
    return UserLocalModel.fromJson(d);
  }
}

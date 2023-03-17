import 'dart:async';

import 'package:hokok/data/services/api/auth_api_service.dart';
import 'package:hokok/domain/interfaces/i_auth_interface.dart';

class AuthApiRepository implements IAuthInterface {
  static AuthApiRepository? _authApiRepository;
  AuthApiRepository._internal();
  static AuthApiRepository instance() {
    if (_authApiRepository == null) {
      return _authApiRepository = AuthApiRepository._internal();
    }
    return _authApiRepository!;
  }

  @override
  FutureOr<Map<String, dynamic>> login(data) async {
    return await AuthApiService.instance().loginPhoneNumberService(data);
  }

  @override
  FutureOr<Map<String, dynamic>> loginOpt(data) async {
    return await AuthApiService.instance().sendOptNumberService(data);
  }

  @override
  FutureOr<Map<String, dynamic>> register(data) async {
    return await AuthApiService.instance().register(data);
  }

  @override
  bool checkUserIsLogined() {
    return AuthApiService.instance().checkIsUserLoginedService();
  }
}

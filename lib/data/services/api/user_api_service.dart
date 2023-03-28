import 'dart:async';

class UserApiService {
  static UserApiService? _userApiService;
  UserApiService._internal();
  static UserApiService instance() {
    if (_userApiService == null) {
      return _userApiService = UserApiService._internal();
    }
    return _userApiService!;
  }
}

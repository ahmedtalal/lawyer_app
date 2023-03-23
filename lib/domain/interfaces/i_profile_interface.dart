import 'dart:async';

abstract class IProfileInterface {
  FutureOr<dynamic> getProfile();
  FutureOr<dynamic> updateProfile(var model);
  FutureOr<dynamic> deleteProfile(var index);
}

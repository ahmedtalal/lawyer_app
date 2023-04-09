import 'dart:async';

abstract class IProfileInterface {
  FutureOr<dynamic> getLawyerProfile();
  FutureOr<dynamic> getCLientProfile();
  FutureOr<dynamic> updateProfile(var model);
  FutureOr<dynamic> deleteProfile(var index);
}

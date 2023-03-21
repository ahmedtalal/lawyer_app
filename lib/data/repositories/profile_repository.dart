import 'dart:async';

import 'package:hokok/data/services/api/profile_api_service.dart';
import 'package:hokok/domain/entities/user_entity.dart';
import 'package:hokok/domain/interfaces/i_profile_interface.dart';

class ProfileRepository implements IProfileInterface {
  static ProfileRepository? _profileRepository;
  ProfileRepository._internal();
  static ProfileRepository instance() {
    if (_profileRepository == null) {
      return _profileRepository = ProfileRepository._internal();
    }
    return _profileRepository!;
  }

  @override
  FutureOr deleteProfile(index) {
    // TODO: implement deleteProfile
    throw UnimplementedError();
  }

  @override
  FutureOr<UserEntity?> getProfile() async {
    return await ProfileAPiService.instance().getProfileApiService();
  }

  @override
  FutureOr updateProfile(model) async {
    return await ProfileAPiService.instance().updateProfileApiService(model);
  }
}

import 'dart:async';

import 'package:hokok/data/services/api/profile_api_service.dart';
import 'package:hokok/domain/entities/lawyer_profile_entity.dart';
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
  FutureOr<LawyerProfileEntity?> getLawyerProfile() async =>
      await ProfileAPiService.instance().getLawyerProfileApiService();

  @override
  FutureOr<bool> updateProfile(model) async =>
      await ProfileAPiService.instance().updateProfileApiService(model);

  @override
  FutureOr<Map<String, dynamic>> getCLientProfile() async =>
      await ProfileAPiService.instance().getClientProfileApiService();
}

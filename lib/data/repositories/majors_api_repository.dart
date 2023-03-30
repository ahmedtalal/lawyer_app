import 'dart:async';

import 'package:hokok/data/services/api/majors_api_service.dart';
import 'package:hokok/domain/entities/major_entity.dart';
import 'package:hokok/domain/entities/sub_majors_entity.dart';
import 'package:hokok/domain/interfaces/i_majors_interface.dart';

class MajorsApiRepository implements IMajorsInterface {
  static MajorsApiRepository? _majorsApiRepository;
  MajorsApiRepository._internal();
  static MajorsApiRepository instnace() {
    if (_majorsApiRepository == null) {
      return _majorsApiRepository = MajorsApiRepository._internal();
    }
    return _majorsApiRepository!;
  }

  @override
  FutureOr<List<MajorData>?> getAllMajors() async {
    return await MajorsApiService.instance().getAllMajorsApiService();
  }

  @override
  FutureOr<List<SubMajorsInfoModel>> getAllSubMajors() async {
    return await MajorsApiService.instance().getAllSUbMajors();
  }
}

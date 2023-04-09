import 'package:hokok/data/services/api/lawyer_api_service.dart';
import 'package:hokok/domain/entities/lawyer_entity.dart';
import 'dart:async';

import 'package:hokok/domain/interfaces/i_lawyer_interface.dart';

class LawyerRepository implements ILawyerInterface {
  static LawyerRepository? _lawyerRepository;
  LawyerRepository._internal();
  static LawyerRepository instance() {
    if (_lawyerRepository == null) {
      return _lawyerRepository = LawyerRepository._internal();
    }
    return _lawyerRepository!;
  }

  @override
  FutureOr<List<LawyerAttributes>> getAllLawyers(
          Map<String, dynamic> data) async =>
      await LawyerApiService.instance().getAllLawyersApiSer(data);
}

import 'dart:async';

import 'package:hokok/domain/entities/lawyer_entity.dart';

abstract class ILawyerInterface {
  FutureOr<List<LawyerAttributes>> getAllLawyers(
    Map<String, dynamic> data,
  );

  FutureOr<Map<String, dynamic>> getStatistics();
}

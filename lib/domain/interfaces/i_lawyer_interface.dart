import 'dart:async';

import 'package:hokok/domain/entities/lawyer_entity.dart';

abstract class ILawyerInterface {
  FutureOr<List<LawyerAttributes>> getAllLawyers(
    int page,
    int perPage,
    int majorId,
    String city,
    double rate,
  );
}

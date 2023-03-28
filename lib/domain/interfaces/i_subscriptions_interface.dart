import 'dart:async';

import 'package:hokok/domain/entities/plans_entity.dart';

abstract class ISubscriptionsInterface {
  FutureOr<List<PlansInfoModel>> getAllPlans();
}

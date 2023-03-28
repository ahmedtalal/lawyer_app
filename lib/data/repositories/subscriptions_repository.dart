import 'package:hokok/data/services/api/subscriptions_services.dart';
import 'package:hokok/domain/entities/plans_entity.dart';
import 'dart:async';

import 'package:hokok/domain/interfaces/i_subscriptions_interface.dart';

class SubscriptionsRepository implements ISubscriptionsInterface {
  static SubscriptionsRepository? _subscriptionsRepository;
  SubscriptionsRepository._internal();
  static SubscriptionsRepository instance() {
    if (_subscriptionsRepository == null) {
      return _subscriptionsRepository = SubscriptionsRepository._internal();
    }
    return _subscriptionsRepository!;
  }

  @override
  FutureOr<List<PlansInfoModel>> getAllPlans() async {
    return await SubscriptionsServices.instance().getAllPlansSer();
  }
}

import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hokok/presentation/blocs/subscriptions_bloc/subscriptions_bloc.dart';
import 'package:hokok/presentation/blocs/subscriptions_bloc/subscriptions_events.dart';

class SubscriptionHelper {
  static SubscriptionHelper? _subscriptionHelper;
  SubscriptionHelper._internal();
  static SubscriptionHelper instnace() {
    if (_subscriptionHelper == null) {
      return _subscriptionHelper = SubscriptionHelper._internal();
    }
    return _subscriptionHelper!;
  }

  onGetAllPlansAction(BuildContext context) =>
      context.read<SubscriptionsBloc>().add(GetAllPlansEvent());
}

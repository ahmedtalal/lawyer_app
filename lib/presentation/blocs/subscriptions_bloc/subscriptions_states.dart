import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hokok/core/shared_widget/show_snackbar_shared_widget.dart';
import 'package:hokok/domain/entities/plans_entity.dart';

abstract class SubscriptionsStates {}

class SubscriptionsInitialState extends SubscriptionsStates {}

class PlansLoadingState extends SubscriptionsStates {}

class PlansLoadedState extends SubscriptionsStates {
  List<PlansInfoModel> plans;
  PlansLoadedState(this.plans);
}

class FailedLoadedState extends SubscriptionsStates {
  String error;
  FailedLoadedState(this.error);

  authErrorMessage(BuildContext context, String title) {
    ScaffoldMessenger.of(context).showSnackBar(
      showSnakBarWidget(context, title, Colors.red),
    );
  }
}

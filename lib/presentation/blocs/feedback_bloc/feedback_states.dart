import 'package:flutter/material.dart';
import 'package:hokok/core/routes_manager.dart';
import 'package:hokok/core/shared_widget/circler_loader_shared_widget.dart';
import 'package:hokok/core/shared_widget/empty_data_shared_widget.dart';
import 'package:hokok/core/shared_widget/show_snackbar_shared_widget.dart';
import 'package:hokok/data/models/feed_back_model.dart';

abstract class FeedBackStates {}

class FeedBackInitState extends FeedBackStates {}

class FeedBackLoadingState extends FeedBackStates {
  showLoadingDialog(BuildContext context) async {
    return await showCircleLoaderWidget(context);
  }
}

class FeedBackLoadedState extends FeedBackStates {
  List<FeedBackData>? feedbacks;
  FeedBackLoadedState(this.feedbacks);
}

class FeedBackFailedState extends FeedBackStates {
  String error;
  FeedBackFailedState(this.error);

  authErrorMessage(BuildContext context, String title) {
    ScaffoldMessenger.of(context)
        .showSnackBar(showSnakBarWidget(context, title, Colors.red));
  }
}

class FeedBackEmptyState extends FeedBackStates {
  Widget showEmptyWidget() => emptyDataSharedWidget();
}

class FeedbackSuccessState extends FeedBackStates {
  naviation(RouteSettings settings, BuildContext context) {
    return Navigator.of(context).push(RouteGenerator.getRoute(settings));
  }
}

class FeedBackLoadingActionState extends FeedBackStates {}

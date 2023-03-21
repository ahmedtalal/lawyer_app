import 'package:flutter/material.dart';
import 'package:hokok/core/routes_manager.dart';
import 'package:hokok/core/shared_widget/circler_loader_shared_widget.dart';
import 'package:hokok/core/shared_widget/empty_data_shared_widget.dart';
import 'package:hokok/core/shared_widget/show_snackbar_shared_widget.dart';
import 'package:hokok/domain/entities/comment_entity.dart';

abstract class CommentStates {}

class CommentInitState extends CommentStates {}

class CommentLoadingState extends CommentStates {
  showLoadingDialog(BuildContext context) async {
    return await showCircleLoaderWidget(context);
  }
}

class CommentLoadedState extends CommentStates {
  List<CommentData>? comments;
  CommentLoadedState(this.comments);
}

class CommentFailedState extends CommentStates {
  String error;
  CommentFailedState(this.error);

  authErrorMessage(BuildContext context, String title) {
    ScaffoldMessenger.of(context)
        .showSnackBar(showSnakBarWidget(context, title, Colors.red));
  }
}

class CommentEmptyState extends CommentStates {
  Widget showEmptyWidget() => emptyDataSharedWidget();
}

class CommentSuccessState extends CommentStates {
  naviation(RouteSettings settings, BuildContext context) {
    return Navigator.of(context).push(RouteGenerator.getRoute(settings));
  }
}

class CommentLoadingActionState extends CommentStates {}

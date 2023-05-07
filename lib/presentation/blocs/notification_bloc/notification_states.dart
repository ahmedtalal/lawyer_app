import 'package:flutter/material.dart';
import 'package:hokok/core/shared_widget/show_snackbar_shared_widget.dart';
import 'package:hokok/domain/entities/notification_entity.dart';

abstract class NotificationStates {}

class NotificationInitState extends NotificationStates {}

class NotificationLoadingState extends NotificationStates {
  Widget showLoadingWidget() => const Center(
        child: CircularProgressIndicator(),
      );
}

class NotificationsLoadedState extends NotificationStates {
  List<NotificationsInfo> notifications;
  NotificationsLoadedState(this.notifications);
}

class NotificationsFailedLoadedState extends NotificationStates {
  String error;
  NotificationsFailedLoadedState(this.error);

  authErrorMessage(BuildContext context, String title) {
    ScaffoldMessenger.of(context).showSnackBar(
      showSnakBarWidget(context, title, Colors.red),
    );
  }
}

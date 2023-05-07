import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hokok/presentation/blocs/notification_bloc/notification_bloc.dart';
import 'package:hokok/presentation/blocs/notification_bloc/notification_events.dart';

class NotificationHelper {
  static NotificationHelper? _notificationHelper;
  NotificationHelper._internal();
  static NotificationHelper instance() {
    if (_notificationHelper == null) {
      return _notificationHelper = NotificationHelper._internal();
    }
    return _notificationHelper!;
  }

  int perPage = 10;

  getAllNotificationsFun(BuildContext context) {
    context.read<NotificationBloc>().perPage = perPage;
    context.read<NotificationBloc>().add(GetALlNotificationsEvent());
  }
}

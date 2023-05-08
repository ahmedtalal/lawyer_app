
import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hokok/domain/entities/notification_entity.dart';
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
  FormData notificationForm = FormData.fromMap({});
  List<NotificationsInfo> notifications = [];

  getAllNotificationsFun(BuildContext context) {
    context.read<NotificationBloc>().perPage = perPage;
    context.read<NotificationBloc>().add(GetALlNotificationsEvent());
  }

  makeNotificationReadFun(BuildContext context){
    context.read<NotificationBloc>().model = notificationForm;
    context.read<NotificationBloc>().add(MakeNotificationReadEvent());
  }
}

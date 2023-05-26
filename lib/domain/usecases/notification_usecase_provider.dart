/*
this class generate only one instance from any class using dependency injection
 and by using this instance you can access any method from this class.
*/

import 'package:hokok/domain/interfaces/i_notification_interface.dart';

class NotificationUseCaseProvider {
  static NotificationUseCaseProvider? _notificationUseCaseProvider;
  NotificationUseCaseProvider._internal();
  static NotificationUseCaseProvider instance() {
    if (_notificationUseCaseProvider == null) {
      return _notificationUseCaseProvider =
          NotificationUseCaseProvider._internal();
    }
    return _notificationUseCaseProvider!;
  }

  INotificationInterface creator<INotificationInterface>(
      INotificationInterface notification) {
    return notification;
  }
}

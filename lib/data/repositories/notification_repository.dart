import 'package:hokok/data/services/api/notification_api_services.dart';
import 'package:hokok/domain/entities/notification_entity.dart';
import 'package:hokok/domain/interfaces/i_notification_interface.dart';

class NotificationRepository implements INotificationInterface {
  static NotificationRepository? _notificationRepository;
  NotificationRepository._internal();
  static NotificationRepository instance() {
    if (_notificationRepository == null) {
      return _notificationRepository = NotificationRepository._internal();
    }
    return _notificationRepository!;
  }

  @override
  Stream<List<NotificationsInfo>> getAllNotifications(model) async* {
    yield* NotificationApiServices.instance().getAllNotifications(model);
  }

  @override
  makeAsReadNotif(model) {
    // TODO: implement makeAsReadNotif
    throw UnimplementedError();
  }
}

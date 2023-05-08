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
  Future<List<NotificationsInfo>> getAllNotifications(model) async {
    return NotificationApiServices.instance().getAllNotificationsSer(model);
  }

  @override
  Future<Map<String, dynamic>> makeAsReadNotif(model) async {
    return await NotificationApiServices.instance()
        .makeAsReadNotificationSer(model);
  }
}

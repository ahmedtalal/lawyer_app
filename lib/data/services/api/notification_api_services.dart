import 'package:dio/dio.dart';
import 'package:hokok/config/dio_exception.dart';
import 'package:hokok/core/api_paths.dart';
import 'package:hokok/core/debug_prints.dart';
import 'package:hokok/data/models/Notification_model.dart';
import 'package:hokok/data/services/api/crud_helper.dart';
import 'package:hokok/data/services/local/user_info_local_storage.dart';
import 'package:hokok/domain/entities/notification_entity.dart';

class NotificationApiServices {
  static NotificationApiServices? _notificationApiServices;
  NotificationApiServices._internal();
  static NotificationApiServices instance() {
    if (_notificationApiServices == null) {
      return _notificationApiServices = NotificationApiServices._internal();
    }
    return _notificationApiServices!;
  }

  Future<List<NotificationsInfo>> getAllNotifications(int perPage) async {
    try {
      Options options = Options(headers: {
        "authorization":
            "Bearer ${UserInfoLocalService.instance().getUserToken().token}"
      });
      Response response = await CrudApiHelper.instance.getRequest(
        path: GET_ALL_NOTIFICATIONS_REQUEST_PATH,
        parameters: {"per_page": perPage},
        options: options,
      );
      printDone("get all notifications success => ${response.data}");
      return NotificationModel.fromJson(response.data).data!.notifications!;
    } on DioError catch (error) {
      final message = DioExceptions.dioErrorHandling(error);
      printError("error in get all notification from dio catch => $message");
      return [];
    } catch (e) {
      printError("error in get all notification from catch => $e");
      return [];
    }
  }
}

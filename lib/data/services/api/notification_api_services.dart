import 'package:dio/dio.dart';
import 'package:hokok/config/dio_exception.dart';
import 'package:hokok/core/api_paths.dart';
import 'package:hokok/core/debug_prints.dart';
import 'package:hokok/core/response_api_model.dart';
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

  Future<List<NotificationsInfo>> getAllNotificationsSer(int perPage) async {
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

  Future<Map<String, dynamic>> makeAsReadNotificationSer(dynamic model) async {
    try {
      Options options = Options(headers: {
        "authorization":
            "Bearer ${UserInfoLocalService.instance().getUserToken().token}"
      });
      Response response = await CrudApiHelper.instance.postRequest(
        path: MAKE_AS_READ_NOTIFICATION_REQUEST_PATH,
        data: model,
        options: options,
      );
      printDone("the process of make as read done => ${response.data}");
      return successRequest(response.data);
    } on DioError catch (error) {
      final message = DioExceptions.dioErrorHandling(error);
      printError(
          "error in make read notification process from dio catch=>$message");
      return failedRequest(message);
    } catch (e) {
      printError("error in make read notification process from catch=>$e");
      return failedRequest(e);
    }
  }
}

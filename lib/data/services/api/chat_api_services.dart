import 'package:dio/dio.dart';
import 'package:hokok/config/dio_exception.dart';
import 'package:hokok/core/api_paths.dart';
import 'package:hokok/core/debug_prints.dart';
import 'package:hokok/core/response_api_model.dart';
import 'package:hokok/data/models/chat_message_model.dart';
import 'package:hokok/data/models/chat_model.dart';
import 'package:hokok/data/services/api/crud_helper.dart';
import 'package:hokok/data/services/local/user_info_local_storage.dart';

class ChatApiServices {
  static ChatApiServices? _chatApiServices;
  ChatApiServices._internal();
  static ChatApiServices instance() {
    if (_chatApiServices == null) {
      return _chatApiServices = ChatApiServices._internal();
    }
    return _chatApiServices!;
  }

  Future<Map<String, dynamic>> sendMessageSer(Map<String, dynamic> data) async {
    try {
      Options options = Options(headers: {
        "authorization":
            "Bearer ${UserInfoLocalService.instance().getUserToken().token}"
      });
      Response response = await CrudApiHelper.instance.postRequest(
        path: SEND_MESSAGE_REQUEST_PATH,
        options: options,
        data: data,
      );
      printDone("the send message done => ${response.data}");
      return successRequest(response.data);
    } on DioError catch (error) {
      final message = DioExceptions.dioErrorHandling(error);
      printError("the send message error from dio catch => $message");
      return failedRequest(message);
    } catch (e) {
      printError("the send message error from catch => $e");
      return failedRequest(e.toString());
    }
  }

  Future<Map<String, dynamic>> sendMessageToAdminSer(
      Map<String, dynamic> data) async {
    try {
      Options options = Options(headers: {
        "authorization":
            "Bearer ${UserInfoLocalService.instance().getUserToken().token}"
      });
      Response response = await CrudApiHelper.instance.postRequest(
        path: SEND_MESSAGE_TO_ADMIN_REQUEST_PATH,
        options: options,
        data: data,
      );
      printDone("the send to admin message done => ${response.data}");
      return successRequest(response.data);
    } on DioError catch (error) {
      final message = DioExceptions.dioErrorHandling(error);
      printError("the send message to admin error from dio catch =>$message");
      return failedRequest(message);
    } catch (e) {
      printError("the send message to admin error from catch =>$e");
      return failedRequest(e.toString());
    }
  }

  Future<List<Chats>> getChatsSer(Map<String, dynamic> data) async {
    try {
      Options options = Options(headers: {
        "authorization":
            "Bearer ${UserInfoLocalService.instance().getUserToken().token}"
      });
      Response response = await CrudApiHelper.instance.getRequest(
        path: "path", //do not forget the path
        options: options,
        parameters: data,
      );
      printDone("the get all chats done => ${response.data}");
      return ChatsModel.fromJson(response.data).data!.chats!;
    } on DioError catch (error) {
      final message = DioExceptions.dioErrorHandling(error);
      printError("the get all chats error from dio catch => $message");
      return [];
    } catch (e) {
      printError("the get all chats error from  catch => $e");
      return [];
    }
  }

  Future<List<ChatMessages>> getChatMessagesSer(
      Map<String, dynamic> data) async {
    try {
      Options options = Options(headers: {
        "authorization":
            "Bearer ${UserInfoLocalService.instance().getUserToken().token}"
      });
      Response response = await CrudApiHelper.instance.getRequest(
        path: "path", // do not forgete the path
        options: options,
        parameters: data,
      );
      printDone("the get all chat messages done => ${response.data}");
      return ChatMessageModel.fromJson(response.data).data!.messages!;
    } on DioError catch (error) {
      final message = DioExceptions.dioErrorHandling(error);
      printError("the get chat messages error from dio catch => $message");
      return [];
    } catch (e) {
      printError("the get chat messages error from dio catch => $e");
      return [];
    }
  }
}

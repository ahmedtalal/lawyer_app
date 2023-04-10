import 'dart:async';

import 'package:dio/dio.dart';
import 'package:hokok/config/dio_exception.dart';
import 'package:hokok/core/api_paths.dart';
import 'package:hokok/core/debug_prints.dart';
import 'package:hokok/data/models/comment_model.dart';
import 'package:hokok/data/services/api/crud_helper.dart';
import 'package:hokok/data/services/local/user_info_local_storage.dart';
import 'package:hokok/domain/entities/comment_entity.dart';

class CommentsAPiService {
  static CommentsAPiService? _commentsAPiService;
  CommentsAPiService._internal();
  static CommentsAPiService instance() {
    if (_commentsAPiService == null) {
      return _commentsAPiService = CommentsAPiService._internal();
    }
    return _commentsAPiService!;
  }

  FutureOr<List<CommentData>?> getAllCommentsAPiService() async {
    try {
      Options options = Options(headers: {
        "authorization":
            "Bearer ${UserInfoLocalService.instance().getUserToken().token}"
      });
      Response response = await CrudApiHelper.instance.getRequest(
        path: GET_ALL_COMMENTS_REQUEST_PATH,
        options: options,
      );
      CommentModel model = CommentModel.fromJson(response.data);
      printDone("the get all comments success => ${response.data}");
      printDone("the get all comments model success => ${model.data}");
      return model.data;
    } on DioError catch (error) {
      String message = DioExceptions.dioErrorHandling(error);
      printError("the get all comments failed from dio catch => $message");
      return [];
    } catch (e) {
      printError("the get all comments failed from  catch => $e");
      return [];
    }
  }

  FutureOr<bool> addCommentAPiService(CommentData model) async {
    try {
      Options options = Options(headers: {
        "authorization":
            "Bearer ${UserInfoLocalService.instance().getUserToken().token}"
      });
      Map<String, dynamic> data = model.toJson();
      Response response = await CrudApiHelper.instance.postRequest(
        path: ADD_COMMENT_REQUEST_PATH,
        options: options,
        data: data,
      );
      printDone("the add comment success => ${response.data}");
      printDone("the add comment model success => $model");
      return true;
    } on DioError catch (error) {
      String message = DioExceptions.dioErrorHandling(error);
      printError("the add  comment failed from dio catch => $message");
      return false;
    } catch (e) {
      printError("the add  comment failed from  catch => $e");
      return false;
    }
  }
}

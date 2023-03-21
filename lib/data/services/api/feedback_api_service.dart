import 'dart:async';

import 'package:dio/dio.dart';
import 'package:hokok/config/dio_exception.dart';
import 'package:hokok/core/api_paths.dart';
import 'package:hokok/core/debug_prints.dart';
import 'package:hokok/data/models/feed_back_model.dart';
import 'package:hokok/data/models/user_local_model.dart';
import 'package:hokok/data/services/api/api_helper.dart';
import 'package:hokok/data/services/local/user_info_local_storage.dart';

class FeedbackAPiService {
  static FeedbackAPiService? _feedbackAPiService;
  FeedbackAPiService._intenal();
  static FeedbackAPiService instance() {
    if (_feedbackAPiService == null) {
      return _feedbackAPiService = FeedbackAPiService._intenal();
    }
    return _feedbackAPiService!;
  }

  FutureOr<List<FeedBackData>?> getAllFeedbacks() async {
    try {
      Options options = Options(headers: {
        "authorization":
            "Bearer ${UserInfoLocalService.instance().getUserToken().token}"
      });
      Response response = await CurdApiHelper.instance.getRequest(
        path: GET_ALL_FEEDBACKS_REQUEST_PATH,
        options: options,
      );
      FeedBackModel model = FeedBackModel.fromJson(response.data);
      printDone("the get all feedbacks success =>  ${response.data}");
      printDone("the get all feedbacks success from model => ${model.data}");
      return model.data;
    } on DioError catch (error) {
      String message = DioExceptions.dioErrorHandling(error);
      printError("the get all feedbacks error from dio catch is $message");
      return [];
    } catch (e) {
      printError("the get all feedbacks error from  catch is $e");
      return [];
    }
  }

  FutureOr<bool> addFeedBack(FeedBackData feedBack) async {
    try {
      Map<String, dynamic> data = feedBack.toJson();

      Options options = Options(headers: {
        "authorization":
            "Bearer ${UserInfoLocalService.instance().getUserToken().token}"
      });
      Response response = await CurdApiHelper.instance.postRequest(
        path: ADD_FEEDBACK_REQUESt_PATH,
        data: data,
        options: options,
      );
      printDone("the add feedback success =>  ${response.data}");
      printDone("the add feedback success =>  $feedBack");
      return true;
    } on DioError catch (error) {
      String message = DioExceptions.dioErrorHandling(error);
      printError("the add feedbacks error from dio catch is $message");
      return false;
    } catch (e) {
      printError("the add feedbacks error from  catch is $e");
      return false;
    }
  }
}

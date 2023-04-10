import 'dart:async';

import 'package:dio/dio.dart';
import 'package:hokok/config/dio_exception.dart';
import 'package:hokok/core/api_paths.dart';
import 'package:hokok/core/debug_prints.dart';
import 'package:hokok/data/services/api/crud_helper.dart';
import 'package:hokok/data/services/local/user_info_local_storage.dart';
import 'package:hokok/domain/entities/plans_entity.dart';
import 'package:hokok/data/models/plans_model.dart';

class SubscriptionsServices {
  static SubscriptionsServices? _subscriptionsServices;
  SubscriptionsServices._internal();
  static SubscriptionsServices instance() {
    if (_subscriptionsServices == null) {
      return _subscriptionsServices = SubscriptionsServices._internal();
    }
    return _subscriptionsServices!;
  }

  FutureOr<List<PlansInfoModel>> getAllPlansSer() async {
    try {
      Options options = Options(headers: {
        "authorization":
            "Bearer ${UserInfoLocalService.instance().getUserToken().token}"
      });
      Response response = await CrudApiHelper.instance.getRequest(
        path: GET_ALL_PLANS_REQUEST_PATH,
        options: options,
      );
      printDone("the get all plans success => ${response.data}");
      return PlansModel.fromJson(response.data).data!;
    } on DioError catch (error) {
      String message = DioExceptions.dioErrorHandling(error);
      printError("the get all plans error from dio catch => $message");
      return [];
    } catch (e) {
      printError("the get all plans error from  catch => $e");
      return [];
    }
  }
}

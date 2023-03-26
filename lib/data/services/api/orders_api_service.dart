import 'dart:async';
import 'package:dio/dio.dart';
import 'package:hokok/config/dio_exception.dart';
import 'package:hokok/core/api_paths.dart';
import 'package:hokok/core/debug_prints.dart';
import 'package:hokok/data/models/own_orders_for_lawyer_model.dart';
import 'package:hokok/data/services/api/api_helper.dart';
import 'package:hokok/data/services/local/user_info_local_storage.dart';
import 'package:hokok/domain/entities/public_order_entity.dart';

class OrdersApiService {
  static OrdersApiService? ordersApiService;
  OrdersApiService._internal();
  static OrdersApiService instance() {
    if (ordersApiService == null) {
      return ordersApiService = OrdersApiService._internal();
    }
    return ordersApiService!;
  }

  FutureOr<List<OrderInfoModel>> getPublicOrderLawyer(
      String city, int majorId) async {
    try {
      Options options = Options(headers: {
        "authorization":
            "Bearer ${UserInfoLocalService.instance().getUserToken().token}"
      });
      Map<String, dynamic> data = {
        "city": city,
        "major_id": majorId,
      };
      Response response = await CurdApiHelper.instance.getRequest(
        path: GET_LAWYER_PUBLIC_ORDERS_REQUEST_PATH,
        parameters: data,
        options: options,
      );
      printDone("the get all public lawyer orders => ${response.data}");
      return response.data;
    } on DioError catch (error) {
      String message = DioExceptions.dioErrorHandling(error);
      printError("the get public lawyer order from dio catch => $message");
      return [];
    } catch (e) {
      printError("the get public lawyer order from catch => $e");
      return [];
    }
  }

  FutureOr<List<OwnOrdersInfoModel>> getAllOwnOrdersForLawyer(
      String city, int majorId, int status) async {
    try {
      Options options = Options(headers: {
        "authorization":
            "Bearer ${UserInfoLocalService.instance().getUserToken().token}"
      });
      Map<String, dynamic> data = {
        "city": city,
        "major_id": majorId,
        "status": status,
      };
      Response response = await CurdApiHelper.instance.getRequest(
        path: GET_LAWYER_OWN_ORDERS_REQUEST_PATH,
        parameters: data,
        options: options,
      );
      printDone("the get all own orders lawyer orders => ${response.data}");
      return response.data;
    } on DioError catch (error) {
      String message = DioExceptions.dioErrorHandling(error);
      printError("get all ower orders error from dio catch $message");
      return [];
    } catch (e) {
      printError("get all own orders error from catch $e");
      return [];
    }
  }
}

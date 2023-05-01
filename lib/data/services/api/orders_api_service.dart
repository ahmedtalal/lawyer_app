import 'dart:async';
import 'package:dio/dio.dart';
import 'package:hokok/config/dio_exception.dart';
import 'package:hokok/core/api_paths.dart';
import 'package:hokok/core/debug_prints.dart';
import 'package:hokok/core/response_api_model.dart';
import 'package:hokok/data/models/client_request_order_model.dart';
import 'package:hokok/data/models/order_for_client_model.dart';
import 'package:hokok/data/models/own_orders_for_lawyer_model.dart';
import 'package:hokok/data/models/request_order_for_lawyer_model.dart';
import 'package:hokok/data/services/api/crud_helper.dart';
import 'package:hokok/data/services/local/user_info_local_storage.dart';
import 'package:hokok/domain/entities/client__requests_order_entity.dart';
import 'package:hokok/domain/entities/order_for_client_entity.dart';
import 'package:hokok/domain/entities/private_order_for_lawyer_entity.dart';
import 'package:hokok/domain/entities/public_order_entity.dart';
import 'package:hokok/domain/entities/requests_order_for_lawyer_entity.dart';
import 'package:hokok/data/models/public_order_model.dart';
import 'package:hokok/data/models/private_order_for_lawyer_model.dart';
import 'package:hokok/presentation/blocs/order_bloc/order_helper.dart';

class OrdersApiService {
  static OrdersApiService? ordersApiService;
  OrdersApiService._internal();
  static OrdersApiService instance() {
    if (ordersApiService == null) {
      return ordersApiService = OrdersApiService._internal();
    }
    return ordersApiService!;
  }

  FutureOr<List<OrderInfoModel>> getPublicOrderLawyerSer(
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
      Response response = await CrudApiHelper.instance.getRequest(
        path: GET_LAWYER_PUBLIC_ORDERS_REQUEST_PATH,
        parameters: city == "" ? null : data,
        options: options,
      );
      printDone("the get all public lawyer orders => ${response.data}");
      return PublicOrderModel.fromJson(response.data).data!;
    } on DioError catch (error) {
      final message = DioExceptions.dioErrorHandling(error);
      printError("the get public lawyer order from dio catch => $message");
      return [];
    } catch (e) {
      printError("the get public lawyer order from catch => $e");
      return [];
    }
  }

  FutureOr<List<OwnOrdersInfoModel>> getAllOwnOrdersForLawyerSer(
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
      Response response = await CrudApiHelper.instance.getRequest(
        path: GET_LAWYER_OWN_ORDERS_REQUEST_PATH,
        parameters: city.isEmpty ? null : data,
        options: options,
      );
      printDone("the get all own orders lawyer orders => ${response.data}");
      return OwnOrdersForLawyerModel.fromJson(response.data).data!;
    } on DioError catch (error) {
      final message = DioExceptions.dioErrorHandling(error);
      printError("get all ower orders error from dio catch $message");
      return [];
    } catch (e) {
      printError("get all own orders error from catch $e");
      return [];
    }
  }

  FutureOr<List<PrivateOrdersInfoModel>>
      getAllPrivateOrdersForLawyerSer() async {
    try {
      Options options = Options(headers: {
        "authorization":
            "Bearer ${UserInfoLocalService.instance().getUserToken().token}"
      });

      Response response = await CrudApiHelper.instance.getRequest(
        path: GET_LAWYER_private_ORDERS_REQUEST_PATH,
        options: options,
      );
      printDone("the get all private orders lawyer orders => ${response.data}");
      return PrivateOrdersForLawyerModel.fromJson(response.data).data!;
    } on DioError catch (error) {
      final message = DioExceptions.dioErrorHandling(error);
      printError("the get private orders error from dio catch $message");
      return [];
    } catch (e) {
      printError('the get private orders error from catch $e');
      return [];
    }
  }

  FutureOr<List<RequestsLawyerOrderInfo>> getAllRequestOrderLawyerSer() async {
    try {
      Options options = Options(headers: {
        "authorization":
            "Bearer ${UserInfoLocalService.instance().getUserToken().token}"
      });

      Response response = await CrudApiHelper.instance.getRequest(
        path: GET_ALL_REQUEST_LAWYER_ORDERS_REQUEST_PATH,
        options: options,
      );
      printDone("the get all request orders lawyer orders => ${response.data}");
      return RequestsOrderForLawyerModel.fromJson(response.data).data!;
    } on DioError catch (error) {
      final message = DioExceptions.dioErrorHandling(error);
      printError(
          "the get all requests order for lawyer error from dio catch => $message");
      return [];
    } catch (e) {
      printError(
          "the get all requests order for lawyer error from  catch => $e");
      return [];
    }
  }

  FutureOr<Map<String, dynamic>> updateOrderStatusForLawyerSer(
      int status, int id) async {
    try {
      Options options = Options(headers: {
        "authorization":
            "Bearer ${UserInfoLocalService.instance().getUserToken().token}"
      });
      Map<String, dynamic> data = {
        "status": status,
      };
      Response response = await CrudApiHelper.instance.putRequest(
        path: UPDATE_LAWYER_ORDER_REQUEST_PATH + "$id".toString(),
        options: options,
        data: data,
      );
      printDone("the get all request orders lawyer orders => ${response.data}");
      return successRequest(response.data);
    } on DioError catch (error) {
      final message = DioExceptions.dioErrorHandling(error);
      printError(
          "the update order status for lawyer from dio catch => $message");
      return failedRequest(message);
    } catch (e) {
      printError("the update order status for lawyer from  catch => $e");
      return failedRequest(e.toString());
    }
  }

  FutureOr<Map<String, dynamic>> addOrderFeedBackForLawyerSer(
    int orderId,
    String lawyerFeedback,
    double rate,
  ) async {
    try {
      Options options = Options(headers: {
        "authorization":
            "Bearer ${UserInfoLocalService.instance().getUserToken().token}"
      });
      Map<String, dynamic> data = {
        "order_id": orderId,
        "lawyer_feedback": lawyerFeedback,
        "lawyer_feedback_rate": rate,
      };
      Response response = await CrudApiHelper.instance.postRequest(
        path: UPDATE_LAWYER_ORDER_REQUEST_PATH,
        options: options,
        data: data,
      );
      printDone(
          "the add  feedback to orders lawyer orders => ${response.data}");
      return successRequest(response.data);
    } on DioError catch (error) {
      final message = DioExceptions.dioErrorHandling(error);
      printError(
          "the add feedback for lawyer error from dio catch => $message");
      return failedRequest(message);
    } catch (e) {
      printError("the add feedback for lawyer error from  catch => $e");
      return failedRequest(e.toString());
    }
  }

  FutureOr<Map<String, dynamic>> createOrderForClientSer(
      CreateOrderModel model) async {
    try {
      Options options = Options(headers: {
        "authorization":
            "Bearer ${UserInfoLocalService.instance().getUserToken().token}"
      });
      Map<String, dynamic> data = model.type == "0"
          ? model.toJsonWithoutLawyerId()
          : model.toJsonWithLawyerId();
      printInfo("the create order model => $data");

      Response response = await CrudApiHelper.instance.postRequest(
        path: CREATE_CLIENT_ORDER_REQUEST_PATH,
        options: options,
        data: data,
      );
      printDone("the create client order success => ${response.data}");
      return successRequest(response.data);
    } on DioError catch (error) {
      final message = DioExceptions.dioErrorHandling(error);
      printError("the create order for client error from dio catch =>$message");
      return failedRequest(message);
    } catch (e) {
      printError("the create order for client error from  catch =>$e");
      return failedRequest(e.toString());
    }
  }

  FutureOr<List<ClientOrderInfo>> getAllClientOrdersSer() async {
    try {
      Options options = Options(headers: {
        "authorization":
            "Bearer ${UserInfoLocalService.instance().getUserToken().token}"
      });
      Response response = await CrudApiHelper.instance.getRequest(
        path: GET_ALL_CLIENT_ORDERS_REQUEST_PATH,
        options: options,
      );
      printDone("the get all client orders success => ${response.data}");

      return OrderForClientModel.fromJson(response.data).data!;
    } on DioError catch (error) {
      final message = DioExceptions.dioErrorHandling(error);
      printError("the get all client orders error from dio catch => $message");
      return [];
    } catch (e) {
      printError("the get all client orders error from catch => $e");
      return [];
    }
  }

  FutureOr<List<RequestOrderInfo>> getAllClientRequestOrdersSer(
      int orderId) async {
    try {
      Options options = Options(headers: {
        "authorization":
            "Bearer ${UserInfoLocalService.instance().getUserToken().token}"
      });
      Response response = await CrudApiHelper.instance.getRequest(
        path: GET_CLIENT_ORDER_REQUESTS_REQUEST_PATH +
            "$orderId".toString() +
            "/requests".toString(),
        options: options,
      );
      printDone(
          "the get all client request orders success => ${response.data}");
      return CLientRequestOrderModel.fromJson(response.data).data!;
    } on DioError catch (error) {
      final message = DioExceptions.dioErrorHandling(error);
      printError(
          "the get client request order error from dio catch => $message");
      return [];
    } catch (e) {
      printError("the get client request order error from  catch => $e");
      return [];
    }
  }

  FutureOr<Map<String, dynamic>> acceptCLientRequestSer(int orderId) async {
    try {
      Options options = Options(headers: {
        "authorization":
            "Bearer ${UserInfoLocalService.instance().getUserToken().token}"
      });
      Response response = await CrudApiHelper.instance.postRequest(
        path: ACCEPT_REQUESTS_FOR_CLIENTS_REQUEST_PATH +
            "$orderId".toString() +
            "/accept".toString(),
        options: options,
      );
      printDone("the post client accept request success => ${response.data}");
      return successRequest(response.data);
    } on DioError catch (error) {
      final message = DioExceptions.dioErrorHandling(error);
      printError("the accept client request error from dio catch => $message");
      return failedRequest(message);
    } catch (e) {
      printError("the accept client request error from  catch => $e");
      return failedRequest(e.toString());
    }
  }

  FutureOr<Map<String, dynamic>> updateCLientOrderStatusSer(
      int status, int orderId) async {
    try {
      Options options = Options(headers: {
        "authorization":
            "Bearer ${UserInfoLocalService.instance().getUserToken().token}"
      });
      Response response = await CrudApiHelper.instance.postRequest(
        path: UPDATE_CLIENT_ORDER_STATUS_REQUEST_PATH +
            "$orderId".toString() +
            "/$status".toString(),
        options: options,
      );
      printDone("the update client order status  success => ${response.data}");
      return successRequest(response.data);
    } on DioError catch (error) {
      final message = DioExceptions.dioErrorHandling(error);
      printError(
          "the update order status for client error from dio catch => $message");
      return failedRequest(message);
    } catch (e) {
      printError("the update order status for client error from  catch => $e");
      return failedRequest(e);
    }
  }

  FutureOr<Map<String, dynamic>> addCLientFeedbackSer(
    int orderId,
    String clientFeedback,
    double rate,
  ) async {
    try {
      Options options = Options(headers: {
        "authorization":
            "Bearer ${UserInfoLocalService.instance().getUserToken().token}"
      });
      Map<String, dynamic> data = {
        "order_id": orderId,
        "client_feedback": clientFeedback,
        "client_feedback_rate": rate,
      };
      Response response = await CrudApiHelper.instance.postRequest(
        path: ADD_CLIENT_FEED_BACK_REQUEST_PATH,
        options: options,
        data: data,
      );
      printDone("the add feedback for client success ${response.data}");
      return successRequest(response.data);
    } on DioError catch (error) {
      final messsage = DioExceptions.dioErrorHandling(error);
      printError("the add client feedback error from dio catch => $messsage");
      return failedRequest(messsage);
    } catch (e) {
      printError("the add client feedback error from catch => $e");
      return failedRequest(e.toString());
    }
  }

  FutureOr<Map<String, dynamic>> sendLawyerRequest(FormData data) async {
    try {
      Options options = Options(headers: {
        "authorization":
            "Bearer ${UserInfoLocalService.instance().getUserToken().token}"
      });
      printInfo("the lawyer send request =>> ${data.fields.asMap()}");
      Response response = await CrudApiHelper.instance.postRequest(
        path: POST_LAWYER_ORDERS_REQUEST_PATH,
        data: data,
        options: options,
      );
      printDone("the send lawyer request done => ${response.data}");
      return successRequest(response.data);
    } on DioError catch (error) {
      //printError("the status code => ${error.response!.statusCode}");
      final message = DioExceptions.dioErrorHandling(error);
      printError("the send lawyer request error from dio catch => $message");
      return failedRequest(message);
    } catch (e) {
      printError("the send lawyer request error from catch => ${e.toString()}");
      return failedRequest(e.toString());
    }
  }
}

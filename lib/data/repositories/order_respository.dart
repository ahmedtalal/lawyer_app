import 'package:hokok/data/models/own_orders_for_lawyer_model.dart';
import 'package:hokok/data/services/api/orders_api_service.dart';
import 'package:hokok/domain/entities/client__requests_order_entity.dart';
import 'package:hokok/domain/entities/order_for_client_entity.dart';
import 'package:hokok/domain/entities/private_order_for_lawyer_entity.dart';
import 'package:hokok/domain/entities/public_order_entity.dart';
import 'package:hokok/domain/entities/requests_order_for_lawyer_entity.dart';
import 'dart:async';
import 'package:hokok/domain/interfaces/i_order_interface.dart';
import 'package:hokok/presentation/blocs/order_bloc/order_helper.dart';

class OrderRepository implements IOrderInterface {
  static OrderRepository? _orderRepository;
  OrderRepository._internal();
  static OrderRepository instance() {
    if (_orderRepository == null) {
      return _orderRepository = OrderRepository._internal();
    }
    return _orderRepository!;
  }

  @override
  FutureOr<Map<String, dynamic>> acceptOrderRequestForClient(
      int orderId) async {
    return await OrdersApiService.instance().acceptCLientRequestSer(orderId);
  }

  @override
  FutureOr<Map<String, dynamic>> addOrderForClient(
      CreateOrderModel model) async {
    return await OrdersApiService.instance().createOrderForClientSer(model);
  }

  @override
  FutureOr addOrderForLawyer(PublicOrderEntity entity) {
    // TODO: implement addOrderForLawyer
    throw UnimplementedError();
  }

  @override
  FutureOr<List<RequestOrderInfo>> getAllOrderRequestsForClient(
      int orderId) async {
    return await OrdersApiService.instance()
        .getAllClientRequestOrdersSer(orderId);
  }

  @override
  FutureOr<List<ClientOrderInfo>> getAllOrdersForClient() async {
    return await OrdersApiService.instance().getAllClientOrdersSer();
  }

  @override
  FutureOr<List<RequestsLawyerOrderInfo>>
      getAllRequestesOrderForLawyer() async {
    return await OrdersApiService.instance().getAllRequestOrderLawyerSer();
  }

  @override
  FutureOr<List<OwnOrdersInfoModel>> getOwnOrdersForLawyer(
      String city, int majorId, int status) async {
    return await OrdersApiService.instance()
        .getAllOwnOrdersForLawyerSer(city, majorId, status);
  }

  @override
  FutureOr<List<PrivateOrdersInfoModel>> getPrivateOrdersForLawyer() async {
    return await OrdersApiService.instance().getAllPrivateOrdersForLawyerSer();
  }

  @override
  FutureOr<List<OrderInfoModel>> getPublicOrdersForLawyer(
      String city, int majorId) async {
    return await OrdersApiService.instance()
        .getPublicOrderLawyerSer(city, majorId);
  }

  @override
  FutureOr<Map<String, dynamic>> updateOrderForLawyer(
      int status, int orderId) async {
    return await OrdersApiService.instance()
        .updateOrderStatusForLawyerSer(status, orderId);
  }

  @override
  FutureOr<Map<String, dynamic>> updateOrderStatusFOrClient(
      int status, int orderId) async {
    return await OrdersApiService.instance()
        .updateCLientOrderStatusSer(status, orderId);
  }

  @override
  FutureOr<Map<String, dynamic>> addOrderFeedbackForLawyer(
      int orderId, String lawyerFeedback, double rate) async {
    return await OrdersApiService.instance()
        .addOrderFeedBackForLawyerSer(orderId, lawyerFeedback, rate);
  }

  @override
  FutureOr<Map<String, dynamic>> addOrderFeedbackForClient(
      int orderId, String clientFeedback, double rate) async {
    return await OrdersApiService.instance()
        .addCLientFeedbackSer(orderId, clientFeedback, rate);
  }
}

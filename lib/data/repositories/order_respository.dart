import 'package:hokok/data/models/own_orders_for_lawyer_model.dart';
import 'package:hokok/data/services/api/orders_api_service.dart';
import 'package:hokok/domain/entities/private_order_for_lawyer_entity.dart';
import 'package:hokok/domain/entities/public_order_entity.dart';
import 'package:hokok/domain/entities/requests_order_for_lawyer_entity.dart';
import 'dart:async';
import 'package:hokok/domain/interfaces/i_order_interface.dart';

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
  FutureOr acceptOrderRequestForClient() {
    // TODO: implement acceptOrderRequestForClient
    throw UnimplementedError();
  }

  @override
  FutureOr addOrderForClient(PublicOrderEntity entity) {
    // TODO: implement addOrderForClient
    throw UnimplementedError();
  }

  @override
  FutureOr addOrderForLawyer(PublicOrderEntity entity) {
    // TODO: implement addOrderForLawyer
    throw UnimplementedError();
  }

  @override
  FutureOr<List<PublicOrderEntity>> getAllOrderRequestsForClient() {
    // TODO: implement getAllOrderRequestsForClient
    throw UnimplementedError();
  }

  @override
  FutureOr<List<PublicOrderEntity>> getAllOrdersForClient() {
    // TODO: implement getAllOrdersForClient
    throw UnimplementedError();
  }

  @override
  FutureOr<List<RequestsOrderInfo>> getAllRequestesOrderForLawyer() async {
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
  FutureOr updateOrderStatusFOrClient(int status) {
    // TODO: implement updateOrderStatusFOrClient
    throw UnimplementedError();
  }

  @override
  FutureOr<Map<String, dynamic>> addOrderFeedbackForLawyer(
      int orderId, String lawyerFeedback, double rate) async {
    return await OrdersApiService.instance()
        .addOrderFeedBackForLawyerSer(orderId, lawyerFeedback, rate);
  }
}

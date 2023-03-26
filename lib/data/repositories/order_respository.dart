import 'package:hokok/data/models/own_orders_for_lawyer_model.dart';
import 'package:hokok/data/services/api/orders_api_service.dart';
import 'package:hokok/domain/entities/private_order_for_lawyer_entity.dart';
import 'package:hokok/domain/entities/public_order_entity.dart';
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
  FutureOr<List<PublicOrderEntity>> getAllRequestesOrderForLawyer() {
    // TODO: implement getAllRequestesOrderForLawyer
    throw UnimplementedError();
  }

  @override
  FutureOr<List<OwnOrdersInfoModel>> getOwnOrdersForLawyer(
      String city, int majorId, int status) async {
    return await OrdersApiService.instance()
        .getAllOwnOrdersForLawyer(city, majorId, status);
  }

  @override
  FutureOr<List<PrivateOrdersInfoModel>> getPrivateOrdersForLawyer() {
    // TODO: implement getPrivateOrdersForLawyer
    throw UnimplementedError();
  }

  @override
  FutureOr<List<OrderInfoModel>> getPublicOrdersForLawyer(
      String city, int majorId) async {
    return await OrdersApiService.instance()
        .getPublicOrderLawyer(city, majorId);
  }

  @override
  FutureOr updateOrderForLawyer(int status) {
    // TODO: implement updateOrderForLawyer
    throw UnimplementedError();
  }

  @override
  FutureOr updateOrderStatusFOrClient(int status) {
    // TODO: implement updateOrderStatusFOrClient
    throw UnimplementedError();
  }
}

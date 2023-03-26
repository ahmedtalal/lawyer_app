import 'package:hokok/domain/entities/order_entity.dart';
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
  FutureOr addOrderForClient(OrderEntity entity) {
    // TODO: implement addOrderForClient
    throw UnimplementedError();
  }

  @override
  FutureOr addOrderForLawyer(OrderEntity entity) {
    // TODO: implement addOrderForLawyer
    throw UnimplementedError();
  }

  @override
  FutureOr<List<OrderEntity>> getAllOrderRequestsForClient() {
    // TODO: implement getAllOrderRequestsForClient
    throw UnimplementedError();
  }

  @override
  FutureOr<List<OrderEntity>> getAllOrdersForClient() {
    // TODO: implement getAllOrdersForClient
    throw UnimplementedError();
  }

  @override
  FutureOr<List<OrderEntity>> getAllRequestesOrderForLawyer() {
    // TODO: implement getAllRequestesOrderForLawyer
    throw UnimplementedError();
  }

  @override
  FutureOr<List<OrderEntity>> getOrdersForLawyer(
      String city, int majorId, int status) {
    // TODO: implement getOrdersForLawyer
    throw UnimplementedError();
  }

  @override
  FutureOr<List<OrderEntity>> getPrivateOrdersForLawyer() {
    // TODO: implement getPrivateOrdersForLawyer
    throw UnimplementedError();
  }

  @override
  FutureOr<List<OrderEntity>> getPublicOrdersForLawyer(
      String city, int majorId) {
    // TODO: implement getPublicOrdersForLawyer
    throw UnimplementedError();
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

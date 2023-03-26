import 'dart:async';

import 'package:hokok/domain/entities/order_entity.dart';

abstract class IOrderInterface {
  FutureOr<List<OrderEntity>> getPublicOrdersForLawyer(
      String city, int majorId);
  FutureOr<List<OrderEntity>> getOrdersForLawyer(
      String city, int majorId, int status);
  FutureOr<List<OrderEntity>> getPrivateOrdersForLawyer();
  FutureOr<dynamic> addOrderForLawyer(OrderEntity entity);
  FutureOr<List<OrderEntity>> getAllRequestesOrderForLawyer();
  FutureOr<dynamic> updateOrderForLawyer(int status);
  FutureOr<dynamic> addOrderForClient(OrderEntity entity);
  FutureOr<List<OrderEntity>> getAllOrdersForClient();
  FutureOr<List<OrderEntity>> getAllOrderRequestsForClient();
  FutureOr<dynamic> acceptOrderRequestForClient();
  FutureOr<dynamic> updateOrderStatusFOrClient(int status);
}

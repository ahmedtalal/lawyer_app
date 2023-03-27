import 'dart:async';

import 'package:hokok/data/models/own_orders_for_lawyer_model.dart';
import 'package:hokok/domain/entities/private_order_for_lawyer_entity.dart';
import 'package:hokok/domain/entities/public_order_entity.dart';
import 'package:hokok/domain/entities/requests_order_for_lawyer_entity.dart';

abstract class IOrderInterface {
  FutureOr<List<OrderInfoModel>> getPublicOrdersForLawyer(
      String city, int majorId);
  FutureOr<List<OwnOrdersInfoModel>> getOwnOrdersForLawyer(
      String city, int majorId, int status);
  FutureOr<List<PrivateOrdersInfoModel>> getPrivateOrdersForLawyer();
  FutureOr<dynamic> addOrderForLawyer(PublicOrderEntity entity);
  FutureOr<List<RequestsOrderInfo>> getAllRequestesOrderForLawyer();
  FutureOr<dynamic> updateOrderForLawyer(int status, int orderId);
  FutureOr<dynamic> addOrderForClient(PublicOrderEntity entity);
  FutureOr<List<PublicOrderEntity>> getAllOrdersForClient();
  FutureOr<List<PublicOrderEntity>> getAllOrderRequestsForClient();
  FutureOr<dynamic> acceptOrderRequestForClient();
  FutureOr<dynamic> updateOrderStatusFOrClient(int status);
  FutureOr<dynamic> addOrderFeedbackForLawyer(
    int orderId,
    String lawyerFeedback,
    double rate,
  );
}

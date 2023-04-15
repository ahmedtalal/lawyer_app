import 'dart:async';

import 'package:hokok/data/models/own_orders_for_lawyer_model.dart';
import 'package:hokok/domain/entities/client__requests_order_entity.dart';
import 'package:hokok/domain/entities/order_for_client_entity.dart';
import 'package:hokok/domain/entities/private_order_for_lawyer_entity.dart';
import 'package:hokok/domain/entities/public_order_entity.dart';
import 'package:hokok/domain/entities/requests_order_for_lawyer_entity.dart';
import 'package:hokok/presentation/blocs/order_bloc/order_helper.dart';

abstract class IOrderInterface {
  FutureOr<List<OrderInfoModel>> getPublicOrdersForLawyer(
      String city, int majorId);
  FutureOr<List<OwnOrdersInfoModel>> getOwnOrdersForLawyer(
      String city, int majorId, int status);
  FutureOr<List<PrivateOrdersInfoModel>> getPrivateOrdersForLawyer();
  FutureOr<dynamic> addOrderForLawyer(PublicOrderEntity entity);
  FutureOr<List<RequestsLawyerOrderInfo>> getAllRequestesOrderForLawyer();
  FutureOr<dynamic> updateOrderForLawyer(int status, int orderId);
  FutureOr<dynamic> addOrderForClient(CreateOrderModel model);
  FutureOr<List<ClientOrderInfo>> getAllOrdersForClient();
  FutureOr<List<RequestOrderInfo>> getAllOrderRequestsForClient(int orderId);
  FutureOr<dynamic> acceptOrderRequestForClient(int orderId);
  FutureOr<dynamic> updateOrderStatusFOrClient(int status, int orderId);
  FutureOr<dynamic> addOrderFeedbackForLawyer(
    int orderId,
    String lawyerFeedback,
    double rate,
  );

  FutureOr<dynamic> addOrderFeedbackForClient(
    int orderId,
    String clientFeedback,
    double rate,
  );
}

import 'package:flutter/material.dart';
import 'package:hokok/core/shared_widget/circler_loader_shared_widget.dart';
import 'package:hokok/core/shared_widget/show_snackbar_shared_widget.dart';
import 'package:hokok/data/models/own_orders_for_lawyer_model.dart';
import 'package:hokok/domain/entities/client__requests_order_entity.dart';
import 'package:hokok/domain/entities/order_for_client_entity.dart';
import 'package:hokok/domain/entities/private_order_for_lawyer_entity.dart';
import 'package:hokok/domain/entities/public_order_entity.dart';
import 'package:hokok/domain/entities/requests_order_for_lawyer_entity.dart';

abstract class OrderStates {}

class OrdersInitState extends OrderStates {}

class OrderLoadingState extends OrderStates {
  // showLoadingDialog(BuildContext context) async {
  //   return await showCircleLoaderWidget(context);
  // }
}

class PublicOrderLoadedState extends OrderStates {
  List<OrderInfoModel>? orders;
  PublicOrderLoadedState(this.orders);
}

class OwnOrderLoadedState extends OrderStates {
  List<OwnOrdersInfoModel>? ownOrdes;
  OwnOrderLoadedState(this.ownOrdes);
}

class PrivateOrderLoadedState extends OrderStates {
  List<PrivateOrdersInfoModel>? privateOrders;
  PrivateOrderLoadedState(this.privateOrders);
}

class RequestOrderLoadedState extends OrderStates {
  List<RequestsLawyerOrderInfo>? requestOrders;
  RequestOrderLoadedState(this.requestOrders);
}

class ClientOrdersLoadedState extends OrderStates {
  List<ClientOrderInfo>? clientOrders;
  ClientOrdersLoadedState(this.clientOrders);
}

class ClientOrdersRequestLoadedState extends OrderStates {
  List<RequestOrderInfo>? requestOrders;
  ClientOrdersRequestLoadedState(this.requestOrders);
}

class OrderFailedLoadedState extends OrderStates {
  String error;
  OrderFailedLoadedState(this.error);

  authErrorMessage(BuildContext context, String title) {
    ScaffoldMessenger.of(context).showSnackBar(
      showSnakBarWidget(context, title, Colors.red),
    );
  }
}

class ClientOrderFailedLoadedState extends OrderStates {
  String error;
  ClientOrderFailedLoadedState(this.error);

  authErrorMessage(BuildContext context, String title) {
    ScaffoldMessenger.of(context).showSnackBar(
      showSnakBarWidget(context, title, Colors.red),
    );
  }
}

class PublicOrderFailedLoadedState extends OrderStates {
  String error;
  PublicOrderFailedLoadedState(this.error);

  authErrorMessage(BuildContext context, String title) {
    ScaffoldMessenger.of(context).showSnackBar(
      showSnakBarWidget(context, title, Colors.red),
    );
  }
}

class OwnOrderFailedLoadedState extends OrderStates {
  String error;
  OwnOrderFailedLoadedState(this.error);

  authErrorMessage(BuildContext context, String title) {
    ScaffoldMessenger.of(context).showSnackBar(
      showSnakBarWidget(context, title, Colors.red),
    );
  }
}

class PrivateOrderFailedLoadedState extends OrderStates {
  String error;
  PrivateOrderFailedLoadedState(this.error);

  authErrorMessage(BuildContext context, String title) {
    ScaffoldMessenger.of(context).showSnackBar(
      showSnakBarWidget(context, title, Colors.red),
    );
  }
}

class RequesrOrderFailedLoadedState extends OrderStates {
  String error;
  RequesrOrderFailedLoadedState(this.error);

  authErrorMessage(BuildContext context, String title) {
    ScaffoldMessenger.of(context).showSnackBar(
      showSnakBarWidget(context, title, Colors.red),
    );
  }
}

class OrderActionSuccessState extends OrderStates {
  authErrorMessage(BuildContext context, String title) {
    ScaffoldMessenger.of(context).showSnackBar(
      showSnakBarWidget(context, title, Colors.red),
    );
  }
}

class OrderActionFailedState extends OrderStates {
  dynamic error;
  OrderActionFailedState({required this.error});
  authErrorMessage(BuildContext context, String title) {
    ScaffoldMessenger.of(context).showSnackBar(
      showSnakBarWidget(context, title, Colors.red),
    );
  }
}

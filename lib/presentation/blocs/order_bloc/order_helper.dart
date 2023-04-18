import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hokok/core/debug_prints.dart';
import 'package:hokok/data/models/own_orders_for_lawyer_model.dart';
import 'package:hokok/presentation/blocs/order_bloc/order_bloc.dart';
import 'package:hokok/presentation/blocs/order_bloc/order_events.dart';
import 'package:intl/intl.dart';

class OrderHelper {
  static OrderHelper? _orderHelper;
  OrderHelper._internal();
  static OrderHelper instance() {
    if (_orderHelper == null) {
      return _orderHelper = OrderHelper._internal();
    }
    return _orderHelper!;
  }

  String city = '';
  int status = 0;
  int majorId = 0;
  String? majorValue;
  int orderId = 0;
  String orderFeedback = "";
  double orderRate = 0;
  String title = "";
  String clientExpectedDate = "";
  double clientProposedBudget = 0;
  String clientDescription1 = "";
  String clientDescription2 = "";
  int subMajorId = 0;
  String type = "0";
  int lawyerId = 0;
  String description1 = "";


  List<OwnOrdersInfoModel> getAllInPublishedOrders(
      List<OwnOrdersInfoModel> orders) {
    List<OwnOrdersInfoModel> publishedOrders = [];
    for (var order in orders) {
      if (order.status!.toLowerCase() == "published") {
        publishedOrders.add(order);
      }
    }
    return publishedOrders;
  }

  List<OwnOrdersInfoModel> getAllInProgressOrders(
      List<OwnOrdersInfoModel> orders) {
    List<OwnOrdersInfoModel> inprogressOrders = [];
    for (var order in orders) {
      if (order.status!.toLowerCase() == "inprogress") {
        inprogressOrders.add(order);
      }
    }
    return inprogressOrders;
  }

  List<OwnOrdersInfoModel> getAllCompletedOrders(
      List<OwnOrdersInfoModel> orders) {
    List<OwnOrdersInfoModel> completedOrders = [];
    for (var order in orders) {
      if (order.status!.toLowerCase() == "completed") {
        completedOrders.add(order);
      }
    }
    return completedOrders;
  }

  CreateOrderModel prepareClientOrderModel() => CreateOrderModel(
        title: title,
        majorId: majorId,
        subMajorId: subMajorId,
        description1: description1,
        type: type,
        clientExpectedDate: clientExpectedDate,
        clientproposedbudget: clientProposedBudget,
      );

  getPublicOrdersForLawyerAction(BuildContext context) =>
      context.read<OrderBloc>().add(GetPublicOrdersForLawyerEvent());

  getOwnOrdersForLawyerAction(BuildContext context) =>
      context.read<OrderBloc>().add(GetOwnOrdersForLawyerEvent());

  getPrivateOrdersForLawyerAction(BuildContext context) =>
      context.read<OrderBloc>().add(GetPrivateOrdersForLawyerEvent());

  getRequestOrdersForLawyerAction(BuildContext context) =>
      context.read<OrderBloc>().add(GetRequestsOrdersForLawyerEvent());

  updateOrdersForLawyerAction(BuildContext context) =>
      context.read<OrderBloc>().add(UpdateOrdersForLawyerEvent());

  addOrderFeedbackForLawyerAction(BuildContext context) =>
      context.read<OrderBloc>().add(AddOrderFeedbackForLawyerEvent());

  onCreateOrderActionForClient(
      BuildContext context, GlobalKey<FormState> form) {
    if (form.currentState!.validate()) {
      context.read<OrderBloc>().add(CreateClientOrderEvent());
    }
  }

  onGetAllClientOrdersFun(BuildContext context) =>
      context.read<OrderBloc>().add(GetAllClientOderEvent());

  String publishedDateFormat(String date) {
    String result = date.substring(0, 10);
    printInfo("the published data => $result");
    return result;
  }
}

class CreateOrderModel {
  final String title, description1, clientExpectedDate, type;
  final int? majorId, subMajorId, lawyerId;
  final double clientproposedbudget;
  CreateOrderModel({
    required this.title,
    required this.majorId,
    required this.subMajorId,
    required this.description1,
    required this.type,
    this.lawyerId,
    required this.clientExpectedDate,
    required this.clientproposedbudget,
  });

  factory CreateOrderModel.fromJson(Map<String, dynamic> json) {
    return CreateOrderModel(
      title: json["title"],
      majorId: json["major_id"],
      subMajorId: json["sub_major_id"],
      description1: json["description"],
      type: json["type"],
      lawyerId: json["lawyer_id"],
      clientExpectedDate: json["client_expected_date"],
      clientproposedbudget: json["client_proposed_budget"],
    );
  }
  Map<String, dynamic> toJsonWithLawyerId() => {
        "title": title,
        "major_id": majorId,
        "sub_major_id": subMajorId,
        "description": description1,
        "type": type,
        "lawyer_id": lawyerId,
        "client_expected_date": clientExpectedDate,
        "client_proposed_budget": clientproposedbudget,
      };

  Map<String, dynamic> toJsonWithoutLawyerId() => {
        "title": title,
        "major_id": majorId,
        "sub_major_id": subMajorId,
        "description": description1,
        "type": type,
        "client_expected_date": clientExpectedDate,
        "client_proposed_budget": clientproposedbudget,
      };
}

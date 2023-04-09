import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hokok/presentation/blocs/order_bloc/order_bloc.dart';
import 'package:hokok/presentation/blocs/order_bloc/order_events.dart';

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
  int orderId = 0;
  String orderFeedback = "";
  double orderRate = 0;
  String title = "";
  String year = "";
  String month = "";
  String day = "";
  double clientProposedBudget = 0;
  String clientDescription1 = "";
  String clientDescription2 = "";
  int subMajorId = 0;
  String type = "0";
  int lawyerId = 0;
  String description1 = "";

  String _convetStrToDate() {
    return "$year-$month-$day";
  }

  CreateOrderModel prepareClientOrderModel() => CreateOrderModel(
        title: title,
        majorId: majorId,
        subMajorId: subMajorId,
        description1: description1,
        type: type,
        clientExpectedDate: _convetStrToDate(),
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

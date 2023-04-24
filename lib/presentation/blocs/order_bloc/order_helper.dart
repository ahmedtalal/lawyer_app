import 'dart:io';

import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hokok/core/debug_prints.dart';
import 'package:hokok/data/models/own_orders_for_lawyer_model.dart';
import 'package:hokok/presentation/blocs/order_bloc/order_bloc.dart';
import 'package:hokok/presentation/blocs/order_bloc/order_events.dart';

import '../../../domain/entities/order_for_client_entity.dart';

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
  String expectedTime = "";
  double clientProposedBudget = 0;
  String clientDescription1 = "";
  String clientDescription2 = "";
  int subMajorId = 0;
  String type = "0";
  int lawyerId = 0;
  String description1 = "";
  int expectedDays = 0;
  List<File> files = [];


  List<ClientOrderInfo> getClientAllPublishedOrders(
      List<ClientOrderInfo> orders) {
    List<ClientOrderInfo> publishedOrders = [];
    for (var order in orders) {
      if (order.statusCode! ==  1) {
        publishedOrders.add(order);
      }
    }
    return  publishedOrders;
  }
  List<ClientOrderInfo> getClientAllInProgressOrders(
      List<ClientOrderInfo> orders) {
    List<ClientOrderInfo> publishedOrders = [];
    for (var order in orders) {
      if (order.statusCode! ==  2) {
        publishedOrders.add(order);
      }
    }
    return  publishedOrders;
  }
  List<ClientOrderInfo> getClientAllCompletedOrders(
      List<ClientOrderInfo> orders) {
    List<ClientOrderInfo> publishedOrders = [];
    for (var order in orders) {
      if (order.statusCode! ==  8) {
        publishedOrders.add(order);
      }
    }
    return  publishedOrders;
  }

  List<OwnOrdersInfoModel> getAllInPublishedOrders(
      List<OwnOrdersInfoModel> orders) {
    List<OwnOrdersInfoModel> publishedOrders = [];
    for (var order in orders) {
      if (order.statusCode! ==  2) {
        publishedOrders.add(order);
      }
    }
    return  publishedOrders;
  }

  List<OwnOrdersInfoModel> getAllInProgressOrders(
      List<OwnOrdersInfoModel> orders) {
    List<OwnOrdersInfoModel> inprogressOrders = [];
    for (var order in orders) {
      if (order.statusCode! ==  2) {
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
        clientExpectedDate: expectedTime,
        clientProposedBudget: clientProposedBudget,
      );
  CreateOrderModel preparePrivateOrderModel() => CreateOrderModel(
    title: title,
    majorId: majorId,
    subMajorId: subMajorId,
    description1: description1,
    type: type,
    lawyerId: lawyerId,
    clientExpectedDate: expectedTime,
    clientProposedBudget: clientProposedBudget,
  );

  FormData lawyerRequestModel() {
    FormData formData = FormData.fromMap({
      "order_id": orderId,
      "expected_days": expectedDays,
      "expected_budget": clientProposedBudget,
      "info": description1,
      "files": [files],
    });
    return formData;
  }

  Future<String> selectFileFromStorageFun() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    String filePath = '';
    if (result != null) {
      File file = File(result.files.single.path ?? "");
      String fileName = file.path.split('/').last;
      filePath = file.path;
      printInfo("the file path is => $filePath");
      printInfo("the file name => $fileName");
    }
    return filePath;
  }

  String setCLientExpectedDate(String date) {
    printInfo("the client date =>$date");
    String year = date.substring(0, 4);
    printInfo("the year => $year");
    String month = date.substring(4, 6);
    printInfo("the month => $month");
    String day = date.substring(6, 8);
    printInfo("the day => $day");
    return "$month-$day -$year";
  }

  getPublicOrdersForLawyerAction(BuildContext context) =>
      context.read<OrderBloc>().add(GetPublicOrdersForLawyerEvent());
  getOwnOrdersForLawyerAction(BuildContext context) =>
      context.read<OrderBloc>().add(GetOwnOrdersForLawyerEvent());
  getAllOrderForClient(BuildContext context) =>
      context.read<OrderBloc>().add(GetAllClientOderEvent());

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
  onCreatePrivateOrderActionForClient(
      BuildContext context, GlobalKey<FormState> form) {
    if (form.currentState!.validate()) {
      context.read<OrderBloc>().add(CreatePrivateOrderEvent());
    }
  }

  onSendLawyerRequestAction(BuildContext context, GlobalKey<FormState> form) {
    if (form.currentState!.validate() && files.isNotEmpty) {
      context.read<OrderBloc>().add(SendLawyerRequestEvent());
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
  final double clientProposedBudget;
  CreateOrderModel({
    required this.title,
    required this.majorId,
    required this.subMajorId,
    required this.description1,
    required this.type,
    this.lawyerId,
    required this.clientExpectedDate,
    required this.clientProposedBudget,
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
      clientProposedBudget: json["client_proposed_budget"],
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
        "client_proposed_budget": clientProposedBudget,
      };

  Map<String, dynamic> toJsonWithoutLawyerId() => {
        "title": title,
        "major_id": majorId,
        "sub_major_id": subMajorId,
        "description": description1,
        "type": type,
        "client_expected_date": clientExpectedDate,
        "client_proposed_budget": clientProposedBudget,
      };
}

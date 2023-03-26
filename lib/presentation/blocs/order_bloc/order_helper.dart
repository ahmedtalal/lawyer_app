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

  getPublicOrdersForLawyerAction(BuildContext context) {
    context.read<OrderBloc>().add(GetPublicOrdersForLawyerEvent());
  }

  getOwnOrdersForLawyerAction(BuildContext context) {
    context.read<OrderBloc>().add(GetOwnOrdersForLawyerEvent());
  }
}

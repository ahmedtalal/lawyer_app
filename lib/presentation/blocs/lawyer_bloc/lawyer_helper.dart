import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hokok/presentation/blocs/lawyer_bloc/lawyer_bloc.dart';
import 'package:hokok/presentation/blocs/lawyer_bloc/lawyer_events.dart';

class LawyerHelper {
  static LawyerHelper? _lawyerHelper;
  LawyerHelper.internal();
  static LawyerHelper instance() {
    if (_lawyerHelper == null) {
      return _lawyerHelper = LawyerHelper.internal();
    }
    return _lawyerHelper!;
  }

  int page = 1;
  int perPage = 10;
  int majorId = 0;
  String city = '';
  double rate = 0;

  onGetAllLawyers(BuildContext context) =>
      context.read<LawyersBloc>().add(GetAllLawyersEvent());
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hokok/presentation/blocs/major_bloc/major_bloc.dart';
import 'package:hokok/presentation/blocs/major_bloc/major_events.dart';

class MajorHelper {
  static MajorHelper? _majorHelper;
  MajorHelper._internal();
  static MajorHelper instance() {
    if (_majorHelper == null) {
      return _majorHelper = MajorHelper._internal();
    }
    return _majorHelper!;
  }

  getMajorsActionCon(BuildContext context) =>
      context.read<MajorBloc>().add(GetAllMajorsEvent());

  getSubMajorsActionCon(BuildContext context) =>
      context.read<MajorBloc>().add(GetAllSubMajorsEvent());
}

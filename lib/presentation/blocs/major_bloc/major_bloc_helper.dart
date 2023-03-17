import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hokok/presentation/blocs/major_bloc/major_bloc.dart';
import 'package:hokok/presentation/blocs/major_bloc/major_events.dart';

class MajorBlocHelper {
  static MajorBlocHelper? _majorBlocHelper;
  MajorBlocHelper._internal();
  static MajorBlocHelper instance() {
    if (_majorBlocHelper == null) {
      return _majorBlocHelper = MajorBlocHelper._internal();
    }
    return _majorBlocHelper!;
  }

  getMajorsActionCon(BuildContext context) {
    context.read<MajorBloc>().add(GetAllMajorsEvent());
  }
}

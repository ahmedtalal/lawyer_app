import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../screens/home.dart';
import 'main_states_lawyer.dart';

class MainLawyerCubit extends Cubit<MainLawyerState> {
  MainLawyerCubit() : super(MainLawyerInitial());
}

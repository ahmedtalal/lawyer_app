import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../screens/home.dart';
import 'main_states_lawyer.dart';

class MainLawyerCubit extends Cubit<MainLawyerState> {
  MainLawyerCubit() : super(MainLawyerInitial());
  List<Widget> screens = [
    const HomeLawyerScreen(),
    const HomeLawyerScreen(),
    const HomeLawyerScreen(),
    const HomeLawyerScreen(),
  ];
  int currentIndex = 0;
  int navSelectedIndex = 0;

  changeNavIndex(int index) {
    currentIndex = index;
    emit(BottomNavIndexChanged());
  }
}

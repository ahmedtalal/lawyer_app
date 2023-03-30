import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../browse_order/browse_order_screen.dart';
import '../../find_lawyer/find_lawyer_screen.dart';
import '../../main/main_screen.dart';
import '../../talk_with_us/talk_with_us_screen.dart';
import 'layout_state.dart';

class LayoutCubit extends Cubit<LayoutState> {
  LayoutCubit() : super(LayoutInitial());

  List<Widget> screens = [
    MainScreen(),
    FindLawyerScreen(),
    BrowseOrderScreen(),
    TalkWithUsScreen(),
  ];
  int currentIndex = 0;
  int navSelectedIndex = 0;

  changeNavIndex(int index) {
    currentIndex = index;
    emit(BottomNavIndexChanged());
  }
}

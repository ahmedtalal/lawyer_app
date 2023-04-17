import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hokok/laywer_app/presentation/screen/cotact_us/contact_us_screen.dart';
import 'package:hokok/laywer_app/presentation/screen/massages/massages_screen.dart';
import 'package:hokok/laywer_app/presentation/screen/orders/orders_scree.dart';
import 'package:hokok/laywer_app/presentation/screen/home/screens/lawyer_settings_screen.dart';

import '../../screens/home.dart';
import '../../screens/lawyer_issues/lawyer_issues_screen.dart';
import 'main_states_lawyer.dart';

class MainLawyerCubit extends Cubit<MainLawyerState> {
  MainLawyerCubit() : super(MainLawyerInitial());
  List<Widget> screens = [
    const HomeLawyerScreen(),
    const LawyerIssuesScreen(),
    const MassagesScreen(),
    const ContactUsScreen(),
    const LawyerSettingsScreen(),
  ];
  int currentIndex = 0;
  int navSelectedIndex = 0;

  changeNavIndex(int index) {
    currentIndex = index;
    emit(BottomNavIndexChanged());
  }
  int index = 0;

  void changeIndex(int newIndex) {
    index = newIndex;
    emit(ChangeIndexState());
  }
}





class LogOut extends StatelessWidget {
  const LogOut({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("LogOut"),
    );
  }
}

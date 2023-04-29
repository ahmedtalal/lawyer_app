import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hokok/core/shared_widget/button.dart';

import '../../../../core/color_manager.dart';
import '../../../../core/font_manager.dart';
import '../../../../core/routes_manager.dart';
import '../../../blocs/auth_bloc/auth_bloc.dart';
import '../../../blocs/auth_bloc/auth_helper.dart';
import '../../../blocs/auth_bloc/auth_states.dart';
import '../../browse_order/browse_order_screen.dart';
import '../../browse_order/order_details_screen.dart';
import '../../find_lawyer/find_lawyer_screen.dart';
import '../../main/main_screen.dart';
import '../../talk_with_us/talk_with_us_screen.dart';
import 'layout_state.dart';

class LayoutCubit extends Cubit<LayoutState> {
  LayoutCubit() : super(LayoutInitial());

  List<Widget> screens = [
    const MainScreen(),
    const FindLawyerScreen(),
    const BrowseOrderScreen(),
    const TalkWithUsScreen(),
    const Scaffold(
      body: Center(child: Text('log Out')),
    ),
  ];
  int currentIndex = 0;
  int navSelectedIndex = 0;

  void showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isDismissible: true,
      enableDrag: true,
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          height: 180.h,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Center(
                child: Text(
                  'هل أنت متأكد من تسجيل الخروج؟',
                  style:  TextStyle(
                      color: ColorManager.primary,
                      fontSize: FontSize.s22,
                      fontFamily: FontConstants.fontFamily),
                ),
              ),
              SizedBox(
                height: 20.h,
              ),

              Row(
                children: [
                  BlocConsumer<AuthBloc, AuthStates>(listener: (context, state) {
                    if (state is LogOutSuccessState) {
                      state.authNaviation(
                          const RouteSettings(
                            name: Routes.splashRoute,
                          ),
                          context);
                    } else if (state is LogOutFailedState) {
                      state.authErrorMessage(context, "logout exception");
                    }
                  }, builder: (context, state) {
                    return Flexible(
                        child: DefaultElevatedButton(
                          "نعم",
                          txtColor: ColorManager.white,
                          onPressed: () {
                            AuthHelper.instance().onLogOutAction(context);
                          },
                        ));
                  }),
                  SizedBox(
                    width: 10.w,
                  ),
                  const Flexible(
                      child: DefaultElevatedButton("لا",
                          txtColor: ColorManager.fourth))
                ],
              )
            ],
          ),
        );
      },
    );
  }

  changeNavIndex(int index, BuildContext context) {
    if (index == 4) {
      showBottomSheet(context);
    } else {
      currentIndex = index;
      emit(BottomNavIndexChanged());
    }
  }
}

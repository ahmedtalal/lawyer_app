import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hokok/core/color_manager.dart';
import 'package:hokok/core/font_manager.dart';
import 'package:hokok/core/routes_manager.dart';
import 'package:hokok/core/shared_widget/button.dart';
import 'package:hokok/laywer_app/presentation/screen/cotact_us/contact_us_screen.dart';
import 'package:hokok/laywer_app/presentation/screen/home/screens/lawyer_issues/layout_lawyer_issues.dart';
import 'package:hokok/laywer_app/presentation/screen/massages/massages_screen.dart';
import 'package:hokok/laywer_app/presentation/screen/orders/orders_scree.dart';
import 'package:hokok/laywer_app/presentation/screen/home/screens/lawyer_settings_screen.dart';
import 'package:hokok/presentation/blocs/auth_bloc/auth_bloc.dart';
import 'package:hokok/presentation/blocs/auth_bloc/auth_helper.dart';
import 'package:hokok/presentation/blocs/auth_bloc/auth_states.dart';
import '../../screens/home.dart';
import 'main_states_lawyer.dart';

class MainLawyerCubit extends Cubit<MainLawyerState> {
  MainLawyerCubit() : super(MainLawyerInitial());
  List<Widget> screens = [
    const HomeLawyerScreen(),
    const LayoutLawyerIssues(),
    const MassagesScreen(),
    const ContactUsScreen(),
    const Scaffold(body: Text("تسجيل الخروج"),)
  ];
  int currentIndex = 0;
  int currentIndex1 = 0;

  changeNavIndex(int index, BuildContext context) {
    if (index == 4) {
      showBottomSheet(context);
    } else {
      currentIndex = index;
      emit(BottomNavIndexChanged());
    }
  }

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
                  style: TextStyle(
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
                  BlocConsumer<AuthBloc, AuthStates>(
                      listener: (context, state) {
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
                  Flexible(
                    child: DefaultElevatedButton(
                      "لا",
                      btnColor: Colors.grey[300],
                      txtColor: ColorManager.fourth,
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ),
                ],
              )
            ],
          ),
        );
      },
    );
  }

  changeNav2Index(int index) {
    currentIndex1 = index;
    emit(BottomNavIndexChanged());
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

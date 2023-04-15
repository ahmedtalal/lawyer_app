import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hokok/config/screen_handler.dart';
import 'package:hokok/core/color_manager.dart';
import 'package:hokok/core/font_manager.dart';
import 'package:hokok/core/routes_manager.dart';
import 'package:hokok/presentation/blocs/auth_bloc/auth_bloc.dart';
import 'package:hokok/presentation/blocs/auth_bloc/auth_helper.dart';
import 'package:hokok/presentation/blocs/auth_bloc/auth_states.dart';

class LawyerSettingsScreen extends StatefulWidget {
  const LawyerSettingsScreen({super.key});

  @override
  State<LawyerSettingsScreen> createState() => _LawyerSettingsScreenState();
}

class _LawyerSettingsScreenState extends State<LawyerSettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: ScreenHandler.getScreenHeight(context),
        width: ScreenHandler.getScreenWidth(context),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: ScreenHandler.getScreenWidth(context),
              height: 200.h,
              color: ColorManager.primary,
            ),
            SizedBox(
              height: 30.h,
            ),
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
              return InkWell(
                onTap: () {
                  AuthHelper.instance().onLogOutAction(context);
                },
                child: Text(
                  "تسجيل الخروج",
                  style: TextStyle(
                    fontSize: 17.sp,
                    fontFamily: FontConstants.fontFamily,
                  ),
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}

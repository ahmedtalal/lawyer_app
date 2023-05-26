import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hokok/presentation/screen/layout/cubit/layout_cubit.dart';
import 'package:hokok/presentation/screen/layout/cubit/layout_state.dart';
import 'package:hokok/core/assets_manager.dart';
import 'package:hokok/core/color_manager.dart';
import 'package:hokok/core/strings_manager.dart';
import 'package:hokok/core/values_manager.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../core/constants_manager.dart';
import '../../../core/routes_manager.dart';
import '../main/drawer/home_view_drawer.dart';

class LayoutScreen extends StatelessWidget {
  const LayoutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LayoutCubit, LayoutState>(builder: (context, state) {
      var cubit = context.read<LayoutCubit>();
      return Scaffold(
        appBar: _appBar(context),
        body: cubit.screens[cubit.currentIndex],
        bottomNavigationBar: _tapBar(),
        //drawer: const HomeViewDrawer(),
      );
    });
  }

  AppBar _appBar(BuildContext context) => AppBar(
        backgroundColor: ColorManager.primary,
        actions: <Widget>[
          GestureDetector(
            onTap: () {},
            child: SvgPicture.asset(
              AssetsManager.notificationIcon,
            ),
          ),
          const SizedBox(
            width: AppPadding.p25,
          ),
          Padding(
            padding: const EdgeInsets.only(left: AppPadding.p12),
            child: GestureDetector(
              onTap: () => Navigator.of(context)
                  .pushReplacementNamed(Routes.layoutProfileRoute),
              child: const CircleAvatar(
                backgroundColor: ColorManager.white,
                radius: AppSize.s18,
              ),
            ),
          ),
          /*BlocConsumer<AuthBloc, AuthStates>(listener: (context, state) {
              if (state is AuthFailedState) {
                state.authErrorMessage(context, state.error);
              }
              if (state is LogOutSuccessState) {
                state.authNaviation(
                    const RouteSettings(
                      name: Routes.splashRoute,
                    ),
                    context);
              }
            }, builder: (context, state) {
              return Positioned(
                width: AppSize.s15_5,
                height: AppSize.s17_4,
                left: AppSize.s144,
                top: AppSize.s101,
                child: GestureDetector(
                  onTap: () {
                    AuthBlocHelper.instance().onLogOutAction(context);
                  },
                  child: const Icon(Icons.logout),
                ),
              );
            }),*/
        ],
        /*leading: Padding(
          padding: const EdgeInsets.all(AppPadding.p12),
          child: GestureDetector(
            onTap: () {},
            child: SvgPicture.asset(
              AssetsManager.menuIcon,
            ),
          ),
        )*/
      );

  MainBottomNavBar _tapBar() => const MainBottomNavBar();
}

List<String> bottomNavStrings = [
  AppStrings.main,
  AppStrings.findLawyer,
  AppStrings.orders,
  AppStrings.contactMe,
  AppStrings.exit,
];

List<IconData> bottomNavIcons = [
  FontAwesomeIcons.house,
  FontAwesomeIcons.magnifyingGlass,
  FontAwesomeIcons.fileLines,
  FontAwesomeIcons.headset,
  FontAwesomeIcons.arrowRightFromBracket,
];

class MainBottomNavBar extends StatelessWidget {
  const MainBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LayoutCubit, LayoutState>(
      builder: (context, state) {
        return Container(
          height: 80,
          padding: const EdgeInsets.all(10),
          decoration: const BoxDecoration(
            color: ColorManager.secondary,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40),
              topRight: Radius.circular(40),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(
              bottomNavStrings.length,
              (index) => Row(
                children: [
                  SizedBox(
                    width: (MediaQuery.of(context).size.width / 5) - 20,
                    child: InkWell(
                      onTap: () {
                        context
                            .read<LayoutCubit>()
                            .changeNavIndex(index, context);
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            bottomNavIcons[index],
                            color: context.read<LayoutCubit>().currentIndex ==
                                    index
                                ? ColorManager.primary
                                : ColorManager.white,
                          ),
                          const SizedBox(height: 5),
                          FittedBox(
                            child: Text(
                              bottomNavStrings[index],
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(
                                    color: context
                                                .read<LayoutCubit>()
                                                .navSelectedIndex ==
                                            index
                                        ? ColorManager.primary
                                        : ColorManager.white,
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

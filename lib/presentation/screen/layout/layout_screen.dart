import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hokok/core/routes_manager.dart';
import 'package:hokok/presentation/blocs/auth_bloc/auth_bloc.dart';
import 'package:hokok/presentation/blocs/auth_bloc/auth_bloc_helper.dart';
import 'package:hokok/presentation/blocs/auth_bloc/auth_states.dart';
import 'package:hokok/presentation/screen/browse_order/browse_order_screen.dart';
import 'package:hokok/presentation/screen/find_lawyer/find_lawyer_screen.dart';
import 'package:hokok/presentation/screen/layout/cubit/layout_cubit.dart';
import 'package:hokok/presentation/screen/layout/cubit/layout_state.dart';
import 'package:hokok/presentation/screen/main/main_screen.dart';
import 'package:hokok/core/assets_manager.dart';
import 'package:hokok/core/color_manager.dart';
import 'package:hokok/core/font_manager.dart';
import 'package:hokok/core/strings_manager.dart';
import 'package:hokok/core/values_manager.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


import '../../../core/constants_manager.dart';

class LayoutScreen extends StatefulWidget {
  const LayoutScreen({Key? key}) : super(key: key);

  @override
  State<LayoutScreen> createState() => _LayoutScreenState();
}



class _LayoutScreenState extends State<LayoutScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: AppIntegerNum.i3,
      child: Scaffold(
        body: Column(
          children: [
            _appBar(),
            _body(),
            _tapBar(),
          ],
        ),
      ),
    );
  }

  Container _appBar() => Container(
        color: ColorManager.primary,
        height: AppSize.s150,
        width: double.infinity,
        child: Stack(
          alignment: AlignmentDirectional.topEnd,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: AppPadding.p128,
                right: AppPadding.p105,
                top: AppPadding.p0,
              ),
              child: SvgPicture.asset(
                AssetsManager.logoIcon,
                height: AppSize.s142,
                width: AppSize.s142,
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                  Colors.white.withOpacity(AppOpacity.c0_65),
                  BlendMode.srcIn,
                ),
              ),
            ),
            Positioned(
              width: AppSize.s31,
              height: AppSize.s14,
              right: AppSize.s10,
              top: AppSize.s104,
              child: GestureDetector(
                onTap: () {},
                child: SvgPicture.asset(
                  AssetsManager.menuIcon,
                ),
              ),
            ),
            BlocConsumer<AuthBloc, AuthStates>(listener: (context, state) {
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
            }),
            Positioned(
              width: AppSize.s15_5,
              height: AppSize.s17_4,
              left: AppSize.s124,
              top: AppSize.s106,
              child: GestureDetector(
                onTap: () {},
                child: SvgPicture.asset(
                  AssetsManager.searchIcon,
                ),
              ),
            ),
            Positioned(
              top: AppSize.s105,
              left: AppSize.s90,
              height: AppSize.s19_5,
              width: AppSize.s21_4,
              child: GestureDetector(
                onTap: () {},
                child: Stack(
                  alignment: AlignmentDirectional.bottomStart,
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: SvgPicture.asset(
                        AssetsManager.messageIcon,
                      ),
                    ),
                    Positioned(
                      height: AppSize.s7,
                      width: AppSize.s7,
                      right: AppSize.s3,
                      bottom: AppSize.s0_5,
                      child: Container(
                        decoration: BoxDecoration(
                          color: ColorManager.secondary,
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: ColorManager.secondary,
                            width: 1,
                            style: BorderStyle.solid,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: AppSize.s103,
              left: AppSize.s55,
              height: AppSize.s19_5,
              width: AppSize.s20_3,
              child: GestureDetector(
                onTap: () {},
                child: Stack(
                  children: [
                    SvgPicture.asset(
                      AssetsManager.notificationIcon,
                    ),
                    Positioned(
                      height: AppSize.s7,
                      width: AppSize.s7,
                      child: Container(
                        decoration: BoxDecoration(
                          color: ColorManager.secondary,
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: ColorManager.secondary,
                            width: 1,
                            style: BorderStyle.solid,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: AppSize.s96,
              left: AppSize.s10,
              height: AppSize.s37,
              width: AppSize.s37,
              child: Container(
                decoration: BoxDecoration(
                  color: ColorManager.white,
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: ColorManager.grey,
                    width: 1,
                    style: BorderStyle.solid,
                  ),
                ),
              ),
            ),
          ],
        ),
      );


  Expanded _body() => const Expanded(
        child: TabBarView(
          physics: NeverScrollableScrollPhysics(),
          children: [
            MainScreen(),
            FindLawyerScreen(),
            BrowseOrderScreen(),
          ],
        ),
      );
  MainBottomNavBar _tapBar() => const MainBottomNavBar() ;

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
                        context.read<LayoutCubit>().changeNavIndex(index);
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            bottomNavIcons[index],
                            color: context.read<LayoutCubit>().navSelectedIndex ==
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

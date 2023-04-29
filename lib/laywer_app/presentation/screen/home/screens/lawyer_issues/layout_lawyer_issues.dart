import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hokok/laywer_app/presentation/screen/home/screens/lawyer_issues/lawyer_offers_screen.dart';
import 'package:hokok/presentation/blocs/profile_bloc/profile_bloc.dart';
import 'package:hokok/presentation/blocs/profile_bloc/profile_helper.dart';
import 'package:hokok/presentation/blocs/profile_bloc/profile_states.dart';

import '../../../../../../core/assets_manager.dart';
import '../../../../../../core/color_manager.dart';
import '../../../../../../core/constants_manager.dart';
import '../../../../../../core/font_manager.dart';
import '../../../../../../core/routes_manager.dart';
import '../../../../../../core/values_manager.dart';
import '../../component/block/main_cubit_lawyer.dart';
import '../../component/block/main_states_lawyer.dart';
import 'lawyer_issues_screen.dart';
import 'orders_screen.dart';

class LayoutLawyerIssues extends StatefulWidget {
  const LayoutLawyerIssues({Key? key}) : super(key: key);

  @override
  State<LayoutLawyerIssues> createState() => _LayoutLawyerIssuesState();
}

class _LayoutLawyerIssuesState extends State<LayoutLawyerIssues> {
  @override
  void initState() {
    ProfileHelper.instance().getLawyerProfileAction(context);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      initialIndex: 0, //optional, starts from 0, select the tab by default
      child: Scaffold(
        body: Column(
          children: [
            _appBar(context),
            SizedBox(
              height: 10.h,
            ),
            _tabsBar(),
            _body(),
          ],
        ),
      ),
    );
  }
}

Container _appBar(BuildContext context) => Container(
  width: double.infinity,
  height: AppSize.s234,
  color: ColorManager.primary,
  padding: EdgeInsets.only(top: 10.h,left: 5.w),
  child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Image(
        image: const AssetImage(
          AssetsManager.logo,
        ),
        width: 200.w,
        fit: BoxFit.cover,
      ),
      Row(
        children: [
          InkWell(
            onTap: () {
              Navigator.of(context).push(
                RouteGenerator.getRoute(
                  const RouteSettings(name: Routes.notificatiosLawyersScreen),
                ),
              );
            },
            child: Icon(
              Icons.notifications,
              color: ColorManager.thirdy,
              size: 30.sp,
            ),
          ),
          SizedBox(width: 10.w,),
          BlocConsumer<ProfileBloc, ProfileStates>(
            listener: (context, state) {
              if (state is ProfileFailedState) {
                state.authErrorMessage(context, state.error);
              }
            },
            builder: (context, state) {
              if (state is ProfileLoadedState) {
                return UserPorfileWidget(state: state.userEntity!);
              } else if (state is ProfileFailedState) {
                return  const UserPorfileWidget(state: null);
              } else if (state is ProfileLoadingState) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              return Container();
            },
          ),

        ],
      ),

    ],
  ),
);

BlocBuilder _tabsBar() => BlocBuilder<MainLawyerCubit, MainLawyerState>(
      builder: (context, state) {
        var cubit = context.read<MainLawyerCubit>();
        return StatefulBuilder(
          builder: (context,state) {
            return TabBar(
              onTap: (index) {
                state((){
                  cubit.changeNav2Index(index);
                });
              },
              labelPadding: const EdgeInsets.symmetric(horizontal: AppPadding.p22),
              splashBorderRadius: BorderRadius.circular(AppSize.s12),
              splashFactory: InkSplash.splashFactory,
              indicatorPadding: EdgeInsets.zero,
              labelStyle: const TextStyle(
                fontWeight: FontWeightManager.w400,
                fontFamily: FontConstants.fontFamily,
              ),
              isScrollable: true,
              padding: EdgeInsets.zero,
              dividerColor: Colors.transparent,
              labelColor: ColorManager.primary,
              unselectedLabelColor: ColorManager.secondary,
              indicatorColor: Colors.transparent,
              indicatorSize: TabBarIndicatorSize.label,
              tabs: [
                _tab(cubit.currentIndex1, 0, "القضايا"),
                _tab(cubit.currentIndex1, 1, "طلباتى"),
                _tab(cubit.currentIndex1, 2, "العروض"),
              ],
            );
          }
        );
      },
    );
Expanded _body() => const Expanded(
      child: TabBarView(
        physics: NeverScrollableScrollPhysics(),
        children: [
          OrderLawyerScreen(),
          LawyerIssuesScreen(),
          LawyerOffersScreen(),
        ],
      ),
    );
Stack _tab(int index, int count, String text) => Stack(
      alignment: AlignmentDirectional.topCenter,
      children: [
        AnimatedCrossFade(
          firstChild: const SizedBox(),
          secondChild: Container(
            decoration: BoxDecoration(
                color: ColorManager.secondary,
                borderRadius: BorderRadius.circular(AppSize.s40)),
            width: AppSize.s37,
            height: AppSize.s4,
            padding: EdgeInsets.zero,
          ),
          crossFadeState: index == count
              ? CrossFadeState.showSecond
              : CrossFadeState.showFirst,
          duration: const Duration(milliseconds: AppConstants.lineAnimationTime),
        ),
        Tab(
          text: text,
        ),
      ],
    );

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/assets_manager.dart';
import '../../../../../../core/color_manager.dart';
import '../../../../../../core/components/appbar_comp/app_bar_comp.dart';
import '../../../../../../core/components/appbar_comp/app_bar_widget.dart';
import '../../../../../../core/constants_manager.dart';
import '../../../../../../core/font_manager.dart';
import '../../../../../../core/routes_manager.dart';
import '../../../../../../core/values_manager.dart';
import '../../component/block/main_cubit_lawyer.dart';
import '../../component/block/main_states_lawyer.dart';
import 'lawyer_issues_screen.dart';
import 'orders_screen.dart';

class LayoutLawyerIssues extends StatelessWidget {
  const LayoutLawyerIssues({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
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
      height: 180.h,
      color: ColorManager.primary,
      child: AppBarComp(
        onTap: () {
          Navigator.of(context).push(
            RouteGenerator.getRoute(
              const RouteSettings(name: Routes.notificatiosLawyersScreen),
            ),
          );
        },
        icon: Icon(
          Icons.notifications,
          color: ColorManager.thirdy,
          size: 30.sp,
        ),
      ),
    );

BlocBuilder _tabsBar() => BlocBuilder<MainLawyerCubit, MainLawyerState>(
      builder: (context, state) {
        var cubit = context.read<MainLawyerCubit>();
        return TabBar(
          onTap: (index) {
            cubit.changeNav2Index(index);
          },
          labelPadding: EdgeInsets.symmetric(horizontal: AppPadding.p22),
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
          tabs: [
            _tab(cubit.currentIndex, 0, "القضايا"),
            _tab(cubit.currentIndex, 1, "طلباتى"),
          ],
        );
      },
    );
Expanded _body() => Expanded(
      child: TabBarView(
        physics: NeverScrollableScrollPhysics(),
        children: [
          OrderLawyerScreen(),
          LawyerIssuesScreen(),
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
          duration: Duration(milliseconds: AppConstants.lineAnimationTime),
        ),
        Tab(
          text: text,
        ),
      ],
    );

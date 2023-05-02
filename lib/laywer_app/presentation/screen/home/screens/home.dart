import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hokok/core/assets_manager.dart';
import 'package:hokok/core/debug_prints.dart';
import 'package:hokok/core/font_manager.dart';
import 'package:hokok/core/routes_manager.dart';
import 'package:hokok/laywer_app/presentation/screen/home/screens/lawyer_issues/orders_screen.dart';
import 'package:hokok/presentation/blocs/lawyer_bloc/lawyer_bloc.dart';
import 'package:hokok/presentation/blocs/lawyer_bloc/lawyer_helper.dart';
import 'package:hokok/presentation/blocs/lawyer_bloc/lawyer_states.dart';
import 'package:hokok/presentation/blocs/profile_bloc/profile_bloc.dart';
import 'package:hokok/presentation/blocs/profile_bloc/profile_helper.dart';
import 'package:hokok/presentation/blocs/profile_bloc/profile_states.dart';
import '../../../../../core/color_manager.dart';
import '../../../../../core/components/appbar_comp/app_bar_comp.dart';
import '../../../../../core/values_manager.dart';

class HomeLawyerScreen extends StatefulWidget {
  const HomeLawyerScreen({Key? key}) : super(key: key);

  @override
  State<HomeLawyerScreen> createState() => _HomeLawyerScreenState();
}

class _HomeLawyerScreenState extends State<HomeLawyerScreen> {
  @override
  void initState() {
    LawyerHelper.instance().onGetAllLawyerStatistics(context);
    ProfileHelper.instance().getLawyerProfileAction(context);
    super.initState();
  }

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  Map<String, dynamic> statistics = {
    "data": {
      "number_of_published_orders": 0,
      "all_budget": 0,
      "number_of_clients": 0,
    },
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _appBar(context),
          BlocConsumer<LawyersBloc, LawyerStates>(listener: (context, state) {
            if (state is StatisticsLawyersLoadedState) {
              statistics = state.statistics;
            }
          }, builder: (context, state) {
            if (state is LawyerFailedLoadedState) {
              statistics;
            } else if (state is LawyersLoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return Expanded(
                child: ListView.builder(
              padding: EdgeInsets.only(top: 20.h),
              itemCount: 3,
              itemBuilder: (context, index) {
                String value = '';
                String title = "";
                String image = '';
                if (index == 0) {
                  value = statistics["data"]["number_of_clients"].toString();
                  title = "عدد المستخدمين";
                  image = AssetsManager.userNumber;
                } else if (index == 1) {
                  value = statistics["data"]["number_of_published_orders"]
                      .toString();
                  title = "القضايا المتاحة";
                  image = AssetsManager.issueNumber;
                } else if (index == 2) {
                  value = statistics["data"]["all_budget"].toString();
                  title = "اتعاب القضايا";
                  image = AssetsManager.issueFees;
                }
                return StatisticsLawyerView(
                    title: title, statistic: value, image: image);
              },
            ));
          }),
        ],
      ),
    );
  }

  Container _appBar(BuildContext context) => Container(
        width: double.infinity,
        height: AppSize.s234,
        color: ColorManager.primary,
        padding: EdgeInsets.only(top: 10.h, left: 5.w),
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
                        const RouteSettings(
                            name: Routes.notificatiosLawyersScreen),
                      ),
                    );
                  },
                  child: Icon(
                    Icons.notifications,
                    color: ColorManager.thirdy,
                    size: 30.sp,
                  ),
                ),
                SizedBox(
                  width: 10.w,
                ),
                BlocConsumer<ProfileBloc, ProfileStates>(
                  listener: (context, state) {
                    if (state is ProfileFailedState) {
                      printError("the profile model error => ${state.error}");
                      //state.authErrorMessage(context, state.error);
                    }
                  },
                  builder: (context, state) {
                    if (state is LawyerProfileLoadedState) {
                      return UserPorfileWidget(state: state.userEntity!);
                    } else if (state is ProfileFailedState) {
                      return const UserPorfileWidget(state: null);
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
}

class RowItems extends StatelessWidget {
  const RowItems({
    required this.title,
    required this.icon,
    super.key,
  });
  final IconData? icon;
  final String? title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          size: 14,
          icon,
          color: Colors.grey,
        ),
        const SizedBox(
          width: 4,
        ),
        Text(
          title.toString(),
          style: const TextStyle(
            fontFamily: FontConstants.fontFamily,
            color: Colors.grey,
            fontSize: 11,
          ),
        )
      ],
    );
  }
}

class StatisticsLawyerView extends StatelessWidget {
  const StatisticsLawyerView({
    required this.title,
    required this.statistic,
    required this.image,
    super.key,
  });

  final String title;
  final String statistic;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.w,
      height: 100.h,
      margin: EdgeInsets.only(
        top: 10.sp,
        left: 30.w,
        right: 30.w,
        bottom: 10.h,
      ),
      padding: EdgeInsets.all(5.sp),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.sp),
        border: Border.all(color: Colors.grey, width: 1),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image(
            image: AssetImage(
              image,
            ),
            width: 70.w,
            height: 50.h,
          ),
          SizedBox(
            height: 10.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 11.sp,
                  fontFamily: FontConstants.fontFamily,
                  fontWeight: FontWeight.bold,
                  color: ColorManager.primary,
                ),
              ),
              Text(
                statistic.toString(),
                style: TextStyle(
                  fontSize: 18.sp,
                  fontFamily: FontConstants.fontFamily,
                  fontWeight: FontWeight.bold,
                  color: ColorManager.thirdy,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

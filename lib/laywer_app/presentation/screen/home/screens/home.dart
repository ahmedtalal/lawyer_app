import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hokok/core/routes_manager.dart';
import 'package:hokok/domain/entities/public_order_entity.dart';
import 'package:hokok/presentation/blocs/major_bloc/major_helper.dart';
import 'package:hokok/presentation/blocs/order_bloc/order_helper.dart';
import 'package:hokok/presentation/blocs/profile_bloc/profile_helper.dart';
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
    ProfileHelper.instance().getLawyerProfileAction(context);
    OrderHelper.instance().getPublicOrdersForLawyerAction(context);
    MajorHelper.instance().getMajorsActionCon(context);

    super.initState();
  }

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  static List<OrderInfoModel> publicOrders = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _appBar(context),
          const SizedBox(
            height: 30,
          ),
        ],
      ),
    );
  }


  Container _appBar(BuildContext context) => Container(
        width: double.infinity,
        height: AppSize.s234,
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
}


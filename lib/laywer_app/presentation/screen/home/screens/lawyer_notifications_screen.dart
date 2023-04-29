import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hokok/config/screen_handler.dart';
import 'package:hokok/core/assets_manager.dart';
import 'package:hokok/core/color_manager.dart';
import 'package:hokok/core/shared_widget/empty_data_shared_widget.dart';
import 'package:hokok/domain/entities/private_order_for_lawyer_entity.dart';
import 'package:hokok/laywer_app/presentation/screen/home/screens/home.dart';
import 'package:hokok/presentation/blocs/order_bloc/order_bloc.dart';
import 'package:hokok/presentation/blocs/order_bloc/order_helper.dart';
import 'package:hokok/presentation/blocs/order_bloc/order_states.dart';

import '../../../../../core/font_manager.dart';

class NotificationsLawyerScreen extends StatefulWidget {
  const NotificationsLawyerScreen({super.key});

  @override
  State<NotificationsLawyerScreen> createState() =>
      _NotificationsLawyerScreenState();
}

class _NotificationsLawyerScreenState extends State<NotificationsLawyerScreen> {
  @override
  void initState() {
    OrderHelper.instance().getPrivateOrdersForLawyerAction(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: ScreenHandler.getScreenHeight(context),
        width: ScreenHandler.getScreenWidth(context),
        child: Column(
          children: [
            _appBar(context),
            SizedBox(
              height: 15.h,
            ),
            BlocConsumer<OrderBloc, OrderStates>(listener: (context, state) {
              if (state is PrivateOrderFailedLoadedState) {
                state.authErrorMessage(context, state.error);
              }
            }, builder: (context, state) {
              if (state is PrivateOrderLoadedState) {
                return Expanded(
                  child: ListView.builder(
                    padding: EdgeInsets.only(top: 15.h),
                    itemCount: state.privateOrders!.length,
                    itemBuilder: (context, index) {
                      return PrivateOrderView(
                          order: state.privateOrders![index]);
                    },
                  ),
                );
              } else if (state is OrderLoadingState) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is PrivateOrderFailedLoadedState) {
                return emptyDataSharedWidget();
              }
              return Container();
            }),
          ],
        ),
      ),
    );
  }
}

Container _appBar(BuildContext context) => Container(
      width: double.infinity,
      height: 170.h,
      color: ColorManager.primary,
      padding: EdgeInsets.only(top: 15.h,left: 20.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image(
            image: const AssetImage(
              AssetsManager.logo,
            ),
            width: 200.w,
            height: 100.h,
            fit: BoxFit.cover,
          ),
          SizedBox(width: 60.w,),
          InkWell(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Directionality(
              textDirection: TextDirection.ltr,
              child: Icon(
                Icons.arrow_back_ios,
                color: ColorManager.thirdy,
                size: 30.sp,
              ),
            ),
          ),

        ],
      ),
    );

class PrivateOrderView extends StatelessWidget {
  const PrivateOrderView({
    required this.order,
    super.key,
  });
  final PrivateOrdersInfoModel order;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90.h,
      width: double.maxFinite,
      margin: const EdgeInsets.only(bottom: 5, right: 5, left: 5),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.orangeAccent, width: .8),
        ),
      ),
      child: ListTile(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              order!.title.toString(),
              style: const TextStyle(
                fontSize: 20,
                fontFamily: FontConstants.fontFamily,
                color: Colors.orange,
                fontWeight: FontWeight.w500,
              ),
            ),
            InkWell(
              onTap: () {},
              child: const Directionality(
                textDirection: TextDirection.ltr,
                child: Icon(
                  Icons.arrow_back_ios,
                  size: 15,
                  color: Colors.grey,
                ),
              ),
            ),
          ],
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              children: [
                RowItems(
                  icon: Icons.hourglass_empty,
                  title: order.createdAt.toString(),
                ),
                const SizedBox(
                  width: 8,
                ),
                RowItems(
                  icon: Icons.bookmark_border,
                  title: "${order!.requests} عروض",
                ),
                const SizedBox(
                  width: 8,
                ),
              ],
            ),
            SizedBox(
              height: 15.h,
            ),
            Text(
              order!.description.toString(),
              style: const TextStyle(
                fontFamily: FontConstants.fontFamily,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hokok/config/screen_handler.dart';
import 'package:hokok/core/assets_manager.dart';
import 'package:hokok/core/color_manager.dart';
import 'package:hokok/core/components/appbar_comp/app_bar_widget.dart';
import 'package:hokok/core/shared_widget/empty_data_shared_widget.dart';
import 'package:hokok/core/values_manager.dart';
import 'package:hokok/domain/entities/requests_order_for_lawyer_entity.dart';
import 'package:hokok/laywer_app/presentation/screen/home/screens/home.dart';
import 'package:hokok/presentation/blocs/order_bloc/order_bloc.dart';
import 'package:hokok/presentation/blocs/order_bloc/order_helper.dart';
import 'package:hokok/presentation/blocs/order_bloc/order_states.dart';

import '../../../../../core/font_manager.dart';
import '../../../../../presentation/screen/browse_order/browse_order_screen.dart';

class NotificationsLawyerScreen extends StatefulWidget {
  const NotificationsLawyerScreen({super.key});

  @override
  State<NotificationsLawyerScreen> createState() =>
      _NotificationsLawyerScreenState();
}

class _NotificationsLawyerScreenState extends State<NotificationsLawyerScreen> {
  @override
  void initState() {
    OrderHelper.instance().getRequestOrdersForLawyerAction(context);
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
              if (state is OrderFailedLoadedState) {
                state.authErrorMessage(context, state.error);
              }
            }, builder: (context, state) {
              if (state is RequestOrderLoadedState) {
                return Expanded(
                  child: ListView.builder(
                    padding: EdgeInsets.only(top: 15.h),
                    itemCount: state.requestOrders!.length,
                    itemBuilder: (context, index) {
                      return RequestOrderView(
                          order: state.requestOrders![index]);
                    },
                  ),
                );
              } else if (state is OrderLoadingState) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is OrderFailedLoadedState) {
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
      child: AppBarWidget(
        onClick: () {
          Navigator.of(context).pop();
        },
        icon: Directionality(
          textDirection: TextDirection.ltr,
          child: Icon(
            Icons.arrow_back_ios,
            color: ColorManager.thirdy,
            size: 30.sp,
          ),
        ),
        child: Image(
          image: const AssetImage(
            AssetsManager.logo,
          ),
          width: 180.w,
          height: 100.h,
        ),
      ),
    );

class RequestOrderView extends StatelessWidget {
  const RequestOrderView({
    required this.order,
    super.key,
  });
  final RequestsLawyerOrderInfo order;
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
              order.order!.title.toString(),
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
                  title: "${order.order!.requests} عروض",
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
              order.order!.description.toString(),
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

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hokok/config/screen_handler.dart';
import 'package:hokok/core/color_manager.dart';
import 'package:hokok/core/debug_prints.dart';
import 'package:hokok/core/font_manager.dart';
import 'package:hokok/data/models/own_orders_for_lawyer_model.dart';
import 'package:hokok/domain/entities/requests_order_for_lawyer_entity.dart';
import 'package:hokok/presentation/blocs/order_bloc/order_bloc.dart';
import 'package:hokok/presentation/blocs/order_bloc/order_helper.dart';
import 'package:hokok/presentation/blocs/order_bloc/order_states.dart';

import '../../../../../../core/routes_manager.dart';

class LawyerIssuesScreen extends StatefulWidget {
  const LawyerIssuesScreen({super.key});

  @override
  State<LawyerIssuesScreen> createState() => _LawyerIssuesScreenState();
}

class _LawyerIssuesScreenState extends State<LawyerIssuesScreen> {
  @override
  void initState() {
    OrderHelper.instance().getOwnOrdersForLawyerAction(context);
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
          children: const [
            Expanded(
              flex: 3,
              child: _BodyWidget(),
            ),
          ],
        ),
      ),
    );
  }
}

class _BodyWidget extends StatelessWidget {
  const _BodyWidget({
    super.key,
  });
  static List<OwnOrdersInfoModel> ownOrders = [];
  static List<RequestsLawyerOrderInfo> requestOrders = [];
  @override
  Widget build(BuildContext context) {
    OrderHelper.instance().publishedDateFormat("2023/3/4 03:31:42");
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "القضايا الحالية",
          style: TextStyle(
            fontSize: 23.sp,
            fontFamily: FontConstants.fontFamily,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(
          height: 8.h,
        ),
        const _TableColumnsWidget(),
        Expanded(
          child:
              BlocConsumer<OrderBloc, OrderStates>(listener: (context, state) {
            if (state is OwnOrderFailedLoadedState) {
              // state.authErrorMessage(context, state.error);
            } else if (state is RequesrOrderFailedLoadedState) {
              //state.authErrorMessage(context, state.error);
            } else if (state is OwnOrderLoadedState) {
              ownOrders = state.ownOrdes!;
              printInfo("The get own orders ${ownOrders.length}");
            } else if (state is RequestOrderLoadedState) {
              requestOrders = state.requestOrders!;
            }
          }, builder: (context, state) {
            if (state is OrderLoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is OwnOrderFailedLoadedState) {
              return _issuesContainer(
                orders: ownOrders,
                requestOrders: requestOrders,
              );
            } else if (state is RequesrOrderFailedLoadedState) {
              return _issuesContainer(
                orders: ownOrders,
                requestOrders: requestOrders,
              );
            }
            return _issuesContainer(
              orders: ownOrders,
              requestOrders: requestOrders,
            );
          }),
        )
      ],
    );
  }
}

Widget _issuesContainer({
  required List<OwnOrdersInfoModel> orders,
  required List<RequestsLawyerOrderInfo> requestOrders,
}) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      SizedBox(
        height: 15.h,
      ),
      Align(
        alignment: Alignment.topRight,
        child: Container(
          height: 35.h,
          width: 85.w,
          alignment: Alignment.centerRight,
          padding: EdgeInsets.only(right: 3.w),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.sp),
              bottomLeft: Radius.circular(
                20.sp,
              ),
            ),
            color: ColorManager.thirdy,
          ),
          child: Text(
            "طلباتي",
            style: TextStyle(
              fontSize: 14.sp,
              fontFamily: FontConstants.fontFamily,
              color: Colors.white,
            ),
          ),
        ),
      ),
      Expanded(
        child: OrderHelper.instance().getAllMyOrders(requestOrders).isEmpty
            ? Center(
                child: Text(
                  "لا يوجد بيانات",
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontFamily: FontConstants.fontFamily,
                    color: Colors.grey[400],
                  ),
                ),
              )
            : ListView.builder(
                padding: EdgeInsets.only(top: 10.h),
                itemCount:
                    OrderHelper.instance().getAllMyOrders(requestOrders).length,
                itemBuilder: (context, index) {
                  return _LawyerMyOrdersViewWidget(
                    order: OrderHelper.instance()
                        .getAllMyOrders(requestOrders)[index],
                  );
                },
              ),
      ),
      Align(
        alignment: Alignment.topRight,
        child: Container(
          height: 35.h,
          width: 85.w,
          alignment: Alignment.centerRight,
          padding: EdgeInsets.only(right: 3.w),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.sp),
              bottomLeft: Radius.circular(
                20.sp,
              ),
            ),
            color: ColorManager.thirdy,
          ),
          child: Text(
            "قيد التنفيذ",
            style: TextStyle(
              fontSize: 14.sp,
              fontFamily: FontConstants.fontFamily,
              color: Colors.white,
            ),
          ),
        ),
      ),
      Expanded(
        child: OrderHelper.instance().getAllInProgressOrders(orders).isEmpty
            ? Center(
                child: Text(
                  "لا يوجد بيانات",
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontFamily: FontConstants.fontFamily,
                    color: Colors.grey[400],
                  ),
                ),
              )
            : ListView.builder(
                padding: EdgeInsets.only(top: 10.h),
                itemCount: OrderHelper.instance()
                    .getAllInProgressOrders(orders)
                    .length,
                itemBuilder: (context, index) {
                  return _LawyerIssuesViewWidget(
                    order: OrderHelper.instance()
                        .getAllInProgressOrders(orders)[index],
                  );
                },
              ),
      ),
      Align(
        alignment: Alignment.topRight,
        child: Container(
          height: 35.h,
          width: 85.w,
          alignment: Alignment.centerRight,
          padding: EdgeInsets.only(right: 3.w),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.sp),
              bottomLeft: Radius.circular(
                20.sp,
              ),
            ),
            color: ColorManager.thirdy,
          ),
          child: Text(
            "المنجز",
            style: TextStyle(
              fontSize: 14.sp,
              fontFamily: FontConstants.fontFamily,
              color: Colors.white,
            ),
          ),
        ),
      ),
      Expanded(
        child: OrderHelper.instance().getAllCompletedOrders(orders).isEmpty
            ? Center(
                child: Text(
                  "لا يوجد بيانات",
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontFamily: FontConstants.fontFamily,
                    color: Colors.grey[400],
                  ),
                ),
              )
            : ListView.builder(
                padding: EdgeInsets.only(top: 10.h),
                itemCount:
                    OrderHelper.instance().getAllCompletedOrders(orders).length,
                itemBuilder: (context, index) {
                  return _LawyerIssuesViewWidget(
                    order: OrderHelper.instance()
                        .getAllCompletedOrders(orders)[index],
                  );
                },
              ),
      ),
    ],
  );
}

class _TableColumnsWidget extends StatelessWidget {
  const _TableColumnsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenHandler.getScreenHeight(context),
      height: 40.h,
      padding: EdgeInsets.only(
        left: 20.w,
        right: 20.w,
      ),
      decoration: BoxDecoration(
        color: Colors.grey[300],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "اسم الطلب",
            style: TextStyle(
              fontSize: 13.sp,
              fontFamily: FontConstants.fontFamily,
            ),
          ),
          Text(
            "تاريخ النشر",
            style: TextStyle(
              fontSize: 13.sp,
              fontFamily: FontConstants.fontFamily,
            ),
          ),
          Text(
            "موعد الإنتهاء",
            style: TextStyle(
              fontSize: 13.sp,
              fontFamily: FontConstants.fontFamily,
            ),
          ),
        ],
      ),
    );
  }
}

class _LawyerIssuesViewWidget extends StatelessWidget {
  const _LawyerIssuesViewWidget({
    required this.order,
    super.key,
  });
  final OwnOrdersInfoModel order;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenHandler.getScreenHeight(context),
      height: 40.h,
      padding: EdgeInsets.only(
        left: 8.w,
        right: 8.w,
      ),
      margin: EdgeInsets.only(
        bottom: 10.h,
        right: 5.w,
      ),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(25),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            order.title!,
            style: TextStyle(
              fontSize: 12.sp,
              fontFamily: FontConstants.fontFamily,
            ),
          ),
          Text(
            OrderHelper.instance()
                .publishedDateFormat(order.assignedToLawyerAt!),
            style: TextStyle(
              fontSize: 12.sp,
              fontFamily: FontConstants.fontFamily,
            ),
          ),
          Row(
            children: [
              Text(
                OrderHelper.instance().setCLientExpectedDate(
                    order.clientExpectedDate!.toString()),
                style: TextStyle(
                  fontSize: 12.sp,
                  fontFamily: FontConstants.fontFamily,
                ),
              ),
              SizedBox(
                width: 5.w,
              ),
              Directionality(
                textDirection: TextDirection.ltr,
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                      RouteGenerator.getRoute(
                        RouteSettings(
                          name: Routes.lawyerOwnOrderDetailsScreen,
                          arguments: order,
                        ),
                      ),
                    );
                  },
                  child: Icon(
                    Icons.arrow_back,
                    size: 20.sp,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _LawyerMyOrdersViewWidget extends StatelessWidget {
  const _LawyerMyOrdersViewWidget({
    required this.order,
    super.key,
  });
  final RequestsLawyerOrderInfo order;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenHandler.getScreenHeight(context),
      height: 40.h,
      padding: EdgeInsets.only(
        left: 8.w,
        right: 8.w,
      ),
      margin: EdgeInsets.only(
        bottom: 10.h,
        right: 5.w,
      ),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(25),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            order.order!.title!,
            style: TextStyle(
              fontSize: 12.sp,
              fontFamily: FontConstants.fontFamily,
            ),
          ),
          Text(
            "${order.order!.createdAt}",
            style: TextStyle(
              fontSize: 12.sp,
              fontFamily: FontConstants.fontFamily,
            ),
          ),
          Row(
            children: [
              Text(
                "بعد ${order.expectedDays} يوما ",
                style: TextStyle(
                  fontSize: 12.sp,
                  fontFamily: FontConstants.fontFamily,
                ),
              ),
              SizedBox(
                width: 5.w,
              ),
              Directionality(
                textDirection: TextDirection.ltr,
                child: InkWell(
                  onTap: () {
                    // Navigator.of(context).push(
                    //   RouteGenerator.getRoute(
                    //     RouteSettings(
                    //       name: Routes.lawyerOwnOrderDetailsScreen,
                    //       arguments: order,
                    //     ),
                    //   ),
                    // );
                  },
                  child: Icon(
                    Icons.arrow_back,
                    size: 20.sp,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

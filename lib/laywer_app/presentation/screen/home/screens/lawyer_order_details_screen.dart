import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hokok/config/screen_handler.dart';
import 'package:hokok/core/color_manager.dart';
import 'package:hokok/core/components/appbar_comp/app_bar_widget.dart';
import 'package:hokok/core/font_manager.dart';
import 'package:hokok/core/routes_manager.dart';
import 'package:hokok/domain/entities/public_order_entity.dart';

import '../../../../../core/values_manager.dart';

class LaweyrOrderDetailsScreen extends StatefulWidget {
  const LaweyrOrderDetailsScreen({required this.order, super.key});
  final OrderInfoModel? order;
  @override
  State<LaweyrOrderDetailsScreen> createState() =>
      _LaweyrOrderDetailsScreenState();
}

class _LaweyrOrderDetailsScreenState extends State<LaweyrOrderDetailsScreen> {
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
            _AppbarWidget(order: widget.order!),
            SizedBox(
              height: 30.h,
            ),
            _BodyWidget(
              order: widget.order!.city!,
              title: "البلد",
            ),
            SizedBox(
              height: 20.h,
            ),
            _BodyWidget(
              order: widget.order!.major,
              title: "التصنيف",
            ),
            SizedBox(
              height: 20.h,
            ),
            _BodyWidget(
              order: widget.order!.requests.toString(),
              title: "عدد المحامين",
            ),
            SizedBox(
              height: 40.h,
            ),
            Container(
              height: 40.h,
              width: 130.w,
              alignment: Alignment.centerRight,
              padding: EdgeInsets.all(5.sp),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.sp),
                  bottomLeft: Radius.circular(
                    20.sp,
                  ),
                ),
                color: ColorManager.primary,
              ),
              child: Text(
                "التفاصيل",
                style: TextStyle(
                  fontSize: 17.sp,
                  fontFamily: FontConstants.fontFamily,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(
              height: 18.h,
            ),
            Align(
              alignment: Alignment.center,
              child: Container(
                height: 130.h,
                width: 230.w,
                padding: EdgeInsets.only(
                  top: 20.sp,
                  right: 20.sp,
                  left: 10.sp,
                ),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 2),
                  borderRadius: BorderRadius.circular(20),
                ),
                alignment: Alignment.topRight,
                child: Text(
                  widget.order!.description!,
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontFamily: FontConstants.fontFamily,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Align(
              alignment: Alignment.center,
              child: InkWell(
                onTap: () {
                  Navigator.of(context).push(
                    RouteGenerator.getRoute(
                      RouteSettings(
                        name: Routes.lawyerSendRequesrScreen,
                        arguments: widget.order,
                      ),
                    ),
                  );
                },
                child: Container(
                  height: 30.h,
                  width: 130.w,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: ColorManager.fourth,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    "تقديم الطلب",
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontFamily: FontConstants.fontFamily,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _AppbarWidget extends StatelessWidget {
  const _AppbarWidget({
    super.key,
    required this.order,
  });

  final OrderInfoModel order;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: AppSize.s234,
      color: ColorManager.primary,
      padding: EdgeInsets.only(left: 10.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 30.h,),
              Text(
                order.title!,
                style: TextStyle(
                  fontSize: 25.sp,
                  fontFamily: FontConstants.fontFamily,
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Container(
                width: 120.w,
                height: 20.h,
                padding: EdgeInsets.all(3.sp),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: ColorManager.fourth,
                ),
                child: Text(
                  order.createdAt!,
                  style: TextStyle(
                    fontFamily: FontConstants.fontFamily,
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(
                height: 30.h,
              ),
            ],
          ),
          SizedBox(width: 100.w,),
          InkWell(
            onTap: () {
              Navigator.of(context).pop();

            },
            child: Icon(
              Icons.home,
              size: 32.h,
              color: Colors.black45,
            ),
          ),
        ],
      ),
    );
  }
}

class _BodyWidget extends StatelessWidget {
  const _BodyWidget({required this.order, required this.title, super.key});
  final String? order;
  final String? title;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 10.w),
      width: 220.w,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              title.toString(),
              style: TextStyle(
                fontSize: 14.sp,
                fontFamily: FontConstants.fontFamily,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          SizedBox(
            width: 40.w,
          ),
          Expanded(
            child: Container(
              height: 30.h,
              width: 110.w,
              decoration: BoxDecoration(
                color: ColorManager.primary,
                borderRadius: BorderRadius.circular(10),
              ),
              alignment: Alignment.center,
              child: Text(
                order!,
                style: TextStyle(
                  fontSize: 11.sp,
                  fontFamily: FontConstants.fontFamily,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

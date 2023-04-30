import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../config/screen_handler.dart';
import '../../../core/color_manager.dart';
import '../../../core/font_manager.dart';
import '../../../core/routes_manager.dart';
import '../../../core/values_manager.dart';
import '../../blocs/order_bloc/order_helper.dart';

class OrderDetailsScreen extends StatefulWidget {
  final int id;
  final String title;
  final String createdAt;
  final int requests;
  final String major;
  final String subMajor;
  final String description;
  const OrderDetailsScreen(
      {Key? key,
      required this.id,
      required this.title,
      required this.createdAt,
        required this.requests,
        required this.major,
      required this.subMajor,
      required this.description})
      : super(key: key);

  @override
  State<OrderDetailsScreen> createState() => _OrderDetailsScreenState();
}

class _OrderDetailsScreenState extends State<OrderDetailsScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: SizedBox(
            height: ScreenHandler.getScreenHeight(context),
            width: ScreenHandler.getScreenWidth(context),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _AppbarWidget(title: widget.title , createdAt: widget.createdAt),
                SizedBox(
                  height: 30.h,
                ),
                 _BodyWidget(
                  order: widget.major.toString(),
                  title: "البلد",
                ),
                SizedBox(
                  height: 20.h,
                ),
                 _BodyWidget(
                  order: widget.subMajor.toString(),
                  title: "التصنيف",
                ),
                SizedBox(
                  height: 20.h,
                ),
                 _BodyWidget(
                  order: widget.requests.toString(),
                  title:  " عدد المحاميين",
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
                      widget.description,
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
                      OrderHelper.instance().orderId = widget.id;
                      Navigator.of(context).pushNamed(Routes.chooseLawyer);
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
                        "عروض المحامين",
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
        ),
      ),
    );
  }
}

class _AppbarWidget extends StatelessWidget {
  final String title;
  final String createdAt;
  const _AppbarWidget({
    super.key, required this.title, required this.createdAt,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: AppSize.s124,
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
              SizedBox(
                height: 10.h,
              ),
              Text(
                title,
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
                  createdAt,
                  style: TextStyle(
                    fontFamily: FontConstants.fontFamily,
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
            ],
          ),
          SizedBox(
            width: 100.w,
          ),
          InkWell(
            onTap: () {
              // Navigator.of(context).pop();
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

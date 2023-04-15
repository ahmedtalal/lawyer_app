import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hokok/config/screen_handler.dart';
import 'package:hokok/core/color_manager.dart';
import 'package:hokok/core/components/appbar_comp/app_bar_widget.dart';
import 'package:hokok/core/font_manager.dart';
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
            _AppbarWidget(widget: widget),
            SizedBox(
              height: 10.h,
            ),
            _BodyWidget(
              order: widget.order!.title!,
              title: "البلد",
            ),
            SizedBox(
              height: 13.h,
            ),
            _BodyWidget(
              order: widget.order!.major,
              title: "التصنيف",
            ),
            SizedBox(
              height: 13.h,
            ),
            _BodyWidget(
              order: widget.order!.createdAt,
              title: "التوقيت",
            ),
            SizedBox(
              height: 13.h,
            ),
            Container(
              height: 30.h,
              width: 100.w,
              alignment: Alignment.centerRight,
              padding: EdgeInsets.all(5.sp),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: ColorManager.primary,
              ),
              child: Text(
                "التفاصيل",
                style: TextStyle(
                  fontSize: 16.sp,
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
                width: 200.w,
                padding: EdgeInsets.all(10.sp),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 1),
                  borderRadius: BorderRadius.circular(16),
                ),
                alignment: Alignment.centerRight,
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
              height: 12.h,
            ),
            Align(
              alignment: Alignment.center,
              child: InkWell(
                onTap: () {},
                child: Container(
                  height: 30.h,
                  width: 120.w,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: ColorManager.fourth,
                    borderRadius: BorderRadius.circular(13),
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
    required this.widget,
  });

  final LaweyrOrderDetailsScreen widget;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: AppSize.s234,
      color: ColorManager.primary,
      child: AppBarWidget(
        onClick: () {
          Navigator.of(context).pop();
        },
        icon: Icon(
          Icons.home,
          size: 20.h,
          color: Colors.black45,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Spacer(),
            Text(
              widget.order!.title!,
              style: TextStyle(
                fontSize: 25.sp,
                fontFamily: FontConstants.fontFamily,
                fontWeight: FontWeight.w400,
                color: Colors.white,
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Container(
              width: 130.w,
              height: 20.h,
              padding: EdgeInsets.all(3.sp),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: ColorManager.fourth,
              ),
              child: Text(
                "نشط منذو نصف ساعه",
                style: TextStyle(
                  fontFamily: FontConstants.fontFamily,
                  fontSize: 8.sp,
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title.toString(),
              style: TextStyle(
                fontSize: 16.sp,
                fontFamily: FontConstants.fontFamily,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(
              width: 20.w,
            ),
            Container(
              height: 30.h,
              width: 70.w,
              decoration: BoxDecoration(
                color: ColorManager.primary,
                borderRadius: BorderRadius.circular(20),
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
          ],
        ),
      ],
    );
  }
}

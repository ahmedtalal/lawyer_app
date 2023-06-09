import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hokok/core/assets_manager.dart';
import 'package:hokok/core/font_manager.dart';

Widget emptyDataSharedWidget() {
  return Container(
    height: 300.h,
    width: double.maxFinite,
    padding: const EdgeInsets.all(10),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image(
          image: AssetImage(AssetsManager.emptyDataImage),
          width: double.maxFinite,
          height: 250,
          fit: BoxFit.cover,
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          "هناك خطاء ما",
          style: TextStyle(
            fontSize: 15.sp,
            fontFamily: FontConstants.fontFamily,
          ),
        ),
      ],
    ),
  );
}

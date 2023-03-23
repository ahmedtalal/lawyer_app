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
          height: 250.h,
          fit: BoxFit.cover,
        ),
        SizedBox(
          height: 10.h,
        ),
        Text(
          "there is no data",
          style: TextStyle(
            fontSize: 20.h,
            fontFamily: FontConstants.fontFamily,
          ),
        ),
      ],
    ),
  );
}

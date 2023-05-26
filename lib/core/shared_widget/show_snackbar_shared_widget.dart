import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hokok/core/font_manager.dart';

SnackBar showSnakBarWidget(
        BuildContext context, String title, Color backgroundColor) =>
    SnackBar(
      padding: const EdgeInsets.all(8),
      content: Container(
        alignment: Alignment.centerRight,
        height: 60,
        child: Text(
          title,
          textScaleFactor: 1.0,
          style: TextStyle(
            color: Colors.white,
            fontSize: 14.sp,
            fontFamily: FontConstants.fontFamily,
          ),
          textDirection: TextDirection.rtl,
        ),
      ),
      backgroundColor: backgroundColor,
      duration: const Duration(seconds: 2),
    );

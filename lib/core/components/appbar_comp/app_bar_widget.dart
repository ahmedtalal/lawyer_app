import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hokok/core/assets_manager.dart';
import 'package:hokok/core/color_manager.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({
    required this.onClick,
    required this.child,
    required this.icon,
    this.optionChild,
    super.key,
  });

  final void Function()? onClick;
  final Widget? child, icon, optionChild;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorManager.primary,
      padding: EdgeInsets.only(
        left: 10.w,
        top: 20.h,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Spacer(),
          optionChild == null ? Container() : optionChild!,
          SizedBox(
            width: 20.w,
          ),
          InkWell(
            onTap: onClick,
            child: icon,
          ),
          SizedBox(
            width: 12.w,
          ),
          child!,
        ],
      ),
    );
  }
}

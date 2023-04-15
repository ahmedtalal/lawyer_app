import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hokok/core/color_manager.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({
    required this.onClick,
    required this.child,
    required this.icon,
    super.key,
  });

  final void Function()? onClick;
  final Widget? child, icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorManager.primary,
      padding: EdgeInsets.only(
        left: 30.w,
        top: 20.h,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Spacer(),
          child!,
          const Spacer(),
          InkWell(
            onTap: onClick,
            child: icon,
          ),
        ],
      ),
    );
  }
}

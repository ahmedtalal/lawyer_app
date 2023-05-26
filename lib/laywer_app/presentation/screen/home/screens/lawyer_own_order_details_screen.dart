import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hokok/config/screen_handler.dart';
import 'package:hokok/core/assets_manager.dart';
import 'package:hokok/core/color_manager.dart';
import 'package:hokok/core/font_manager.dart';
import 'package:hokok/core/values_manager.dart';
import 'package:hokok/data/models/own_orders_for_lawyer_model.dart';

class LawyerOwnOrderDetailsScreen extends StatefulWidget {
  const LawyerOwnOrderDetailsScreen({required this.order, super.key});
  final OwnOrdersInfoModel order;
  @override
  State<LawyerOwnOrderDetailsScreen> createState() =>
      _LawyerOwnOrderDetailsScreenState();
}

class _LawyerOwnOrderDetailsScreenState
    extends State<LawyerOwnOrderDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: ScreenHandler.getScreenHeight(context),
        width: ScreenHandler.getScreenWidth(context),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _appBar(context),
              SizedBox(
                height: 20.h,
              ),
              _bodyWidget(order: widget.order, context: context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _bodyWidget(
      {required OwnOrdersInfoModel order, required BuildContext context}) {
    return Container(
      padding: EdgeInsets.only(top: 5.sp, right: 5.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            order.title.toString(),
            style: TextStyle(
              fontSize: 30.sp,
              fontFamily: FontConstants.fontFamily,
              fontWeight: FontWeight.w500,
              color: ColorManager.primary,
            ),
          ),
          SizedBox(
            height: 5.h,
          ),
          Row(
            children: [
              Row(
                children: [
                  Icon(
                    Icons.title,
                    size: 14.sp,
                    color: Colors.grey,
                  ),
                  Text(
                    order.major.toString(),
                    style: TextStyle(
                      fontSize: 10.sp,
                      fontFamily: FontConstants.fontFamily,
                      fontWeight: FontWeight.w500,
                      color: Colors.black45,
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: 5.w,
              ),
              Row(
                children: [
                  Icon(
                    Icons.title,
                    size: 14.sp,
                    color: Colors.grey,
                  ),
                  Text(
                    order.subMajor.toString(),
                    style: TextStyle(
                      fontSize: 10.sp,
                      fontFamily: FontConstants.fontFamily,
                      fontWeight: FontWeight.w500,
                      color: Colors.black45,
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: 5.w,
              ),
              Row(
                children: [
                  Icon(
                    Icons.hourglass_empty,
                    size: 14.sp,
                    color: Colors.grey,
                  ),
                  Text(
                    order.createdAt.toString(),
                    style: TextStyle(
                      fontSize: 10.sp,
                      fontFamily: FontConstants.fontFamily,
                      fontWeight: FontWeight.w500,
                      color: Colors.black45,
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: 5.w,
              ),
              Row(
                children: [
                  Icon(
                    Icons.bookmark_border,
                    size: 14.sp,
                    color: Colors.grey,
                  ),
                  Text(
                    order.requests.toString() + " عروض".toString(),
                    style: TextStyle(
                      fontSize: 10.sp,
                      fontFamily: FontConstants.fontFamily,
                      fontWeight: FontWeight.w500,
                      color: Colors.black45,
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: 5.w,
              ),
            ],
          ),
          SizedBox(
            height: 10.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListTile(
                      contentPadding: EdgeInsets.all(2.sp),
                      title: Text(
                        "تاريخ الإنتهاء",
                        style: TextStyle(
                          fontSize: 9.sp,
                          fontFamily: FontConstants.fontFamily,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Container(
                        padding: EdgeInsets.all(5.sp),
                        margin: EdgeInsets.only(top: 5.h, left: 50.w),
                        decoration: BoxDecoration(
                          color: Colors.grey[400],
                          borderRadius: BorderRadius.circular(20.sp),
                        ),
                        child: Text(
                          order.createdAt.toString(),
                          style: TextStyle(
                            fontSize: 11.sp,
                            fontFamily: FontConstants.fontFamily,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 6.h,
                    ),
                    ListTile(
                      contentPadding: EdgeInsets.all(2.sp),
                      title: Text(
                        "الميزانية المتوقعة",
                        style: TextStyle(
                          fontSize: 9.sp,
                          fontFamily: FontConstants.fontFamily,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Container(
                        padding: EdgeInsets.all(5.sp),
                        margin: EdgeInsets.only(top: 5.h, left: 50.w),
                        decoration: BoxDecoration(
                          color: Colors.grey[400],
                          borderRadius: BorderRadius.circular(20.sp),
                        ),
                        child: Text(
                          order.clientProposedBudget.toString() +
                              "  رس ".toString(),
                          style: TextStyle(
                            fontSize: 11.sp,
                            fontFamily: FontConstants.fontFamily,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 20.w,
              ),
              order.status == "completed_by_lawyer"
                  ? Expanded(
                      child: Container(
                        height: 50.h,
                        width: 100.w,
                        margin: EdgeInsets.only(left: 20.w),
                        alignment: Alignment.center,
                        padding: EdgeInsets.only(right: 10.sp),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.sp),
                          color: ColorManager.secondary,
                        ),
                        child: Text(
                          "المطالبة بالاتعاب القضية إنتهت",
                          style: TextStyle(
                            fontSize: 13.sp,
                            fontFamily: FontConstants.fontFamily,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    )
                  : order.status == "in progress"
                      ? Row(
                          children: [
                            InkWell(
                              onTap: () {},
                              child: Container(
                                width: 80.w,
                                height: 40.h,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.circular(12.sp),
                                ),
                                child: Text(
                                  "إلغاء الطلب",
                                  style: TextStyle(
                                    fontSize: 10.sp,
                                    fontFamily: FontConstants.fontFamily,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 5.w,
                            ),
                            InkWell(
                              onTap: () {},
                              child: Container(
                                width: 80.w,
                                height: 40.h,
                                margin: EdgeInsets.only(left: 3.w),
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius: BorderRadius.circular(12.sp),
                                ),
                                child: Text(
                                  "تإكيد الطلب",
                                  style: TextStyle(
                                    fontSize: 10.sp,
                                    fontFamily: FontConstants.fontFamily,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )
                      : Expanded(
                          child: Text(
                            "لا يوجد حالة لهذا الطلب",
                            style: TextStyle(
                              fontSize: 20.sp,
                              fontFamily: FontConstants.fontFamily,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey[400],
                            ),
                          ),
                        ),
            ],
          ),
          SizedBox(
            height: 6.h,
          ),
          order.statusCode! == 8 || order.statusCode! == 2
              ? Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "الميزانية المتفق عليها",
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontFamily: FontConstants.fontFamily,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    Container(
                      width: 120.w,
                      height: 40.h,
                      padding: EdgeInsets.all(5.sp),
                      margin: EdgeInsets.only(top: 5.h),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.grey[400],
                        borderRadius: BorderRadius.circular(10.sp),
                      ),
                      child: Text(
                        order.lastBudget.toString() + "  رس ".toString(),
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontFamily: FontConstants.fontFamily,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                )
              : Container(),
          SizedBox(
            height: 12.h,
          ),
          Text(
            order.description.toString(),
            style: TextStyle(
              fontSize: 18.sp,
              fontFamily: FontConstants.fontFamily,
            ),
          ),
          SizedBox(
            height: 22.h,
          ),
          Row(
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  height: 2.h,
                  color: Colors.grey,
                ),
              ),
              SizedBox(
                width: 5.w,
              ),
              Expanded(
                flex: 1,
                child: Container(
                  padding: EdgeInsets.all(10.sp),
                  decoration: BoxDecoration(
                    color: ColorManager.thirdy,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(16.sp),
                      bottomRight: Radius.circular(16.sp),
                      topRight: Radius.circular(16.sp),
                    ),
                  ),
                  child: Text(
                    "بيانات العميل",
                    style: TextStyle(
                      fontSize: 13.sp,
                      fontFamily: FontConstants.fontFamily,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 5.w,
              ),
              Expanded(
                flex: 1,
                child: Container(
                  height: 2.h,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
          order.statusCode! == 8 || order.statusCode! == 2
              ? _clientInfoSection(clientModel: order.client!)
              : _unknownUser(),
          SizedBox(
            height: 25.h,
          ),
          Align(
            alignment: Alignment.center,
            child: InkWell(
              onTap: () {},
              child: Container(
                width: 200.w,
                height: 40.h,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.sp),
                  color: ColorManager.thirdy,
                ),
                child: Text(
                  "تواصل",
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontFamily: FontConstants.fontFamily,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _unknownUser() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              height: AppSize.s105,
              width: AppSize.s116,
              padding: const EdgeInsets.all(AppPadding.p10),
              decoration: BoxDecoration(
                border: Border.all(color: ColorManager.grey, width: 0.5),
                shape: BoxShape.circle,
              ),
              child: CircleAvatar(
                backgroundColor: Colors.grey[300],
                child: CachedNetworkImage(
                  height: 50,
                  width: 50,
                  fit: BoxFit.cover,
                  imageUrl: AssetsManager.lawyerImg,
                  placeholder: (context, url) =>
                      const Center(child: CircularProgressIndicator()),
                  errorWidget: (context, url, error) => const Image(
                    image: AssetImage(AssetsManager.lawyerImg),
                  ),
                ),
              ),
              //clipBehavior: Clip.antiAliasWithSaveLayer,
            ),
            SizedBox(
              width: 10.w,
            ),
            Text(
              "UnKnown User",
              style: TextStyle(
                fontSize: 16.sp,
                fontFamily: FontConstants.fontFamily,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

Widget _clientInfoSection({required Client clientModel}) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(
        children: [
          Container(
            height: AppSize.s105,
            width: AppSize.s116,
            padding: const EdgeInsets.all(AppPadding.p10),
            decoration: BoxDecoration(
              border: Border.all(color: ColorManager.grey, width: 0.5),
              shape: BoxShape.circle,
            ),
            child: CircleAvatar(
              backgroundColor: Colors.grey[300],
              child: CachedNetworkImage(
                height: 50,
                width: 50,
                fit: BoxFit.cover,
                imageUrl: clientModel.personalImage == null
                    ? AssetsManager.lawyerImg
                    : clientModel.personalImage!,
                placeholder: (context, url) =>
                    const Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) => const Image(
                  image: AssetImage(AssetsManager.lawyerImg),
                ),
              ),
            ),
            //clipBehavior: Clip.antiAliasWithSaveLayer,
          ),
          SizedBox(
            width: 10.w,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 15.h,
                ),
                Text(
                  clientModel.name.toString(),
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontFamily: FontConstants.fontFamily,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  clientModel.about.toString(),
                  style: TextStyle(
                    fontSize: 11.sp,
                    fontFamily: FontConstants.fontFamily,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[500],
                  ),
                ),
                SizedBox(
                  height: 5.h,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.location_on_rounded,
                      size: 14.sp,
                      color: Colors.grey,
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    Text(
                      clientModel.city.toString(),
                      style: TextStyle(
                        fontSize: 11.sp,
                        fontFamily: FontConstants.fontFamily,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[500],
                      ),
                    ),
                    SizedBox(
                      width: 60.w,
                    ),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        width: 90.w,
                        height: 30.h,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.sp),
                          color: ColorManager.fourth,
                        ),
                        child: Text(
                          "زيارة البروفايل",
                          style: TextStyle(
                            fontSize: 10.sp,
                            fontFamily: FontConstants.fontFamily,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    ],
  );
}

Widget _appBar(BuildContext context) => Container(
      width: double.infinity,
      height: 170.h,
      color: ColorManager.primary,
      padding: EdgeInsets.only(top: 15.h, left: 20.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image(
            image: const AssetImage(
              AssetsManager.logo,
            ),
            width: 200.w,
            height: 100.h,
            fit: BoxFit.cover,
          ),
          SizedBox(
            width: 60.w,
          ),
          InkWell(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Directionality(
              textDirection: TextDirection.ltr,
              child: Icon(
                Icons.arrow_back_ios,
                color: ColorManager.thirdy,
                size: 30.sp,
              ),
            ),
          ),
        ],
      ),
    );

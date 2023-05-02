import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hokok/config/screen_handler.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../../core/color_manager.dart';
import '../../../../../core/font_manager.dart';
import '../../../../../core/values_manager.dart';
import '../../../../../presentation/widget/shared_widget.dart';
import '../../../domain/entities/client__requests_order_entity.dart';

class OrderRequestDetailsScreen extends StatefulWidget {
  const OrderRequestDetailsScreen({super.key, required this.order});
  final RequestOrderInfo order;

  @override
  State<OrderRequestDetailsScreen> createState() =>
      _OrderRequestDetailsScreenState();
}

class _OrderRequestDetailsScreenState extends State<OrderRequestDetailsScreen> {
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
              _AppbarWidget(order: widget.order),
              SizedBox(
                height: 30.h,
              ),
              _BodyWidget(
                order: widget.order,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _BodyWidget extends StatelessWidget {
  const _BodyWidget({
    required this.order,
    super.key,
  });
  final RequestOrderInfo order;
  static GlobalKey<FormState> formKey = GlobalKey<FormState>();
  static bool isShow = false;
  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(builder: (context, state) {
      return Form(
        key: formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("الوقت المتوقع :${order.expectedDays}",
                style: TextStyle(
                  fontSize: 18.sp,
                  fontFamily: FontConstants.fontFamily,
                  color: Colors.black,
                )),
            SizedBox(
              height: 14.h,
            ),
            Text(
              "الميزانية المتوقعة :${order.expectedDays} ",
              style: TextStyle(
                fontSize: 18.sp,
                fontFamily: FontConstants.fontFamily,
                color: Colors.black,
              ),
            ),
            SizedBox(
              height: 14.h,
            ),
            Text(" الملفات :",
                style: TextStyle(
                  fontSize: 18.sp,
                  fontFamily: FontConstants.fontFamily,
                  color: Colors.black,
                )),
            SizedBox(
              height: 45.h,
              child: ListView.builder(
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: order.files!.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () async {
                      if (await canLaunchUrl(Uri.parse(order.files![index]))) {
                        await launchUrl(Uri.parse(order.files![index]));
                      } else {
                        throw 'Could not launch ';
                      }
                    },
                    child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 5.w),
                        width: 80.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(AppSize.s10),
                          border: Border.all(
                            width: AppSize.s1,
                            color: ColorManager.grey,
                          ),
                        ),
                        child: Center(
                            child: Text(("الملف :${index + 1}").toString()))),
                  );
                },
              ),
            ),
            SizedBox(
              height: 30.h,
            ),
            Container(
              height: 40.h,
              width: 250.w,
              alignment: Alignment.centerRight,
              padding: EdgeInsets.all(5.sp),
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
                "تفاصيل الطلب",
                style: TextStyle(
                  fontSize: 20.sp,
                  fontFamily: FontConstants.fontFamily,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Align(
              alignment: Alignment.center,
              child: Container(
                padding: EdgeInsets.all(12),
                height: AppSize.s150,
                width: AppSize.s234,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(AppSize.s25),
                  border: Border.all(
                    width: AppSize.s1,
                    color: ColorManager.grey,
                  ),
                ),
                child: Text(
                  order.info!,
                  style: TextStyle(
                    fontSize: 15.sp,
                    fontFamily: FontConstants.fontFamily,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
          ],
        ),
      );
    });
  }
}

class _AppbarWidget extends StatelessWidget {
  const _AppbarWidget({
    super.key,
    required this.order,
  });

  final RequestOrderInfo order;

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
              SizedBox(
                height: 30.h,
              ),
              Text(
                order.lawyer!.name!,
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
          SizedBox(
            width: 100.w,
          ),
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

class _FormViewWidget extends StatelessWidget {
  const _FormViewWidget({
    required this.title,
    required this.onClick,
    required this.inputType,
    required this.labelText,
    super.key,
  });
  final String? title;
  final void Function(String value)? onClick;
  final String labelText;
  final TextInputType inputType;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 10.w),
      width: 300.w,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              title.toString(),
              style: TextStyle(
                fontSize: 13.sp,
                fontFamily: FontConstants.fontFamily,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Container(
            height: 40.h,
            width: 160.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            alignment: Alignment.center,
            child: defaultTextFiled(
              onChange: onClick,
              inputType: inputType,
              labelText: labelText,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'من فضلك ادخل القيمة المطلوبة ';
                }
                return null;
              },
            ),
          ),
        ],
      ),
    );
  }
}

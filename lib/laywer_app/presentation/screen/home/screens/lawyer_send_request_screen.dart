import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hokok/config/screen_handler.dart';
import 'package:hokok/core/debug_prints.dart';
import 'package:hokok/core/shared_widget/show_snackbar_shared_widget.dart';
import 'package:hokok/domain/entities/public_order_entity.dart';
import 'package:hokok/presentation/blocs/order_bloc/order_bloc.dart';
import 'package:hokok/presentation/blocs/order_bloc/order_helper.dart';
import 'package:hokok/presentation/blocs/order_bloc/order_states.dart';

import '../../../../../core/color_manager.dart';
import '../../../../../core/components/appbar_comp/app_bar_widget.dart';
import '../../../../../core/font_manager.dart';
import '../../../../../core/values_manager.dart';
import '../../../../../presentation/widget/shared_widget.dart';

class LawyerSendRequestScreen extends StatefulWidget {
  const LawyerSendRequestScreen({required this.order, super.key});
  final OrderInfoModel? order;

  @override
  State<LawyerSendRequestScreen> createState() =>
      _LawyerSendRequestScreenState();
}

class _LawyerSendRequestScreenState extends State<LawyerSendRequestScreen> {
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
              _AppbarWidget(order: widget.order!),
              SizedBox(
                height: 30.h,
              ),
              _BodyWidget(
                order: widget.order!,
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
  final OrderInfoModel order;
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
            _FormViewWidget(
              title: "ادخل الوقت المتوقع",
              inputType: TextInputType.number,
              labelText: "ادخل الوقت",
              onClick: (value) {
                state(() {
                  OrderHelper.instance().expectedDays = int.parse(value);
                });
              },
            ),
            SizedBox(
              height: 14.h,
            ),
            _FormViewWidget(
              title: " الميزانية المتوقعه",
              inputType: TextInputType.number,
              labelText: "الميزانية",
              onClick: (value) {
                state(() {
                  OrderHelper.instance().clientProposedBudget =
                      double.parse(value);
                });
              },
            ),
            SizedBox(
              height: 14.h,
            ),
            Container(
              margin: EdgeInsets.only(right: 10.w),
              width: 300.w,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      "ارفاق ملف",
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
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      border: Border.all(color: Colors.grey, width: 1),
                    ),
                    alignment: Alignment.center,
                    child: InkWell(
                      onTap: () async {
                        String file = await OrderHelper.instance()
                            .selectFileFromStorageFun();
                        state(() {
                          // OrderHelper.instance().file.add(result);
                          OrderHelper.instance().orderFile = File(file);
                          ScaffoldMessenger.of(context).showSnackBar(
                              showSnakBarWidget(context,
                                  "تم إدراج الملف المرفق", Colors.blue));
                        });

                        printInfo(
                            "the files are =>> ${OrderHelper.instance().orderFile!.path}");
                      },
                      child: Row(
                        children: [
                          Icon(
                            Icons.link,
                            color: Colors.orangeAccent,
                            size: 15.sp,
                          ),
                          SizedBox(
                            width: 5.w,
                          ),
                          Text(
                            "اختيار ملف",
                            style: TextStyle(
                              fontFamily: FontConstants.fontFamily,
                              fontSize: 12.sp,
                              color: ColorManager.primary,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 40.h,
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
                "اكتب ما تسطيع تقديمة",
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
                height: AppSize.s150,
                width: AppSize.s234,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(AppSize.s25),
                  border: Border.all(
                    width: AppSize.s1,
                    color: ColorManager.grey,
                  ),
                ),
                child: TextFormField(
                  style: const TextStyle(fontSize: FontSize.s13),
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  decoration: InputDecoration(
                    label: Text(
                      "اكتب تفاصيل طلب",
                      style: TextStyle(
                        fontSize: 15.sp,
                        fontFamily: FontConstants.fontFamily,
                      ),
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: AppPadding.p15,
                      vertical: AppPadding.p10,
                    ),
                    hintStyle: const TextStyle(fontSize: FontSize.s13),
                    border: InputBorder.none,
                  ),
                  onChanged: (value) {
                    state(() {
                      OrderHelper.instance().description1 = value;
                    });
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "this field is required";
                    } else if (value.length < 10) {
                      return "the number of letters must be greater than or equal 10 letters";
                    }
                    return null;
                  },
                ),
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            BlocConsumer<OrderBloc, OrderStates>(listener: (context, state) {
              if (state is OrderActionFailedState) {
                state.authErrorMessage(context, state.error.toString());
                isShow = false;
              } else if (state is OrderActionSuccessState) {
                state.authErrorMessage(context, "تمت العملية بنجاح");
                isShow = false;
                Navigator.of(context).pop();
              }
            }, builder: (context, state) {
              if (state is OrderLoadingState) {
                isShow = true;
              }
              return isShow
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : Align(
                      alignment: Alignment.center,
                      child: InkWell(
                        onTap: () {
                          OrderHelper.instance().orderId = order.id!;
                          OrderHelper.instance()
                              .onSendLawyerRequestAction(context, formKey);
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
                            "تقديم ",
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontFamily: FontConstants.fontFamily,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    );
            }),
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
              SizedBox(
                height: 30.h,
              ),
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

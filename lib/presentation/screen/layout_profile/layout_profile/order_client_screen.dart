import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hokok/core/color_manager.dart';
import 'package:hokok/core/constant.dart';

import '../../../../core/font_manager.dart';
import '../../../../core/shared_widget/text.dart';
import '../../../../core/strings_manager.dart';
import '../../../../core/values_manager.dart';

class OrdersClientScreen extends StatelessWidget {
  const OrdersClientScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorManager.white,
        body: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            _header(AppStrings.myOrders),
            _body(AppStrings.nameOrder_, AppStrings.datePublish_,
                AppStrings.dateDeadline_),
                header(AppStrings.finished),
                body(AppStrings.nameOrder_, AppStrings.datePublish_,
                    AppStrings.dateDeadline_),

          ]),
        ));
  }

  Container header(String header, [double fontSize = FontSize.s15]) =>
      Container(
        height: AppSize.s40,
        width: AppSize.s90,
        alignment: AlignmentDirectional.centerStart,
        margin: const EdgeInsets.only(top: AppMargin.m31),
        decoration: const BoxDecoration(
          color: ColorManager.primary,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(AppSize.s30),
            bottomLeft: Radius.circular(AppSize.s30),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: DefaultText(
            header,
            fontSize: fontSize,
            color: ColorManager.white,
          ),
        ),
      );
  Column body(String name, String publish, String deadL,
          [double fontSize = FontSize.s12]) =>
      Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            height: AppSize.s50,
            width: double.infinity,
            alignment: AlignmentDirectional.centerStart,
            margin: const EdgeInsets.only(top: AppMargin.m31),
            color: ColorManager.grey.withOpacity(0.2),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  const SizedBox(
                    width: AppSize.s51,
                  ),
                  DefaultText(
                    AppStrings.nameOrder,
                    fontSize: fontSize,
                    color: ColorManager.black,
                  ),
                  const SizedBox(
                    width: AppSize.s51,
                  ),
                  DefaultText(
                    AppStrings.datePublish,
                    fontSize: fontSize,
                    color: ColorManager.black,
                  ),
                  const SizedBox(
                    width: AppSize.s51,
                  ),
                  DefaultText(
                    AppStrings.dateDeadline,
                    fontSize: fontSize,
                    color: ColorManager.black,
                  ),
                  const SizedBox(
                    width: AppSize.s51,
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: AppSize.s50,
            width: double.infinity,
            alignment: AlignmentDirectional.centerStart,
            margin: const EdgeInsets.only(top: AppMargin.m31),
            decoration:BoxDecoration(
                color: ColorManager.grey.withOpacity(0.4),
                borderRadius: BorderRadius.all(Radius.circular(240)
              )
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  const SizedBox(
                    width: AppSize.s30,
                  ),
                  DefaultText(
                    name,
                    fontSize: fontSize,
                    color: ColorManager.black,
                  ),
                  const SizedBox(
                    width: AppSize.s51,
                  ),
                  DefaultText(
                    publish,
                    fontSize: fontSize,
                    color: ColorManager.black,
                  ),
                  const SizedBox(
                    width: AppSize.s51,
                  ),
                  DefaultText(
                    deadL,
                    fontSize: fontSize,
                    color: ColorManager.black,
                  ),
                  IconButton(onPressed: (){}, icon: Icon(Icons.exit_to_app))
                ],
              ),
            ),
          ),
          Container(
            height: AppSize.s50,
            width: double.infinity,
            alignment: AlignmentDirectional.centerStart,
            margin: const EdgeInsets.only(top: AppMargin.m31),
            decoration:BoxDecoration(
                color: ColorManager.grey.withOpacity(0.4),
                borderRadius: BorderRadius.all(Radius.circular(240)
                )
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  const SizedBox(
                    width: AppSize.s30,
                  ),
                  DefaultText(
                    name,
                    fontSize: fontSize,
                    color: ColorManager.black,
                  ),
                  const SizedBox(
                    width: AppSize.s51,
                  ),
                  DefaultText(
                    publish,
                    fontSize: fontSize,
                    color: ColorManager.black,
                  ),
                  const SizedBox(
                    width: AppSize.s51,
                  ),
                  DefaultText(
                    deadL,
                    fontSize: fontSize,
                    color: ColorManager.black,
                  ),
                  IconButton(onPressed: (){}, icon: Icon(Icons.exit_to_app))
                ],
              ),
            ),
          ),
          Container(

            height: AppSize.s36,
            width: AppSize.s100,
            alignment: Alignment.center,
            margin: const EdgeInsets.only(top: AppMargin.m31),
            decoration:BoxDecoration(
                color: ColorManager.grey.withOpacity(0.4),
                borderRadius: BorderRadius.all(Radius.circular(240)
                )
            ),
            child: Center(child: Text(AppStrings.more_)),
          ),

        ],
      );
  Container _header(String header, [double fontSize = FontSize.s15]) =>
      Container(
        height: AppSize.s40,
        width: AppSize.s90,
        alignment: AlignmentDirectional.centerStart,
        margin: const EdgeInsets.only(top: AppMargin.m31),
        decoration: const BoxDecoration(
          color: ColorManager.primary,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(AppSize.s30),
            bottomLeft: Radius.circular(AppSize.s30),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: DefaultText(
            header,
            fontSize: fontSize,
            color: ColorManager.white,
          ),
        ),
      );
  Column _body(String name, String publish, String deadL,
      [double fontSize = FontSize.s12]) =>
      Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            height: AppSize.s50,
            width: double.infinity,
            alignment: AlignmentDirectional.centerStart,
            margin: const EdgeInsets.only(top: AppMargin.m31),
            color: ColorManager.grey.withOpacity(0.2),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  const SizedBox(
                    width: AppSize.s51,
                  ),
                  DefaultText(
                    AppStrings.nameOrder,
                    fontSize: fontSize,
                    color: ColorManager.black,
                  ),
                  const SizedBox(
                    width: AppSize.s51,
                  ),
                  DefaultText(
                    AppStrings.datePublish,
                    fontSize: fontSize,
                    color: ColorManager.black,
                  ),
                  const SizedBox(
                    width: AppSize.s51,
                  ),
                  DefaultText(
                    AppStrings.dateDeadline,
                    fontSize: fontSize,
                    color: ColorManager.black,
                  ),
                  const SizedBox(
                    width: AppSize.s51,
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: AppSize.s50,
            width: double.infinity,
            alignment: AlignmentDirectional.centerStart,
            margin: const EdgeInsets.only(top: AppMargin.m31),
            decoration:BoxDecoration(
                color: ColorManager.grey.withOpacity(0.4),
                borderRadius: BorderRadius.all(Radius.circular(240)
                )
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  const SizedBox(
                    width: AppSize.s30,
                  ),
                  DefaultText(
                    name,
                    fontSize: fontSize,
                    color: ColorManager.black,
                  ),
                  const SizedBox(
                    width: AppSize.s51,
                  ),
                  DefaultText(
                    publish,
                    fontSize: fontSize,
                    color: ColorManager.black,
                  ),
                  const SizedBox(
                    width: AppSize.s51,
                  ),
                  DefaultText(
                    deadL,
                    fontSize: fontSize,
                    color: ColorManager.black,
                  ),
                  IconButton(onPressed: (){}, icon: Icon(Icons.exit_to_app))
                ],
              ),
            ),
          ),
          Container(
            height: AppSize.s50,
            width: double.infinity,
            alignment: AlignmentDirectional.centerStart,
            margin: const EdgeInsets.only(top: AppMargin.m31),
            decoration:BoxDecoration(
                color: ColorManager.grey.withOpacity(0.4),
                borderRadius: BorderRadius.all(Radius.circular(240)
                )
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  const SizedBox(
                    width: AppSize.s30,
                  ),
                  DefaultText(
                    name,
                    fontSize: fontSize,
                    color: ColorManager.black,
                  ),
                  const SizedBox(
                    width: AppSize.s51,
                  ),
                  DefaultText(
                    publish,
                    fontSize: fontSize,
                    color: ColorManager.black,
                  ),
                  const SizedBox(
                    width: AppSize.s51,
                  ),
                  DefaultText(
                    deadL,
                    fontSize: fontSize,
                    color: ColorManager.black,
                  ),
                  IconButton(onPressed: (){}, icon: Icon(Icons.exit_to_app))
                ],
              ),
            ),
          ),
          Container(
            height: AppSize.s36,
            width: AppSize.s100,
            alignment: Alignment.center,
            margin: const EdgeInsets.only(top: AppMargin.m31),
            decoration:BoxDecoration(
                color: ColorManager.grey.withOpacity(0.4),
                borderRadius: BorderRadius.all(Radius.circular(240)
                )
            ),
            child: Center(child: Text(AppStrings.more_)),
          ),

        ],
      );
}

import 'package:flutter/material.dart';
import 'package:hokok/core/routes_manager.dart';
import 'package:hokok/core/shared_widget/text.dart';

import '../../../../core/color_manager.dart';
import '../../../../core/constant.dart';
import '../../../../core/font_manager.dart';
import '../../../../core/shared_widget/button.dart';
import '../../../../core/strings_manager.dart';
import '../../../../core/values_manager.dart';

class MainOrderScreen extends StatefulWidget {
  const MainOrderScreen({Key? key}) : super(key: key);

  @override
  State<MainOrderScreen> createState() => _MainOrderScreen();
}

class _MainOrderScreen extends State<MainOrderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.primary,
      body: SingleChildScrollView(
        child: Stack(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(
                AppPadding.p25,
                AppPadding.p55,
                AppPadding.p20,
                AppPadding.p20,
              ),
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: AppPadding.p128),
                    padding: const EdgeInsets.all(AppPadding.p20),
                    height: AppSize.s500,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: ColorManager.white,
                      borderRadius: BorderRadius.circular(AppSize.s90),
                      border: Border.all(
                        width: AppSize.s1,
                        color: ColorManager.secondary,
                      ),
                    ),
                    child: _body(context),
                  ),
                ],
              ),
            ),
            Positioned(
              top: 50,
              right: 85,
              child: Container(
                height: 120,
                width: 200,
                decoration: BoxDecoration(
                    color: ConstantColor.whiteColor,
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.black)),
                child: const Center(
                  child: DefaultText(
                    AppStrings.commercial,
                    fontSize: AppSize.s27,
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 10,
              right: 105,
              child: DefaultElevatedButton2(
                AppStrings.send,
                onPressed: () {},
                size: const Size(AppSize.s140, AppSize.s40),
                fontSize: FontSize.s14,
              ),
            ),
            Positioned(
              top: 35,
              left: 15,
              child:                 IconButton(onPressed: (){Navigator.of(context).pushNamed(Routes.layoutRoute);}, icon: Icon(Icons.home),iconSize: AppSize.s40,),

            ),

          ],
        ),
      ),
    );
  }

  Column _body(BuildContext context) => Column(
        children: [
          Column(
            children: [
              DefaultElevatedButton2(
                AppStrings.consultation,
                onPressed: () {},
                size: const Size(AppSize.s140, AppSize.s40),
                fontSize: FontSize.s14,
              ),
              const SizedBox(
                height: AppSize.s20,
              ),
              Container(
                height: AppSize.s36,
                width: AppSize.s242,
                margin: const EdgeInsets.only(bottom: AppMargin.m27),
                decoration: BoxDecoration(
                  border: Border.all(
                    width: AppSize.s1,
                    color: ColorManager.grey,
                  ),
                ),
                child: TextFormField(
                  style: const TextStyle(fontSize: FontSize.s13),
                  keyboardType: TextInputType.multiline,
                  maxLines: 1,
                  textAlign: TextAlign.center,
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: AppPadding.p5,
                      vertical: AppPadding.p15,
                    ),
                    hintText: 'Username',
                    hintStyle: TextStyle(fontSize: FontSize.s13),
                    border: InputBorder.none,
                  ),
                ),
              ),
              Column(
                children: [
                  RichText(
                    textAlign: TextAlign.center,
                    text: const TextSpan(
                      children: [
                        TextSpan(
                          text: '*',
                          style: TextStyle(
                            color: ColorManager.primary,
                            fontSize: FontSize.s14,
                            fontWeight: FontWeightManager.w400,
                            fontFamily: FontConstants.fontFamily,
                          ),
                        ),
                        TextSpan(
                          text: 'المدة المتوقعة',
                          style: TextStyle(
                            color: ColorManager.secondary,
                            fontSize: FontSize.s12,
                            fontWeight: FontWeightManager.w400,
                            fontFamily: FontConstants.fontFamily,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        height: AppSize.s36,
                        width: AppSize.s127,
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: AppSize.s1,
                            color: ColorManager.grey,
                          ),
                        ),
                        child: TextFormField(
                          style: const TextStyle(fontSize: FontSize.s13),
                          keyboardType: TextInputType.number,
                          maxLines: 1,
                          decoration: InputDecoration(
                            label: Text(
                              'السنه',
                              style: TextStyle(
                                  color: ConstantColor.primaryColor,
                                  fontSize: AppSize.s14,
                                  fontWeight: FontWeight.bold),
                            ),
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: AppPadding.p5,
                              vertical: AppPadding.p15,
                            ),
                            hintStyle: TextStyle(fontSize: FontSize.s13),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      Container(
                        height: AppSize.s36,
                        width: AppSize.s70,
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: AppSize.s1,
                            color: ColorManager.grey,
                          ),
                        ),
                        child: TextFormField(
                          style: const TextStyle(fontSize: FontSize.s13),
                          keyboardType: TextInputType.number,
                          maxLines: 1,
                          decoration: InputDecoration(
                            label: Text(
                              'الشهر',
                              style: TextStyle(
                                  color: ConstantColor.primaryColor,
                                  fontSize: AppSize.s14,
                                  fontWeight: FontWeight.bold),
                            ),
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: AppPadding.p5,
                              vertical: AppPadding.p15,
                            ),
                            hintStyle: TextStyle(fontSize: FontSize.s13),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      Container(
                        height: AppSize.s36,
                        width: AppSize.s70,
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: AppSize.s1,
                            color: ColorManager.grey,
                          ),
                        ),
                        child: TextFormField(
                          style: const TextStyle(fontSize: FontSize.s13),
                          keyboardType: TextInputType.number,
                          maxLines: 1,
                          decoration: InputDecoration(
                            label: Text(
                              'اليوم',
                              style: TextStyle(
                                  color: ConstantColor.primaryColor,
                                  fontSize: AppSize.s14,
                                  fontWeight: FontWeight.bold),
                            ),
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: AppPadding.p5,
                              vertical: AppPadding.p15,
                            ),
                            hintStyle: TextStyle(fontSize: FontSize.s13),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: AppSize.s20,
              ),
              Column(
                children: [
                  RichText(
                    textAlign: TextAlign.center,
                    text: const TextSpan(
                      children: [
                        TextSpan(
                          text: '*',
                          style: TextStyle(
                            color: ColorManager.primary,
                            fontSize: FontSize.s14,
                            fontWeight: FontWeightManager.w400,
                            fontFamily: FontConstants.fontFamily,
                          ),
                        ),
                        TextSpan(
                          text: 'المزيانيه المتوقعه',
                          style: TextStyle(
                            color: ColorManager.secondary,
                            fontSize: FontSize.s12,
                            fontWeight: FontWeightManager.w400,
                            fontFamily: FontConstants.fontFamily,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: AppSize.s36,
                    width: AppSize.s242,
                    margin: const EdgeInsets.only(bottom: AppMargin.m27),
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: AppSize.s1,
                        color: ColorManager.grey,
                      ),
                    ),
                    child: TextFormField(
                      style: const TextStyle(fontSize: FontSize.s13),
                      keyboardType: TextInputType.multiline,
                      maxLines: 1,
                      textAlign: TextAlign.center,
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: AppPadding.p5,
                          vertical: AppPadding.p15,
                        ),
                        hintStyle: TextStyle(fontSize: FontSize.s13),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  Stack(
                    children: [
                      Container(
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
                          decoration: const InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: AppPadding.p15,
                              vertical: AppPadding.p10,
                            ),
                            hintStyle: TextStyle(fontSize: FontSize.s13),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 5,
                        left: 2,
                        child: IconButton(
                          onPressed: () {
                            Navigator.of(context).pushNamed(Routes.layoutRoute);
                          },
                          icon: Icon(Icons.attach_file),
                          iconSize: AppSize.s40,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ],
          )
        ],
      );
}

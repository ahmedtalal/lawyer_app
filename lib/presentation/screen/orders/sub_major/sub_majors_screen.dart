import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hokok/core/constant.dart';
import 'package:hokok/core/shared_widget/text.dart';

import '../../../../core/color_manager.dart';
import '../../../../core/font_manager.dart';
import '../../../../core/routes_manager.dart';
import '../../../../core/shared_widget/button.dart';
import '../../../../core/strings_manager.dart';
import '../../../../core/values_manager.dart';

class SybMajorsScreen extends StatelessWidget {
  const SybMajorsScreen({Key? key}) : super(key: key);

  @override
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
                    margin: const EdgeInsets.only(top: AppMargin.m79),
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
              top: 70,
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

          ],
        ),
      ),
    );
  }

  Column _body(BuildContext context) => Column(
        children: [
          Column(
            children: [
              const SizedBox(
                height: AppSize.s40,
              ),
              DefaultElevatedButton2(
                AppStrings.consultation,
                onPressed: () =>
                    Navigator.of(context).pushNamed(Routes.mainOrderScreen),
                size: const Size(AppSize.s180, AppSize.s58),
                fontSize: FontSize.s14,
              ),
              const SizedBox(
                height: AppSize.s20,
              ),
              DefaultElevatedButton2(
                AppStrings.note,
                onPressed: () =>
                    Navigator.of(context).pushNamed(Routes.mainOrderScreen),
                size: const Size(AppSize.s180, AppSize.s58),
                fontSize: FontSize.s14,
              ),
              const SizedBox(
                height: AppSize.s20,
              ),
              DefaultElevatedButton2(
                AppStrings.studyCase,
                onPressed: () =>
                    Navigator.of(context).pushNamed(Routes.mainOrderScreen),
                size: const Size(AppSize.s180, AppSize.s58),
                fontSize: FontSize.s14,
              ),
              const SizedBox(
                height: AppSize.s20,
              ),
              DefaultElevatedButton2(
                AppStrings.takeCase,
                onPressed: () =>
                    Navigator.of(context).pushNamed(Routes.mainOrderScreen),
                size: const Size(AppSize.s180, AppSize.s58),
                fontSize: FontSize.s14,
              ),
              const SizedBox(
                height: AppSize.s20,
              ),
              DefaultElevatedButton2(
                AppStrings.others,
                onPressed: () =>
                    Navigator.of(context).pushNamed(Routes.mainOrderScreen),
                size: const Size(AppSize.s180, AppSize.s58),
                fontSize: FontSize.s14,
              ),
              const SizedBox(
                height: AppSize.s20,
              ),
            ],
          )
        ],
      );
}

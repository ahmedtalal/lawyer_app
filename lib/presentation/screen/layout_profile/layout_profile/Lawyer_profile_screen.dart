import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hokok/core/color_manager.dart';
import 'package:hokok/core/strings_manager.dart';

import '../../../../core/assets_manager.dart';
import '../../../../core/constants_manager.dart';
import '../../../../core/font_manager.dart';
import '../../../../core/shared_widget/button.dart';
import '../../../../core/shared_widget/text.dart';
import '../../../../core/values_manager.dart';
import '../../profile/component/profile_details_widget.dart';

class LawyerProfileScreen extends StatefulWidget {
  const LawyerProfileScreen({Key? key}) : super(key: key);

  @override
  State<LawyerProfileScreen> createState() => _LawyerProfileScreenState();
}

class _LawyerProfileScreenState extends State<LawyerProfileScreen> {
  bool state = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.white,
      body: DefaultTabController(
        length: 3,
        child: Column(
          children: [
            Stack(
              children: [
                _appBar(),
                TabBar(
                  overlayColor: MaterialStateProperty.all(Colors.transparent),
                  padding: const EdgeInsets.only(top: AppPadding.p213),
                  labelPadding: const EdgeInsets.symmetric(
                    horizontal: AppPadding.p5,
                    vertical: AppPadding.p0,
                  ),
                  labelColor: ColorManager.secondary,
                  labelStyle: const TextStyle(
                    fontSize: FontSize.s13,
                    fontWeight: FontWeightManager.w400,
                  ),
                  indicatorPadding: const EdgeInsets.symmetric(
                    horizontal: AppPadding.p37,
                    vertical: AppPadding.p0,
                  ),
                  indicatorColor: ColorManager.primary,
                  indicatorWeight: AppSize.s4,
                  indicatorSize: TabBarIndicatorSize.label,
                  tabs: [
                    Container(
                      width: double.infinity,
                      height: AppSize.s40,
                      decoration: BoxDecoration(
                        color: ColorManager.white,
                        borderRadius: BorderRadius.circular(AppSize.s10),
                      ),
                      child: const Tab(
                        text: AppStrings.profile,
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      height: AppSize.s40,
                      decoration: BoxDecoration(
                        color: ColorManager.white,
                        borderRadius: BorderRadius.circular(AppSize.s10),
                      ),
                      child: const Tab(
                        text: AppStrings.balance,
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      height: AppSize.s40,
                      decoration: BoxDecoration(
                        color: ColorManager.white,
                        borderRadius: BorderRadius.circular(AppSize.s10),
                      ),
                      child: const Tab(
                        text: AppStrings.offers,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const Expanded(
              child: TabBarView(
                children: [
                  LawyerProfileScreen(),
                  LawyerProfileScreen(),
                  LawyerProfileScreen(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container _appBar() => Container(
    width: double.infinity,
    height: AppSize.s234,
    color: ColorManager.primary,
    child: Column(
      children: [
        Stack(
          alignment: AlignmentDirectional.bottomEnd,
          children: [
            Container(
              height: AppSize.s105,
              width: AppSize.s116,
              margin: const EdgeInsets.only(top: AppMargin.m48),
              padding: const EdgeInsets.all(AppPadding.p10),
              decoration: BoxDecoration(
                color: ColorManager.white,
                border: Border.all(color: ColorManager.grey, width: 0.5),
                shape: BoxShape.circle,
              ),
              clipBehavior: Clip.antiAliasWithSaveLayer,
            ),
            Container(
              height: AppSize.s34,
              width: AppSize.s34,
              padding: const EdgeInsets.all(AppPadding.p5),
              decoration: BoxDecoration(
                color: ColorManager.secondary,
                border: Border.all(color: ColorManager.grey, width: 0.5),
                shape: BoxShape.circle,
              ),
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: SvgPicture.asset(
                AssetsManager.cameraIcon,
              ),
            ),
          ],
        ),
        const Padding(
          padding: EdgeInsets.symmetric(vertical: AppPadding.p2),
          child: DefaultText(
            AppStrings.name,
            fontSize: FontSize.s26,
            color: ColorManager.white,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(AssetsManager.locationIcon),
            const DefaultText(
              AppStrings.location,
              fontSize: FontSize.s10,
              color: ColorManager.secondary,
            ),
          ],
        ),
      ],
    ),
  );

}

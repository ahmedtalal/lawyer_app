import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hokok/core/routes_manager.dart';
import 'package:hokok/presentation/screen/layout_profile/layout_profile/Lawyer_profile_screen.dart';
import 'package:hokok/core/color_manager.dart';

import '../../../core/assets_manager.dart';
import '../../../core/font_manager.dart';
import '../../../core/shared_widget/button.dart';
import '../../../core/shared_widget/text.dart';
import '../../../core/strings_manager.dart';
import '../../../core/values_manager.dart';
import '../layout/layout_screen.dart';
import '../layout/layout_screen.dart';
import 'layout_profile/client_profile_screen.dart';
import 'layout_profile/fav_client_screen.dart';
import 'layout_profile/order_client_screen.dart';

class LayoutProfileScreen extends StatefulWidget {
  const LayoutProfileScreen({Key? key}) : super(key: key);

  @override
  State<LayoutProfileScreen> createState() => _LayoutProfileScreenState();
}

class _LayoutProfileScreenState extends State<LayoutProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.white,
      body: DefaultTabController(
        length: 3,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
                        text: AppStrings.fav,
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
              child: TabBarView(children: [
                ClientProfileScreen(),
                FavClientScreen(),
                OrdersClientScreen(),
              ]),
            )
          ],
        ),
      ),

    );
  }

  Container _header(String header, [double fontSize = FontSize.s28]) =>
      Container(
        height: AppSize.s51,
        width: AppSize.s140,
        alignment: AlignmentDirectional.centerStart,
        margin: const EdgeInsets.only(top: AppMargin.m31),
        decoration: const BoxDecoration(
          color: ColorManager.primary,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(AppSize.s30),
            bottomLeft: Radius.circular(AppSize.s30),
          ),
        ),
        child: DefaultText(
          header,
          fontSize: fontSize,
          color: ColorManager.white,
        ),
      );

  Align _about() => Align(
        alignment: AlignmentDirectional.center,
        child: Container(
          width: AppSize.s272,
          height: AppSize.s180,
          margin: const EdgeInsets.only(top: AppMargin.m19),
          decoration: BoxDecoration(
            border: Border.all(
              width: AppSize.s2,
              color: ColorManager.secondary.withOpacity(AppOpacity.c0_65),
            ),
            borderRadius: BorderRadius.circular(AppSize.s50),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  top: AppPadding.p15,
                  right: AppPadding.p31,
                ),
                child: SvgPicture.asset(
                  AssetsManager.penIcon,
                  height: AppSize.s20,
                  width: AppSize.s20,
                  fit: BoxFit.none,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(AppPadding.p10),
                child: DefaultText(
                  AppStrings.about,
                  fontSize: FontSize.s16,
                  color: ColorManager.secondary.withOpacity(AppOpacity.c0_70),
                ),
              ),
            ],
          ),
        ),
      );

  Container _appBar() => Container(
        width: double.infinity,
        height: AppSize.s234,
        color: ColorManager.primary,
        child: Column(
          children: [

            Row(
              mainAxisAlignment: MainAxisAlignment.end,
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
SizedBox(width: 100,),
                IconButton(onPressed: (){Navigator.of(context).pushNamed(Routes.layoutRoute);}, icon: Icon(Icons.home),iconSize: AppSize.s40,),


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

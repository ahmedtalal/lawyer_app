import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/assets_manager.dart';
import '../../../../core/color_manager.dart';
import '../../../../core/font_manager.dart';
import '../../../../core/routes_manager.dart';
import '../../../../core/shared_widget/button.dart';
import '../../../../core/shared_widget/text.dart';
import '../../../../core/strings_manager.dart';
import '../../../../core/values_manager.dart';
import '../../../../presentation/screen/main/component/shared_widget/chat_button_widget.dart';

class ContactUsScreen extends StatefulWidget {
  const ContactUsScreen({Key? key}) : super(key: key);

  @override
  State<ContactUsScreen> createState() => _ContactUsScreenState();
}

class _ContactUsScreenState extends State<ContactUsScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(
            AppPadding.p25,
            AppPadding.p55,
            AppPadding.p20,
            AppPadding.p20,
          ),
          child: Column(
            children: [
              const ChatButtonWidget(),
              Container(
                margin: const EdgeInsets.only(top: AppMargin.m16),
                padding: const EdgeInsets.all(AppPadding.p20),
                height: AppSize.s500,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: ColorManager.white,
                  borderRadius: BorderRadius.circular(AppSize.s50),
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
      ),
    );
  }

  Column _body(BuildContext context) => Column(
    children: [
      const SizedBox(
        height: AppSize.s20,
      ),
      const DefaultText(
        AppStrings.welcomeTab,
        fontSize: FontSize.s19,
      ),
      const SizedBox(
        height: AppSize.s15,
      ),
      Container(
        height: AppSize.s40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppSize.s15),
          border: Border.all(
            width: AppSize.s1,
            color: ColorManager.grey,
          ),
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: AppPadding.p2,
                right: AppPadding.p10,
              ),
              child: SvgPicture.asset(
                AssetsManager.searchIcon,
                colorFilter: const ColorFilter.mode(
                  ColorManager.primary,
                  BlendMode.srcIn,
                ),
              ),
            ),
            Expanded(
              child: TextFormField(
                style: const TextStyle(fontSize: FontSize.s13),
                decoration: const InputDecoration(
                  hintText: AppStrings.searchTab,
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: AppPadding.p5,
                    vertical: AppPadding.p10,
                  ),
                  hintStyle: TextStyle(fontSize: FontSize.s13),
                  border: InputBorder.none,
                ),
              ),
            ),
          ],
        ),
      ),
      const SizedBox(
        height: AppSize.s20,
      ),
      const DefaultText(
        AppStrings.subjectsTab,
        fontSize: FontSize.s19,
      ),
      const SizedBox(
        height: AppSize.s20,
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            width: double.infinity,
          ),
          _btnHeader(
            AppStrings.chooseBestTab,
            AppSize.s12,
            onTap: () {},
          ),
          _btnHeader(
            AppStrings.contactWithTab,
            AppSize.s9,
            onTap: () {},
          ),
          _btnHeader(
            AppStrings.searchAboutTab,
            AppSize.s12,
            onTap: () {},
          ),
          _btnHeader(
            AppStrings.addProposalTab,
            AppSize.s20,
            onTap: () {},
          ),
        ],
      ),
      const DefaultText(
        AppStrings.didFindTab,
        fontSize: FontSize.s19,
      ),
      const SizedBox(
        height: AppSize.s15,
      ),
      Container(
        padding: const EdgeInsets.fromLTRB(
          AppPadding.p11,
          AppPadding.p10,
          AppPadding.p12,
          AppPadding.p0,
        ),
        decoration: BoxDecoration(
          border: Border.all(
            color: ColorManager.secondary,
          ),
          borderRadius: BorderRadius.circular(AppSize.s15),
        ),
        child: Column(
          children: [
            const DefaultText(
              AppStrings.talkWithUsTab,
              fontSize: FontSize.s29,
            ),
            SvgPicture.asset(
              AssetsManager.chatIcon,
              colorFilter: const ColorFilter.mode(
                ColorManager.secondary,
                BlendMode.srcIn,
              ),
              height: AppSize.s20,
            ),
            DefaultElevatedButton(
              AppStrings.startNowTab,
              onPressed: () =>
                  Navigator.of(context).pushNamed(Routes.chatRoute),
              size: const Size(AppSize.s72, AppSize.s25),
              fontSize: FontSize.s14,
            ),
          ],
        ),
      )
    ],
  );

  Padding _btnHeader(String txt, double space, {GestureTapCallback? onTap}) =>
      Padding(
        padding: EdgeInsets.only(bottom: space),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(AppSize.s15),
          hoverColor: ColorManager.secondary,
          child: DefaultText(
            txt,
            fontSize: FontSize.s13,
          ),
        ),
      );
}

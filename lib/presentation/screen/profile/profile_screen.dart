import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hokok/core/functions.dart';
import 'package:hokok/core/ui_responsive/sized_box.dart';
import 'package:hokok/presentation/blocs/profile_bloc/profile_bloc.dart';
import 'package:hokok/presentation/screen/profile/plans_screen.dart';
import '../../../core/assets_manager.dart';
import '../../../core/color_manager.dart';
import '../../../core/constants_manager.dart';
import '../../../core/font_manager.dart';
import '../../../core/routes_manager.dart';
import '../../../core/shared_widget/button.dart';
import '../../../core/shared_widget/text.dart';
import '../../../core/strings_manager.dart';
import '../../../core/values_manager.dart';
import '../../../domain/entities/client_profile_entity.dart';
import '../../../domain/entities/lawyer_profile_entity.dart';
import '../../blocs/profile_bloc/profile_helper.dart';
import '../../blocs/profile_bloc/profile_states.dart';
import 'component/profile_details_widget.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool isstate = true;
  @override
  void initState() {
    ProfileHelper.instance().getLawyerProfileAction(context);
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: Text("sdasds")),
      body: BlocConsumer<ProfileBloc, ProfileStates>(
        listener: (context, state) {
          if (state is ProfileFailedState) {
            state.authErrorMessage(context, state.error);
          }
        },
        builder: (context, state) {
          if (state is ProfileLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is LawyerProfileLoadedState) {
            LawyerProfileEntity userEntity = state.userEntity!;

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _appBar(userEntity),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _header(AppStrings.aboutMe, FontSize.s30),
                        AnimatedCrossFade(
                          firstChild: _about(),
                          secondChild: _aboutMore(),
                          crossFadeState: isstate
                              ? CrossFadeState.showFirst
                              : CrossFadeState.showSecond,
                          duration: const Duration(
                              seconds: AppConstants.splashMoreDelay),
                        ),
                        _header(AppStrings.statistics),
                        Padding(
                          padding: const EdgeInsets.all(AppPadding.p14),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        DefaultText(
                                          AppStrings.rating,
                                          fontSize: FontSize.s19,
                                          color: ColorManager.secondary
                                              .withOpacity(AppOpacity.c0_70),
                                        ),
                                        const Icon(Icons.star),
                                        const Icon(Icons.star),
                                        const Icon(Icons.star),
                                        const Icon(Icons.star),
                                        const DefaultText(
                                          "(4)",
                                          fontSize: FontSize.s12,
                                          color: ColorManager.secondary,
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: AppSize.s16),
                                    Row(
                                      children: [
                                        DefaultText(
                                          AppStrings.agencies,
                                          fontSize: FontSize.s19,
                                          color: ColorManager.secondary
                                              .withOpacity(AppOpacity.c0_70),
                                        ),
                                        const DefaultText(
                                          "(4)",
                                          fontSize: FontSize.s12,
                                          color: ColorManager.secondary,
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: AppSize.s12),
                                    Row(
                                      children: [
                                        DefaultText(
                                          AppStrings.tasks,
                                          fontSize: FontSize.s17,
                                          color: ColorManager.secondary
                                              .withOpacity(AppOpacity.c0_70),
                                        ),
                                        const Spacer(),
                                        Container(
                                          color: ColorManager.primary,
                                          child: const DefaultText(
                                            "100%",
                                            color: ColorManager.white,
                                            fontSize: FontSize.s11,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: AppSize.s9),
                                    Row(
                                      children: [
                                        DefaultText(
                                          AppStrings.rate2,
                                          fontSize: FontSize.s15,
                                          color: ColorManager.secondary
                                              .withOpacity(AppOpacity.c0_70),
                                        ),
                                        const Spacer(),
                                        Container(
                                          color: ColorManager.secondary,
                                          child: const DefaultText(
                                            "60%",
                                            color: ColorManager.white,
                                            fontSize: FontSize.s11,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: AppSize.s12),
                                    Row(
                                      children: [
                                        DefaultText(
                                          AppStrings.timing,
                                          fontSize: FontSize.s15,
                                          color: ColorManager.secondary
                                              .withOpacity(AppOpacity.c0_70),
                                        ),
                                        const Spacer(),
                                        Container(
                                          color: ColorManager.primary,
                                          child: const DefaultText(
                                            "100%",
                                            color: ColorManager.white,
                                            fontSize: FontSize.s11,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: AppSize.s9),
                                    Row(
                                      children: [
                                        DefaultText(
                                          AppStrings.countTask,
                                          fontSize: FontSize.s15,
                                          color: ColorManager.secondary
                                              .withOpacity(AppOpacity.c0_70),
                                        ),
                                        const Spacer(),
                                        Container(
                                          color: ColorManager.secondary,
                                          child: const DefaultText(
                                            " 2 ",
                                            color: ColorManager.white,
                                            fontSize: FontSize.s11,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: AppSize.s9),
                                    Row(
                                      children: [
                                        DefaultText(
                                          AppStrings.date,
                                          fontSize: FontSize.s15,
                                          color: ColorManager.secondary
                                              .withOpacity(AppOpacity.c0_70),
                                        ),
                                        const Spacer(),
                                        Container(
                                          color: ColorManager.primary,
                                          child: const DefaultText(
                                            " أغسطس ,2022",
                                            color: ColorManager.white,
                                            fontSize: FontSize.s9,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  DefaultText(
                                    AppStrings.badges,
                                    fontSize: FontSize.s14,
                                    color: ColorManager.secondary
                                        .withOpacity(AppOpacity.c0_49),
                                  ),
                                  const SizedBox(height: AppSize.s12),
                                  SvgPicture.asset(
                                    AssetsManager.penal2Icon,
                                    fit: BoxFit.none,
                                    height: 55,
                                    width: 69,
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional.center,
                                    child: Container(
                                      margin: const EdgeInsets.only(
                                          right: AppMargin.m12),
                                      height: 10,
                                      width: 49,
                                      decoration: BoxDecoration(
                                        color: ColorManager.secondary,
                                        borderRadius:
                                            BorderRadius.circular(AppSize.s15),
                                      ),
                                      child: const DefaultText(
                                        'المحامي الملتزم',
                                        textAlign: TextAlign.center,
                                        fontSize: FontSize.s6,
                                        color: ColorManager.white,
                                      ),
                                    ),
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.only(
                                      top: AppPadding.p69,
                                      right: AppPadding.p12,
                                      bottom: AppPadding.p8,
                                    ),
                                    child: DefaultBackButton(
                                      color: ColorManager.primary,
                                      height: AppSize.s40,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }

  Container _appBar(LawyerProfileEntity userEntity) => Container(
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
                        border:
                            Border.all(color: ColorManager.grey, width: 0.5),
                        shape: BoxShape.circle,
                      ),
                      child: CircleAvatar(
                        backgroundColor: Colors.grey[300],
                        child: CachedNetworkImage(
                          height: 50,
                          width: 50,
                          fit: BoxFit.cover,
                          imageUrl: userEntity.userModel!.personalImage == null
                              ? AssetsManager.lawyerImg
                              : userEntity.userModel!.personalImage!.toString(),
                          placeholder: (context, url) =>
                              const Center(child: CircularProgressIndicator()),
                          errorWidget: (context, url, error) => const Image(
                            image: AssetImage(AssetsManager.lawyerImg),
                          ),
                        ),
                      ),
                      //clipBehavior: Clip.antiAliasWithSaveLayer,
                    ),
                    Container(
                      height: AppSize.s34,
                      width: AppSize.s34,
                      padding: const EdgeInsets.all(AppPadding.p5),
                      decoration: BoxDecoration(
                        color: ColorManager.secondary,
                        border:
                            Border.all(color: ColorManager.grey, width: 0.5),
                        shape: BoxShape.circle,
                      ),
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      child: SvgPicture.asset(
                        AssetsManager.cameraIcon,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: 80.w,
                ),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed(Routes.layoutRoute);
                      },
                      icon: const Icon(Icons.home),
                      iconSize: AppSize.s40,
                    ),
                  ],
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: AppPadding.p2),
              child: DefaultText(
                userEntity.userModel!.name == null
                    ? "unKnown"
                    : userEntity.userModel!.name!,
                fontSize: FontSize.s24,
                color: ColorManager.white,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                20.pw,
                InkWell(
                  onTap: () {
                    // navigateTo(context, const PlansScreen());
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: ColorManager.thirdy,
                        borderRadius: BorderRadius.circular(8)),
                    child: const Row(children: [
                      Icon(Icons.check_box_outlined),
                      Text("رصيدى"),
                    ]),
                  ),
                ),
                Spacer(),
                SvgPicture.asset(AssetsManager.locationIcon),
                DefaultText(
                  userEntity.userModel!.city ??
                      "${userEntity.userModel!.city} - ${userEntity.userModel!.zone}",
                  fontSize: FontSize.s10,
                  color: ColorManager.secondary,
                ),
                Spacer(),

                InkWell(
                  onTap: () {
                    navigateTo(context, const PlansScreen());
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: ColorManager.thirdy,
                        borderRadius: BorderRadius.circular(8)),
                    child: const Row(children: [
                      Icon(Icons.check_box_outlined),
                      Text("الاشتراكات"),
                    ]),
                  ),
                ),
                20.pw,

              ],
            ),
          ],
        ),
      );

  // Container _appBar(BuildContext context) => Container(
  //       width: double.infinity,
  //       height: AppSize.s234,
  //       color: ColorManager.primary,
  //       child: Row(
  //         children: [
  //           const ProfileDetailsWidget(),
  //           _contacts(context),
  //         ],
  //       ),
  //     );

  Container _header(String header, [double fontSize = FontSize.s25]) =>
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
          height: AppSize.s234,
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
              Align(
                alignment: AlignmentDirectional.center,
                child: DefaultOUtLinedButton(
                  AppStrings.more,
                  onPressed: () {
                    setState(() {
                      isstate = false;
                    });
                  },
                ),
              ),
            ],
          ),
        ),
      );

  Align _aboutMore() => Align(
        alignment: AlignmentDirectional.center,
        child: Container(
          width: AppSize.s303,
          height: AppSize.s444,
          margin: const EdgeInsets.only(top: AppMargin.m19),
          decoration: BoxDecoration(
            border: Border.all(
              width: AppSize.s2,
              color: ColorManager.secondary.withOpacity(AppOpacity.c0_65),
            ),
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
              Padding(
                padding: const EdgeInsets.all(AppPadding.p10),
                child: DefaultText(
                  AppStrings.about,
                  fontSize: FontSize.s16,
                  color: ColorManager.secondary.withOpacity(AppOpacity.c0_70),
                ),
              ),
              const Align(
                alignment: AlignmentDirectional.center,
                child: DefaultText(
                  AppStrings.certificates,
                  color: ColorManager.primary,
                  fontSize: FontSize.s16,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(AppPadding.p12),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 93,
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: ColorManager.secondary, width: 1),
                          borderRadius: BorderRadius.circular(AppSize.s15),
                        ),
                      ),
                    ),
                    const SizedBox(width: AppSize.s12),
                    Expanded(
                      child: Container(
                        height: 106,
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: ColorManager.secondary, width: 1),
                          borderRadius: BorderRadius.circular(AppSize.s15),
                        ),
                      ),
                    ),
                    const SizedBox(width: AppSize.s12),
                    Expanded(
                      child: Container(
                        height: 93,
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: ColorManager.secondary, width: 1),
                          borderRadius: BorderRadius.circular(AppSize.s15),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              Align(
                alignment: AlignmentDirectional.center,
                child: DefaultOUtLinedButton(
                  AppStrings.less,
                  onPressed: () {
                    isstate = true;
                    setState(() {});
                  },
                ),
              ),
            ],
          ),
        ),
      );

  Expanded _contacts(BuildContext context) => Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            _contactTab(
              AppMargin.m79,
              AppSize.s103,
              AssetsManager.addIcon,
              AppStrings.hire,
              onTap: () => Navigator.of(context).pushNamed(Routes.hiringRoute),
            ),
            _contactTab(
              AppMargin.m27,
              AppSize.s133,
              AssetsManager.chatIcon,
              AppStrings.contactMe,
              onTap: () {},
              isContactBtn: true,
            ),
          ],
        ),
      );

  Container _contactTab(
    double top,
    double width,
    String icon,
    String txt, {
    GestureTapCallback? onTap,
    bool isContactBtn = false,
  }) =>
      Container(
        margin: EdgeInsets.only(
          top: top,
          left: AppMargin.m30,
        ),
        height: AppSize.s30,
        width: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppSize.s10),
        ),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(15),
          child: Row(
            children: [
              Expanded(
                child: Container(
                  height: AppSize.s30,
                  color: ColorManager.secondary,
                  child: Row(
                    children: [
                      const SizedBox(width: AppSize.s3),
                      SvgPicture.asset(
                        icon,
                        height: isContactBtn ? AppSize.s16 : AppSize.s20,
                        width: AppSize.s15,
                        colorFilter: const ColorFilter.mode(
                          ColorManager.white,
                          BlendMode.srcIn,
                        ),
                      ),
                      const SizedBox(width: AppSize.s3),
                      DefaultText(
                        txt,
                        color: ColorManager.white,
                        fontSize: isContactBtn ? FontSize.s14 : FontSize.s15,
                      )
                    ],
                  ),
                ),
              ),
              Container(
                height: AppSize.s30,
                width: AppSize.s34,
                color: ColorManager.white,
                child: SvgPicture.asset(
                  AssetsManager.downIcon,
                  height: AppSize.s10,
                  width: AppSize.s12,
                  fit: BoxFit.none,
                ),
              ),
            ],
          ),
        ),
      );
}

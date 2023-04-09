import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hokok/core/routes_manager.dart';
import 'package:hokok/core/shared_widget/text.dart';
import 'package:hokok/domain/entities/user_entity.dart';
import 'package:hokok/presentation/blocs/profile_bloc/profile_bloc.dart';
import 'package:hokok/presentation/blocs/profile_bloc/profile_helper.dart';
import 'package:hokok/presentation/blocs/profile_bloc/profile_states.dart';
import '../../../core/color_manager.dart';
import '../../../core/font_manager.dart';
import '../../../core/shared_widget/button.dart';
import '../../../core/strings_manager.dart';
import '../../../core/values_manager.dart';
import '../profile/component/profile_details_widget.dart';

class ClientEditProfileScreen extends StatefulWidget {
  const ClientEditProfileScreen({required this.userEntity, Key? key})
      : super(key: key);
  final UserEntity? userEntity;
  @override
  State<ClientEditProfileScreen> createState() => _ClientEditProfileScreen();
}

class _ClientEditProfileScreen extends State<ClientEditProfileScreen> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: AlignmentDirectional.bottomEnd,
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                _appBar(),
                const SizedBox(height: AppSize.s18),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    DefaultText(
                      AppStrings.quotation,
                      fontSize: FontSize.s25,
                    ),
                    SizedBox(width: AppSize.s277),
                    DefaultText(
                      AppStrings.quotation,
                      color: ColorManager.primary,
                      fontSize: FontSize.s25,
                    ),
                  ],
                ),
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    children: [
                      const TextSpan(
                        text: 'نبذه عن  ',
                        style: TextStyle(
                          color: ColorManager.primary,
                          fontSize: FontSize.s19,
                          fontWeight: FontWeightManager.w400,
                          fontFamily: FontConstants.fontFamily,
                        ),
                      ),
                      TextSpan(
                        text: widget.userEntity!.userModel!.name!,
                        style: const TextStyle(
                          color: ColorManager.secondary,
                          fontSize: FontSize.s20,
                          fontWeight: FontWeightManager.w400,
                          fontFamily: FontConstants.fontFamily,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: AppSize.s188,
                  width: AppSize.s283,
                  margin: const EdgeInsets.only(
                      top: AppMargin.m37, bottom: AppMargin.m18),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(AppSize.s25),
                    border: Border.all(
                      width: AppSize.s1,
                      color: ColorManager.grey,
                    ),
                  ),
                  child: Form(
                    key: formKey,
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
                      onChanged: (value) {
                        setState(() {
                          ProfileHelper.instance().about = value;
                        });
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "هذا الحقل إلزامي";
                        }
                        return null;
                      },
                    ),
                  ),
                ),
                BlocConsumer<ProfileBloc, ProfileStates>(
                    listener: (context, state) {
                  if (state is ProfileFailedState) {
                    state.authErrorMessage(context, "Oops,somthinn is wrong");
                  } else if (state is PorfileUpdatedSuccessState) {
                    state.naviation(
                      const RouteSettings(name: Routes.layoutProfileRoute),
                      context,
                    );
                  }
                }, builder: (context, state) {
                  bool isLoading = false;
                  if (state is ProfileLoadingState) {
                    isLoading = true;
                  }
                  return !isLoading
                      ? DefaultElevatedButton(
                          'حفظ',
                          onPressed: () {
                            ProfileHelper.instance()
                                .updateClientProfile(context, formKey);
                          },
                          fontSize: FontSize.s19,
                          size: const Size(AppSize.s133, AppSize.s30),
                        )
                      : const CircularProgressIndicator();
                }),
              ],
            ),
          ),
          const DefaultBackButton(
            color: ColorManager.primary,
            height: AppSize.s27,
            edgeInsets: EdgeInsets.all(AppPadding.p15),
          )
        ],
      ),
    );
  }

  Container _appBar() => Container(
        width: double.infinity,
        height: AppSize.s234,
        color: ColorManager.primary,
        child: ProfileDetailsWidget(
          userEntity: widget.userEntity,
          paddingRight: AppPadding.p0,
          positionRight: AppSize.s88,
        ),
      );
}

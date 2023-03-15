import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hokok/core/constant.dart';
import 'package:hokok/core/debug_prints.dart';
import 'package:hokok/presentation/blocs/auth_bloc/auth-bloc_controller.dart';
import 'package:hokok/presentation/blocs/auth_bloc/auth_bloc.dart';
import 'package:hokok/presentation/blocs/auth_bloc/auth_states.dart';
import 'package:hokok/presentation/widget/shared_widget.dart';

import '../../../core/routes_manager.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  final TextEditingController phoneController = TextEditingController();
  GlobalKey<FormState> kForm = GlobalKey<FormState>();
  bool showed = false;
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: ConstantColor.primaryColor,
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: BlocConsumer<AuthBloc, AuthStates>(listener: (context, state) {
            if (state is AuthFailedState) {
              showed = false;
              printError("error");
              state.authErrorMessage(context, state.error);
            }
          }, builder: (context, state) {
            if (state is AuthSuccessState) {
              showed = false;
              state.authNaviation(const RouteSettings(name: Routes.loginRoute));
            } else if (state is AuthLoadingState) {
              showed = true;
              //state.showLoadingDialog(context);
            }
            return Form(
              key: kForm,
              child: Column(
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  Image.asset(ImageConstant.logoImage, height: 150, width: 200),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 60),
                    margin: const EdgeInsets.symmetric(
                      horizontal: 30,
                    ),
                    decoration: BoxDecoration(
                        color: ConstantColor.whiteColor,
                        borderRadius: BorderRadius.circular(
                            SizedConstant.radiusAuthSize)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        textWidget(
                            text: 'أدخل رقم الهاتف لتسجيل الدخول',
                            fontSize: 16),
                        const SizedBox(
                          height: 60,
                        ),
                        defaultTextFiled(
                            controller: phoneController,
                            onChange: AuthBlocController.instance()
                                .onListenerOptNUmber,
                            inputType: TextInputType.number,
                            labelText: 'رقم الهاتف',
                            suffixText: '+966',
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'من فضلك ادخل رقم الهاتف';
                              }
                              return null;
                            }),
                        const SizedBox(
                          height: 60,
                        ),
                        !showed
                            ? mainButton(
                                text: 'استمرار',
                                fct: () {
                                  AuthBlocController.instance()
                                      .onSendOptCodeAction(context, kForm);
                                },
                              )
                            : const Center(child: CircularProgressIndicator()),
                        const SizedBox(
                          height: 40,
                        ),
                        textSpanWidget(
                          textOne: 'إذا لم  يكن لديك حساب  ',
                          textTwo: 'سجل من هنا ؟',
                          colorOne: ConstantColor.secondaryColor,
                          colorTwo: ConstantColor.primaryColor,
                          fontSize: 15,
                          onTap: () => Navigator.of(context)
                              .pushReplacementNamed(Routes.registerRoute),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}

class OTPScreen extends StatelessWidget {
  OTPScreen({Key? key}) : super(key: key);
  final TextEditingController otpCode = TextEditingController();
  GlobalKey<FormState> kForm = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: ConstantColor.primaryColor,
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              const SizedBox(
                height: 30,
              ),
              Image.asset(ImageConstant.logoImage, height: 150, width: 200),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 60),
                margin: const EdgeInsets.symmetric(
                  horizontal: 30,
                ),
                decoration: BoxDecoration(
                    color: ConstantColor.whiteColor,
                    borderRadius:
                        BorderRadius.circular(SizedConstant.radiusAuthSize)),
                child: Form(
                  key: kForm,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      textWidget(
                          text: 'أدخل الكود المرسل الى هاتفك', fontSize: 16),
                      const SizedBox(
                        height: 60,
                      ),
                      defaultTextFiled(
                          controller: otpCode,
                          inputType: TextInputType.number,
                          labelText: 'ادخل الكود',
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'من فضلك ادخل الكود';
                            }
                          }),
                      const SizedBox(
                        height: 60,
                      ),
                      mainButton(
                          text: 'استمرار',
                          fct: () {
                            if (kForm.currentState!.validate()) {
                              Navigator.of(context)
                                  .pushReplacementNamed(Routes.welcomeRoute);
                            }
                          }),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

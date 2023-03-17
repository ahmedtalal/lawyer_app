import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hokok/core/constant.dart';
import 'package:hokok/core/debug_prints.dart';
import 'package:hokok/core/font_manager.dart';
import 'package:hokok/data/models/major_model.dart';
import 'package:hokok/domain/entities/major_entity.dart';
import 'package:hokok/presentation/blocs/auth_bloc/auth_bloc.dart';
import 'package:hokok/presentation/blocs/auth_bloc/auth_bloc_helper.dart';
import 'package:hokok/presentation/blocs/auth_bloc/auth_states.dart';
import 'package:hokok/presentation/blocs/major_bloc/major_bloc.dart';
import 'package:hokok/presentation/blocs/major_bloc/major_bloc_helper.dart';
import 'package:hokok/presentation/blocs/major_bloc/major_states.dart';
import 'package:hokok/presentation/screen/auth/login_screen.dart';
import 'package:hokok/presentation/widget/shared_widget.dart';
import 'package:provider/provider.dart';

import '../../../core/routes_manager.dart';

class CreateClientAccountScreen extends StatefulWidget {
  CreateClientAccountScreen({Key? key}) : super(key: key);

  @override
  State<CreateClientAccountScreen> createState() =>
      _CreateClientAccountScreenState();
}

class _CreateClientAccountScreenState extends State<CreateClientAccountScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  GlobalKey<FormState> kForm = GlobalKey<FormState>();

  @override
  void initState() {
    MajorBlocHelper.instance().getMajorsActionCon(context);
    super.initState();
  }

  bool showed = false;

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
                margin:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                decoration: BoxDecoration(
                    color: ConstantColor.whiteColor,
                    borderRadius:
                        BorderRadius.circular(SizedConstant.radiusAuthSize)),
                child: BlocConsumer<AuthBloc, AuthStates>(
                    listener: (context, state) {
                  if (state is AuthFailedState) {
                    showed = false;
                    printError("error");
                    state.authErrorMessage(context, state.error);
                  }
                  if (state is AuthSuccessState) {
                    showed = false;
                    state.authNaviation(
                        const RouteSettings(
                          name: Routes.loginRoute,
                        ),
                        context);
                  }
                }, builder: (context, state) {
                  if (state is AuthLoadingState) {
                    showed = true;
                    //state.showLoadingDialog(context);
                  }
                  return Form(
                    key: kForm,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        textSpanWidget(
                          textOne: 'انشاء حساب  ',
                          textTwo: 'كعميل',
                          fontWeight: FontWeight.w500,
                          fontSize: 22,
                          colorOne: ConstantColor.primaryColor,
                          colorTwo: ConstantColor.secondaryColor,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        defaultTextFiled(
                            controller: nameController,
                            onChange: (value) {
                              AuthBlocHelper.instance().name = value;
                            },
                            inputType: TextInputType.text,
                            labelText: 'اسم المستخدم',
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'من فضلك ادخل اسم المستخدم';
                              }
                              return null;
                            }),
                        const SizedBox(
                          height: 10,
                        ),
                        defaultTextFiled(
                            controller: emailController,
                            onChange: (value) {
                              setState(() {
                                AuthBlocHelper.instance().email = value;
                              });
                            },
                            inputType: TextInputType.emailAddress,
                            labelText: 'البريد الالكتروني',
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'من فضلك ادخل البريد الالكتروني';
                              }
                              return null;
                            }),
                        const SizedBox(
                          height: 10,
                        ),
                        defaultTextFiled(
                            controller: phoneController,
                            onChange: (value) {
                              setState(() {
                                AuthBlocHelper.instance().phoneNumber = value;
                              });
                            },
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
                          height: 10,
                        ),
                        defaultTextFiled(
                            controller: locationController,
                            onChange: (value) {
                              setState(() {
                                AuthBlocHelper.instance().zone = value;
                              });
                            },
                            inputType: TextInputType.text,
                            labelText: 'الموقع',
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'من فضلك ادخل الموقع';
                              }
                              return null;
                            }),
                        const SizedBox(
                          height: 10,
                        ),
                        defaultTextFiled(
                            controller: cityController,
                            onChange: (value) {
                              setState(() {
                                AuthBlocHelper.instance().city = value;
                              });
                            },
                            inputType: TextInputType.text,
                            labelText: 'المدينة',
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'من فضلك ادخل اسم المدينة';
                              }
                              return null;
                            }),
                        const SizedBox(
                          height: 20,
                        ),
                        !showed
                            ? mainButton(
                                text: 'انشاء حساب ',
                                fct: () {
                                  AuthBlocHelper.instance().type = "client";
                                  AuthBlocHelper.instance()
                                      .onCreateAccount(context, kForm);
                                })
                            : const Center(child: CircularProgressIndicator()),
                        const SizedBox(
                          height: 20,
                        ),
                        textSpanWidget(
                          textOne: 'لديك حساب ؟ ',
                          textTwo: 'تسجيل الدخول',
                          colorOne: ConstantColor.secondaryColor,
                          colorTwo: ConstantColor.primaryColor,
                          fontSize: 15,
                          onTap: () => Navigator.of(context)
                              .pushReplacementNamed(Routes.loginRoute),
                        ),
                      ],
                    ),
                  );
                }),
              )
            ],
          ),
        ),
      ),
    );
  }
}

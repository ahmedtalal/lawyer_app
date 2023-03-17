import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hokok/core/constant.dart';
import 'package:hokok/core/debug_prints.dart';
import 'package:hokok/core/font_manager.dart';
import 'package:hokok/domain/entities/major_entity.dart';
import 'package:hokok/presentation/blocs/auth_bloc/auth_bloc_helper.dart';
import 'package:hokok/presentation/blocs/major_bloc/major_bloc.dart';
import 'package:hokok/presentation/blocs/major_bloc/major_bloc_helper.dart';
import 'package:hokok/presentation/blocs/major_bloc/major_states.dart';
import 'package:hokok/presentation/widget/shared_widget.dart';

import '../../../core/routes_manager.dart';

class CreateLawyerAccountScreen extends StatefulWidget {
  CreateLawyerAccountScreen({Key? key}) : super(key: key);

  @override
  State<CreateLawyerAccountScreen> createState() =>
      _CreateLawyerAccountScreenState();
}

class _CreateLawyerAccountScreenState extends State<CreateLawyerAccountScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController governorateController = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  GlobalKey<FormState> kForm = GlobalKey<FormState>();

  @override
  void initState() {
    MajorBlocHelper.instance().getMajorsActionCon(context);
    super.initState();
  }

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
                child: Form(
                  key: kForm,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      textSpanWidget(
                        textOne: 'انشاء حساب  ',
                        textTwo: 'كمحامي',
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
                          inputType: TextInputType.number,
                          labelText: 'الاسم الرباعي',
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
                          controller: nameController,
                          inputType: TextInputType.number,
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
                          inputType: TextInputType.number,
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
                      BlocBuilder<MajorBloc, MajorStates>(
                          builder: (context, state) {
                        List<MajorData>? majors = [];
                        if (state is GetMajorsSuccessState) {
                          majors = state.majorsList;
                          printInfo("the majors are ${majors!.length}");
                        } else if (state is GetMajorsFailedState) {
                          majors = [];
                        }
                        return Container(
                          height: 65,
                          padding: const EdgeInsets.all(2),
                          margin: const EdgeInsets.only(bottom: 10, top: 6),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(60),
                            border: Border.all(color: Colors.grey, width: 1),
                          ),
                          child: FormField<MajorData>(
                            builder: (FormFieldState<MajorData> state) {
                              return InputDecorator(
                                decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.white,
                                    //errorStyle: TextStyle(color: Colors.red[900], fontSize: 16.0),
                                    border: OutlineInputBorder(
                                        borderSide: BorderSide.none,
                                        borderRadius:
                                            BorderRadius.circular(30.0))),
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton(
                                    dropdownColor: Colors.white,
                                    iconSize: 30,
                                    iconEnabledColor: Colors.red[900],
                                    hint: Text(
                                      'الموقع',
                                      style: TextStyle(
                                          color: ConstantColor.primaryColor),
                                    ),
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontFamily: FontConstants.fontFamily,
                                      color: ConstantColor.primaryColor,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    value: AuthBlocHelper.instance().major,
                                    isDense: true,
                                    onChanged: (value) {
                                      setState(() {
                                        AuthBlocHelper.instance().major = value;
                                      });
                                    },
                                    items: majors!.map((MajorData value) {
                                      return DropdownMenuItem(
                                          value: value.name.toString(),
                                          child: Container(
                                            alignment: Alignment.centerRight,
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 5.0, right: 5.0),
                                              child: Text(
                                                value.name.toString(),
                                                textDirection:
                                                    TextDirection.rtl,
                                                textAlign: TextAlign.right,
                                              ),
                                            ),
                                          ));
                                    }).toList(),
                                  ),
                                ),
                              );
                            },
                          ),
                        );
                      }),
                      const SizedBox(
                        height: 10,
                      ),
                      defaultTextFiled(
                          controller: governorateController,
                          inputType: TextInputType.number,
                          labelText: 'المحافظه',
                          suffixIcon: Icon(Icons.location_on_outlined,
                              color: ConstantColor.primaryColor),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'من فضلك ادخل المحافظه';
                            }
                            return null;
                          }),
                      const SizedBox(
                        height: 10,
                      ),
                      defaultTextFiled(
                          controller: locationController,
                          inputType: TextInputType.number,
                          labelText: 'الموقع',
                          suffixIcon: Icon(Icons.map_outlined,
                              color: ConstantColor.primaryColor),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'من فضلك ادخل الموقع';
                            }
                            return null;
                          }),
                      const SizedBox(
                        height: 10,
                      ),
                      mainButton(
                          text: 'انشاء حساب ',
                          fct: () {
                            if (kForm.currentState!.validate()) {
                              Navigator.of(context)
                                  .pushReplacementNamed(Routes.welcomeRoute);
                            }
                          }),
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
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hokok/core/constant.dart';
import 'package:hokok/core/debug_prints.dart';
import 'package:hokok/core/font_manager.dart';
import 'package:hokok/domain/entities/major_entity.dart';
import 'package:hokok/presentation/blocs/auth_bloc/auth_bloc.dart';
import 'package:hokok/presentation/blocs/auth_bloc/auth_helper.dart';
import 'package:hokok/presentation/blocs/auth_bloc/auth_states.dart';
import 'package:hokok/presentation/blocs/major_bloc/major_bloc.dart';
import 'package:hokok/presentation/blocs/major_bloc/major_helper.dart';
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
    MajorHelper.instance().getMajorsActionCon(context);
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
                          arguments: true,
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
                          textTwo: 'كمحامي',
                          fontWeight: FontWeight.w500,
                          fontSize: 22,
                          colorOne: ConstantColor.primaryColor,
                          colorTwo: ConstantColor.secondaryColor,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: InkWell(
                                onTap: () {},
                                child: Container(
                                  padding: const EdgeInsets.all(10),
                                  height: 100,
                                  decoration: BoxDecoration(
                                    color: ConstantColor.primaryColor,
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: const [
                                      Text(
                                        "اضف صورة شهادة الترخيص",
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontFamily: FontConstants.fontFamily,
                                          color: Colors.white,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 11,
                                      ),
                                      Icon(
                                        Icons.camera_alt_outlined,
                                        size: 23,
                                        color: Color.fromARGB(255, 255, 255, 1),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              flex: 1,
                              child: InkWell(
                                onTap: () {},
                                child: Container(
                                  padding: const EdgeInsets.all(10),
                                  height: 100,
                                  decoration: BoxDecoration(
                                    color: ConstantColor.primaryColor,
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: const [
                                      Text(
                                        "اضف صورتك الشخصية",
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontFamily: FontConstants.fontFamily,
                                          color: Colors.white,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 11,
                                      ),
                                      Icon(
                                        Icons.camera_alt_outlined,
                                        size: 23,
                                        color: Color.fromARGB(255, 255, 255, 1),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        defaultTextFiled(
                            controller: nameController,
                            onChange: (value) {
                              AuthHelper.instance().name = value;
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
                              AuthHelper.instance().email = value;
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
                              AuthHelper.instance().phoneNumber = value;
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
                        BlocBuilder<MajorBloc, MajorStates>(
                            builder: (context, state) {
                          List<MajorData>? majors = [];
                          if (state is MajorSuccessLoadedState) {
                            majors = state.majorsList;
                            printInfo("the majors are ${majors!.length}");
                          } else if (state is FailedLoadedState) {
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
                                        'التخصصات',
                                        style: TextStyle(
                                            color: ConstantColor.primaryColor),
                                      ),
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontFamily: FontConstants.fontFamily,
                                        color: ConstantColor.primaryColor,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      value: AuthHelper.instance().majorValue,
                                      isDense: true,
                                      onChanged: (value) {
                                        setState(() {
                                          printInfo(
                                              "the id of major is $value");
                                          AuthHelper.instance().majorValue =
                                              value;
                                        });
                                      },
                                      items: majors!.map((MajorData value) {
                                        return DropdownMenuItem(
                                            value: value.id.toString(),
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
                            onChange: (value) {
                              AuthHelper.instance().zone = value;
                            },
                            inputType: TextInputType.text,
                            labelText: 'الموقع',
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
                            onChange: (value) {
                              AuthHelper.instance().city = value;
                            },
                            inputType: TextInputType.text,
                            labelText: 'المدينة',
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
                        !showed
                            ? mainButton(
                                text: 'انشاء حساب ',
                                fct: () {
                                  AuthHelper.instance().type = "lawyer";
                                  AuthHelper.instance()
                                      .onCreateLawyerAccount(context, kForm);
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

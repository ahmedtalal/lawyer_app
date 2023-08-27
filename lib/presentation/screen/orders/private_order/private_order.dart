import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hokok/core/debug_prints.dart';
import 'package:hokok/core/routes_manager.dart';
import 'package:hokok/core/shared_widget/text.dart';
import 'package:hokok/presentation/blocs/order_bloc/order_bloc.dart';
import 'package:hokok/presentation/blocs/order_bloc/order_helper.dart';
import 'package:hokok/presentation/blocs/order_bloc/order_states.dart';

import '../../../../core/color_manager.dart';
import '../../../../core/constant.dart';
import '../../../../core/font_manager.dart';
import '../../../../core/shared_widget/button.dart';
import '../../../../core/shared_widget/empty_data_shared_widget.dart';
import '../../../../core/strings_manager.dart';
import '../../../../core/values_manager.dart';
import '../../../../domain/entities/lawyer_entity.dart';
import '../../../../domain/entities/major_entity.dart';
import '../../../../domain/entities/sub_majors_entity.dart';
import '../../../blocs/major_bloc/major_bloc.dart';
import '../../../blocs/major_bloc/major_helper.dart';
import '../../../blocs/major_bloc/major_states.dart';

class PrivateOrderScreen extends StatefulWidget {
  const PrivateOrderScreen({Key? key, required this.lawerAttributes})
      : super(key: key);
  // final Map<String, dynamic>? data;
  final LawyerAttributes lawerAttributes;
  @override
  State<PrivateOrderScreen> createState() => _PrivateOrderScreen();
}

class _PrivateOrderScreen extends State<PrivateOrderScreen> {
  bool isShow = false;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String? _selectedMajor;
  String? _selectedSubMajor;

  List<MajorData> majors = [];
  List<SubMajorsInfoModel> subMajors = [];

  @override
  void initState() {
    printInfo("done");
    MajorHelper.instance().getMajorsActionCon(context);
    OrderHelper.instance().type = "1";
    OrderHelper.instance().lawyerId = widget.lawerAttributes.id!;
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: BlocConsumer<OrderBloc, OrderStates>(
            listener: (context, state) {
              if (state is OrderActionSuccessState) {
                state.authErrorMessage(context, "تم إضافه الطلب بنجاح");
                Navigator.of(context).pop();
              } else if (state is OrderActionFailedState) {
                isShow = false;
                state.authErrorMessage(context, state.error.toString());
              }
            },
            builder: (context, state) {
              return Form(
                key: formKey,
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.all(22.h),
                      color: ColorManager.primary,
                      child: Row(children: [
                        Expanded( flex: 1 ,child: Text("")),

                        Expanded(
                          flex: 4,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                width: 100.0,
                                height: 100.0,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(
                                        widget.lawerAttributes.personalImage!),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: 6.h),
                                child: Text(
                                  widget.lawerAttributes.name!,
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 22.sp),
                                ),
                              ),
                              const Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.location_on_outlined),
                                  Text("user loacation"),
                                ],
                              )
                            ],
                          ),
                        ),
                        Expanded( flex: 1 ,child: DefaultBackButton())
                      ]),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12.w),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "أرسل تفاصيل ما تريده الى ",
                                style: TextStyle(color: ColorManager.primary ,fontSize: 16.sp),
                              ),
                              Text(widget.lawerAttributes.name!,
                                  style: TextStyle(fontSize: 12.sp)),
                            ],
                          ),
                          Container(
                            height: 150,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.grey,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child:  TextFormField(
                              maxLines: null,
                              decoration: InputDecoration(
                                hintText: "اكتب ما تريد",
                                border: InputBorder.none,
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.transparent, width: 0.0),
                                ),
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 8, horizontal: 16),
                              ),
                              textAlign: TextAlign.right,
                              onChanged: (value) {
                                setState(() {
                                  OrderHelper.instance().description1 =
                                      value;
                                });
                              },
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "this field is required";
                                } else if (value.length < 10) {
                                  return "the number of letters must be greater than or equal 10 letters";
                                }
                                return null;
                              },
                            ),
                          ),
                          SizedBox(height: 10.h),
                          Column(
                            children: [
                              RichText(
                                textAlign: TextAlign.center,
                                text: const TextSpan(
                                  children: [
                                    TextSpan(
                                      text: '*',
                                      style: TextStyle(
                                        color: ColorManager.primary,
                                        fontSize: FontSize.s14,
                                        fontWeight: FontWeightManager.w400,
                                        fontFamily: FontConstants.fontFamily,
                                      ),
                                    ),
                                    TextSpan(
                                      text: 'التصنيف',
                                      style: TextStyle(
                                        color: ColorManager.secondary,
                                        fontSize: FontSize.s12,
                                        fontWeight: FontWeightManager.w400,
                                        fontFamily: FontConstants.fontFamily,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              BlocConsumer<MajorBloc, MajorStates>(
                                listener: (context, state) {
                                  if (state is MajorSuccessLoadedState) {
                                    majors = state.majorsList!;
                                  }
                                },
                                builder: (context, state) {
                                  if (state is LoadingState) {
                                    return Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        const Center(
                                          child: CircularProgressIndicator(),
                                        ),
                                        SizedBox(
                                          height: 10.h,
                                        ),
                                        const Text(
                                          "من فضلك الرجاء الانتظار جاري تحميل البيانات",
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontFamily: FontConstants.fontFamily,
                                          ),
                                        ),
                                      ],
                                    );
                                  }
                                  if (state is FailedLoadedState) {
                                    return emptyDataSharedWidget();
                                  }
                                  return DropdownButton<MajorData>(
                                    hint: Text(_selectedMajor ?? ""),
                                    onChanged: (newValue) {
                                      setState(() {
                                        _selectedMajor = newValue!.name!;
                                        print(newValue.name.toString());
                                        MajorHelper.instance()
                                            .getSubMajorsActionCon(context);
                                        _selectedSubMajor = "";
                                        OrderHelper.instance().majorId =
                                            newValue.id!;
                                      });
                                    },
                                    items: majors.map((option) {
                                      return DropdownMenuItem(
                                        value: option,
                                        child: Text(option.name!),
                                      );
                                    }).toList(),
                                  );
                                },
                              ),
                            ],
                          ),
                          SizedBox(height: 10.h),
                          BlocConsumer<MajorBloc, MajorStates>(
                              listener: (context, state) {
                            if (state is SubMajorSuccessLoadedState) {
                              subMajors = state.subMajorsList;
                            }
                          }, builder: (context, state) {
                            if (state is LoadingState) {
                              return Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const Center(
                                    child: CircularProgressIndicator(),
                                  ),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  const Text(
                                    "من فضلك الرجاء الانتظار جاري تحميل البيانات",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontFamily: FontConstants.fontFamily,
                                    ),
                                  ),
                                ],
                              );
                            }
                            if (state is FailedLoadedState) {
                              return emptyDataSharedWidget();
                            }
                            return DropdownButton<SubMajorsInfoModel>(
                              hint: Text(_selectedSubMajor ?? ""),
                              onChanged: (_selectedMajor == null)
                                  ? null
                                  : (newValue) {
                                      setState(() {
                                        _selectedSubMajor = newValue!.name!;
                                        OrderHelper.instance().subMajorId =
                                            newValue.id!;
                                      });
                                    },
                              items: subMajors.map((option) {
                                return DropdownMenuItem(
                                  child: Text(option.name!),
                                  value: option,
                                );
                              }).toList(),
                            );
                            // return Column(
                            //   children: [
                            //     Column(
                            //       children: [
                            //         const SizedBox(
                            //           height: AppSize.s40,
                            //         ),
                            //         const SizedBox(
                            //           height: AppSize.s20,
                            //         ),
                            //         DefaultElevatedButton2(
                            //           AppStrings.note,
                            //           onPressed: () =>
                            //               Navigator.of(context).pushNamed(Routes.mainOrderScreen),
                            //           size: const Size(AppSize.s180, AppSize.s58),
                            //           fontSize: FontSize.s14,
                            //         ),
                            //         const SizedBox(
                            //           height: AppSize.s20,
                            //         ),
                            //         DefaultElevatedButton2(
                            //           AppStrings.studyCase,
                            //           onPressed: () =>
                            //               Navigator.of(context).pushNamed(Routes.mainOrderScreen),
                            //           size: const Size(AppSize.s180, AppSize.s58),
                            //           fontSize: FontSize.s14,
                            //         ),
                            //         const SizedBox(
                            //           height: AppSize.s20,
                            //         ),
                            //         DefaultElevatedButton2(
                            //           AppStrings.takeCase,
                            //           onPressed: () =>
                            //               Navigator.of(context).pushNamed(Routes.mainOrderScreen),
                            //           size: const Size(AppSize.s180, AppSize.s58),
                            //           fontSize: FontSize.s14,
                            //         ),
                            //         const SizedBox(
                            //           height: AppSize.s20,
                            //         ),
                            //         DefaultElevatedButton2(
                            //           AppStrings.others,
                            //           onPressed: () =>
                            //               Navigator.of(context).pushNamed(Routes.mainOrderScreen),
                            //           size: const Size(AppSize.s180, AppSize.s58),
                            //           fontSize: FontSize.s14,
                            //         ),
                            //         const SizedBox(
                            //           height: AppSize.s20,
                            //         ),
                            //       ],
                            //     )
                            //   ],
                            // );
                          }),
                          SizedBox(height: 10.h),
                          Column(
                            children: [
                              RichText(
                                textAlign: TextAlign.center,
                                text: const TextSpan(
                                  children: [
                                    TextSpan(
                                      text: '*',
                                      style: TextStyle(
                                        color: ColorManager.primary,
                                        fontSize: FontSize.s14,
                                        fontWeight: FontWeightManager.w400,
                                        fontFamily: FontConstants.fontFamily,
                                      ),
                                    ),
                                    TextSpan(
                                      text: 'المدة المتوقعة',
                                      style: TextStyle(
                                        color: ColorManager.secondary,
                                        fontSize: FontSize.s12,
                                        fontWeight: FontWeightManager.w400,
                                        fontFamily: FontConstants.fontFamily,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                height: AppSize.s36,
                                width: AppSize.s242,
                                margin:
                                    const EdgeInsets.only(bottom: AppMargin.m15),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    width: AppSize.s1,
                                    color: ColorManager.grey,
                                  ),
                                ),
                                child: TextFormField(
                                  style: const TextStyle(fontSize: FontSize.s13),
                                  keyboardType: TextInputType.phone,
                                  maxLines: 1,
                                  textAlign: TextAlign.center,
                                  decoration: const InputDecoration(
                                    contentPadding: EdgeInsets.symmetric(
                                      horizontal: AppPadding.p5,
                                      vertical: AppPadding.p15,
                                    ),
                                    hintStyle: TextStyle(fontSize: FontSize.s13),
                                    border: InputBorder.none,
                                  ),
                                  onChanged: (value) {
                                    setState(() {
                                      if (value.isNotEmpty) {
                                        OrderHelper.instance().expectedTime =
                                            value;
                                      }
                                    });
                                  },
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "this field is required";
                                    }
                                    return null;
                                  },
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              RichText(
                                textAlign: TextAlign.center,
                                text: const TextSpan(
                                  children: [
                                    TextSpan(
                                      text: '*',
                                      style: TextStyle(
                                        color: ColorManager.primary,
                                        fontSize: FontSize.s14,
                                        fontWeight: FontWeightManager.w400,
                                        fontFamily: FontConstants.fontFamily,
                                      ),
                                    ),
                                    TextSpan(
                                      text: 'الميزانية المطروحة',
                                      style: TextStyle(
                                        color: ColorManager.secondary,
                                        fontSize: FontSize.s12,
                                        fontWeight: FontWeightManager.w400,
                                        fontFamily: FontConstants.fontFamily,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                height: AppSize.s36,
                                width: AppSize.s242,
                                margin:
                                    const EdgeInsets.only(bottom: AppMargin.m15),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    width: AppSize.s1,
                                    color: ColorManager.grey,
                                  ),
                                ),
                                child: TextFormField(
                                  style: const TextStyle(fontSize: FontSize.s13),
                                  keyboardType: TextInputType.phone,
                                  maxLines: 1,
                                  textAlign: TextAlign.center,
                                  decoration: const InputDecoration(
                                    contentPadding: EdgeInsets.symmetric(
                                      horizontal: AppPadding.p5,
                                      vertical: AppPadding.p15,
                                    ),
                                    hintStyle: TextStyle(fontSize: FontSize.s13),
                                    border: InputBorder.none,
                                  ),
                                  onChanged: (value) {
                                    setState(() {
                                      if (value.isNotEmpty) {
                                        OrderHelper.instance().expectedTime =
                                            value;
                                      }
                                    });
                                  },
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "this field is required";
                                    }
                                    return null;
                                  },
                                ),
                              ),
                            ],
                          ),
                          Container(
                            height: AppSize.s36,
                            width: AppSize.s242,
                            margin: const EdgeInsets.only(bottom: AppMargin.m27),
                            decoration: BoxDecoration(
                              border: Border.all(
                                width: AppSize.s1,
                                color: ColorManager.grey,
                              ),
                            ),
                            child: TextFormField(
                              style: const TextStyle(fontSize: FontSize.s13),
                              keyboardType: TextInputType.multiline,
                              maxLines: 1,
                              textAlign: TextAlign.center,
                              decoration: const InputDecoration(
                                contentPadding: EdgeInsets.symmetric(
                                  horizontal: AppPadding.p5,
                                  vertical: AppPadding.p15,
                                ),
                                hintText: 'العنوان',
                                hintStyle: TextStyle(fontSize: FontSize.s13),
                                border: InputBorder.none,
                              ),
                              onChanged: (value) {
                                setState(() {
                                  OrderHelper.instance().title = value;
                                });
                              },
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "this field is required";
                                }
                                return null;
                              },
                            ),
                          ),
                          DefaultElevatedButton2(
                            AppStrings.send,
                            onPressed: () {
                              OrderHelper.instance()
                                  .onCreatePrivateOrderActionForClient(
                                      context, formKey);
                            },
                            size: const Size(AppSize.s140, AppSize.s40),
                            fontSize: FontSize.s14,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Column _body(BuildContext context) => Column(
        children: [
          Expanded(
            child: BlocConsumer<OrderBloc, OrderStates>(
                listener: (context, state) {
              if (state is OrderActionSuccessState) {
                state.authErrorMessage(context, "تم إضافه الطلب بنجاح");
                Navigator.of(context).pop();
              } else if (state is OrderActionFailedState) {
                isShow = false;
                state.authErrorMessage(context, state.error.toString());
              }
            }, builder: (context, state) {
              if (state is OrderLoadingState) {
                isShow = true;
              }
              return Form(
                key: formKey,
                child: Column(
                  children: [
                    Column(
                      children: [
                        DefaultElevatedButton2(
                          "",
                          onPressed: () {},
                          size: const Size(AppSize.s140, AppSize.s40),
                          fontSize: FontSize.s14,
                        ),
                        const SizedBox(
                          height: AppSize.s20,
                        ),
                        Container(
                          height: AppSize.s36,
                          width: AppSize.s242,
                          margin: const EdgeInsets.only(bottom: AppMargin.m27),
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: AppSize.s1,
                              color: ColorManager.grey,
                            ),
                          ),
                          child: TextFormField(
                            style: const TextStyle(fontSize: FontSize.s13),
                            keyboardType: TextInputType.multiline,
                            maxLines: 1,
                            textAlign: TextAlign.center,
                            decoration: const InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                                horizontal: AppPadding.p5,
                                vertical: AppPadding.p15,
                              ),
                              hintText: 'العنوان',
                              hintStyle: TextStyle(fontSize: FontSize.s13),
                              border: InputBorder.none,
                            ),
                            onChanged: (value) {
                              setState(() {
                                OrderHelper.instance().title = value;
                              });
                            },
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "this field is required";
                              }
                              return null;
                            },
                          ),
                        ),
                        Column(
                          children: [
                            RichText(
                              textAlign: TextAlign.center,
                              text: const TextSpan(
                                children: [
                                  TextSpan(
                                    text: '*',
                                    style: TextStyle(
                                      color: ColorManager.primary,
                                      fontSize: FontSize.s14,
                                      fontWeight: FontWeightManager.w400,
                                      fontFamily: FontConstants.fontFamily,
                                    ),
                                  ),
                                  TextSpan(
                                    text: 'المدة المتوقعة',
                                    style: TextStyle(
                                      color: ColorManager.secondary,
                                      fontSize: FontSize.s12,
                                      fontWeight: FontWeightManager.w400,
                                      fontFamily: FontConstants.fontFamily,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              height: AppSize.s36,
                              width: AppSize.s242,
                              margin:
                                  const EdgeInsets.only(bottom: AppMargin.m27),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  width: AppSize.s1,
                                  color: ColorManager.grey,
                                ),
                              ),
                              child: TextFormField(
                                style: const TextStyle(fontSize: FontSize.s13),
                                keyboardType: TextInputType.phone,
                                maxLines: 1,
                                textAlign: TextAlign.center,
                                decoration: const InputDecoration(
                                  contentPadding: EdgeInsets.symmetric(
                                    horizontal: AppPadding.p5,
                                    vertical: AppPadding.p15,
                                  ),
                                  hintStyle: TextStyle(fontSize: FontSize.s13),
                                  border: InputBorder.none,
                                ),
                                onChanged: (value) {
                                  setState(() {
                                    if (value.isNotEmpty) {
                                      OrderHelper.instance().expectedTime =
                                          value;
                                    }
                                  });
                                },
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "this field is required";
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            RichText(
                              textAlign: TextAlign.center,
                              text: const TextSpan(
                                children: [
                                  TextSpan(
                                    text: '*',
                                    style: TextStyle(
                                      color: ColorManager.primary,
                                      fontSize: FontSize.s14,
                                      fontWeight: FontWeightManager.w400,
                                      fontFamily: FontConstants.fontFamily,
                                    ),
                                  ),
                                  TextSpan(
                                    text: 'المزيانيه المتوقعه',
                                    style: TextStyle(
                                      color: ColorManager.secondary,
                                      fontSize: FontSize.s12,
                                      fontWeight: FontWeightManager.w400,
                                      fontFamily: FontConstants.fontFamily,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              height: AppSize.s36,
                              width: AppSize.s242,
                              margin:
                                  const EdgeInsets.only(bottom: AppMargin.m27),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  width: AppSize.s1,
                                  color: ColorManager.grey,
                                ),
                              ),
                              child: TextFormField(
                                style: const TextStyle(fontSize: FontSize.s13),
                                keyboardType: TextInputType.phone,
                                maxLines: 1,
                                textAlign: TextAlign.center,
                                decoration: const InputDecoration(
                                  contentPadding: EdgeInsets.symmetric(
                                    horizontal: AppPadding.p5,
                                    vertical: AppPadding.p15,
                                  ),
                                  hintStyle: TextStyle(fontSize: FontSize.s13),
                                  border: InputBorder.none,
                                ),
                                onChanged: (value) {
                                  setState(() {
                                    if (value.isNotEmpty) {
                                      OrderHelper.instance()
                                              .clientProposedBudget =
                                          double.parse(value);
                                    }
                                  });
                                },
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "this field is required";
                                  }
                                  return null;
                                },
                              ),
                            ),
                            Stack(
                              children: [
                                Container(
                                  height: AppSize.s150,
                                  width: AppSize.s234,
                                  decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.circular(AppSize.s25),
                                    border: Border.all(
                                      width: AppSize.s1,
                                      color: ColorManager.grey,
                                    ),
                                  ),
                                  child: TextFormField(
                                    style:
                                        const TextStyle(fontSize: FontSize.s13),
                                    keyboardType: TextInputType.multiline,
                                    maxLines: null,
                                    decoration: const InputDecoration(
                                      contentPadding: EdgeInsets.symmetric(
                                        horizontal: AppPadding.p15,
                                        vertical: AppPadding.p10,
                                      ),
                                      hintStyle:
                                          TextStyle(fontSize: FontSize.s13),
                                      border: InputBorder.none,
                                    ),
                                    onChanged: (value) {
                                      setState(() {
                                        OrderHelper.instance().description1 =
                                            value;
                                      });
                                    },
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return "this field is required";
                                      } else if (value.length < 10) {
                                        return "the number of letters must be greater than or equal 10 letters";
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                                Positioned(
                                  bottom: 5,
                                  left: 2,
                                  child: IconButton(
                                    onPressed: () {
                                      Navigator.of(context).pushNamed(
                                        Routes.layoutRoute,
                                      );
                                    },
                                    icon: const Icon(Icons.attach_file),
                                    iconSize: AppSize.s40,
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              );
            }),
          )
        ],
      );
}

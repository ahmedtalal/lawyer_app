import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
import '../../../../core/strings_manager.dart';
import '../../../../core/values_manager.dart';

class MainOrderScreen extends StatefulWidget {
  const MainOrderScreen({this.data, Key? key}) : super(key: key);
  final Map<String, dynamic>? data;
  @override
  State<MainOrderScreen> createState() => _MainOrderScreen();
}

class _MainOrderScreen extends State<MainOrderScreen> {
  @override
  void initState() {
    printInfo("the model is ${widget.data}");
    OrderHelper.instance().majorId = widget.data!["majorId"];
    OrderHelper.instance().subMajorId = widget.data!["subMajorId"];

    super.initState();
  }

  bool isShow = false;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.primary,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Stack(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(
                AppPadding.p25,
                AppPadding.p55,
                AppPadding.p20,
                AppPadding.p20,
              ),
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: AppPadding.p128),
                    padding: const EdgeInsets.all(AppPadding.p20),
                    height: 520,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: ColorManager.white,
                      borderRadius: BorderRadius.circular(AppSize.s90),
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
            Positioned(
              top: 50,
              right: 85,
              child: Container(
                height: 120,
                width: 200,
                decoration: BoxDecoration(
                    color: ConstantColor.whiteColor,
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.black)),
                child:  Center(
                  child: DefaultText(
                    widget.data!["majorName"],
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 10,
              right: 105,
              child: isShow
                  ? const Center(child: CircularProgressIndicator())
                  : DefaultElevatedButton2(
                      AppStrings.send,
                      onPressed: () {
                        OrderHelper.instance()
                            .onCreateOrderActionForClient(context, formKey);
                      },
                      size: const Size(AppSize.s140, AppSize.s40),
                      fontSize: FontSize.s14,
                    ),
            ),
            Positioned(
              top: 35,
              left: 15,
              child: IconButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(Routes.layoutRoute);
                },
                icon: const Icon(Icons.home),
                iconSize: AppSize.s40,
              ),
            ),
          ],
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
                          widget.data!["subMajorName"],
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

                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                  height: AppSize.s36,
                                  width: AppSize.s242,
                                  margin: const EdgeInsets.only(bottom: AppMargin.m12),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      width: AppSize.s1,
                                      color: ColorManager.grey,
                                    ),
                                  ),
                                  child: TextFormField(
                                    style: const TextStyle(fontSize: FontSize.s13),
                                    maxLines: 1,
                                    textAlign: TextAlign.center,
                                    keyboardType :  TextInputType.number,
                                    decoration: const InputDecoration(
                                      contentPadding: EdgeInsets.symmetric(
                                        horizontal: AppPadding.p5,
                                        vertical: AppPadding.p15,
                                      ),
                                      hintText: 'المدة المتوقعة',
                                      hintStyle: TextStyle(fontSize: FontSize.s13),
                                      border: InputBorder.none,
                                    ),
                                    onChanged: (value) {
                                      setState(() {
                                        OrderHelper.instance().clientExpectedDate = value;
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
                                // Container(
                                //   height: AppSize.s36,
                                //   width: AppSize.s127,
                                //   decoration: BoxDecoration(
                                //     border: Border.all(
                                //       width: AppSize.s1,
                                //       color: ColorManager.grey,
                                //     ),
                                //   ),
                                //   child: TextFormField(
                                //     style:
                                //         const TextStyle(fontSize: FontSize.s13),
                                //     keyboardType: TextInputType.number,
                                //     maxLines: 1,
                                //     decoration: InputDecoration(
                                //       label: Text(
                                //         'السنه',
                                //         style: TextStyle(
                                //             color: ConstantColor.primaryColor,
                                //             fontSize: AppSize.s14,
                                //             fontWeight: FontWeight.bold),
                                //       ),
                                //       contentPadding:
                                //           const EdgeInsets.symmetric(
                                //         horizontal: AppPadding.p5,
                                //         vertical: AppPadding.p15,
                                //       ),
                                //       hintStyle: const TextStyle(
                                //           fontSize: FontSize.s13),
                                //       border: InputBorder.none,
                                //     ),
                                //     onChanged: (value) {
                                //       setState(() {
                                //       });
                                //     },
                                //     validator: (value) {
                                //       if (value!.isEmpty) {
                                //         return "this field is required";
                                //       } else if (int.parse(value) <
                                //           DateTime.now().year) {
                                //         return "the year must be greater than or equal current year";
                                //       }
                                //       return null;
                                //     },
                                //   ),
                                // ),
                                // Container(
                                //   height: AppSize.s36,
                                //   width: AppSize.s70,
                                //   decoration: BoxDecoration(
                                //     border: Border.all(
                                //       width: AppSize.s1,
                                //       color: ColorManager.grey,
                                //     ),
                                //   ),
                                //   child: TextFormField(
                                //     style:
                                //         const TextStyle(fontSize: FontSize.s13),
                                //     keyboardType: TextInputType.number,
                                //     maxLines: 1,
                                //     decoration: InputDecoration(
                                //       label: Text(
                                //         'الشهر',
                                //         style: TextStyle(
                                //             color: ConstantColor.primaryColor,
                                //             fontSize: AppSize.s14,
                                //             fontWeight: FontWeight.bold),
                                //       ),
                                //       contentPadding:
                                //           const EdgeInsets.symmetric(
                                //         horizontal: AppPadding.p5,
                                //         vertical: AppPadding.p15,
                                //       ),
                                //       hintStyle: const TextStyle(
                                //           fontSize: FontSize.s13),
                                //       border: InputBorder.none,
                                //     ),
                                //     onChanged: (value) {
                                //       String result = "0";
                                //       if (value.length == 1) {
                                //         result = result + value;
                                //       } else {
                                //         result = value;
                                //       }
                                //       setState(() {
                                //         OrderHelper.instance().month = result;
                                //       });
                                //     },
                                //     validator: (value) {
                                //       if (value!.isEmpty) {
                                //         return "this field is required";
                                //       } else if (int.parse(value) <
                                //           DateTime.now().month) {
                                //         return "the month must be greater than or equal current year";
                                //       }
                                //       return null;
                                //     },
                                //   ),
                                // ),
                                // Container(
                                //   height: AppSize.s36,
                                //   width: AppSize.s70,
                                //   decoration: BoxDecoration(
                                //     border: Border.all(
                                //       width: AppSize.s1,
                                //       color: ColorManager.grey,
                                //     ),
                                //   ),
                                //   child: TextFormField(
                                //     style:
                                //         const TextStyle(fontSize: FontSize.s13),
                                //     keyboardType: TextInputType.number,
                                //     maxLines: 1,
                                //     decoration: InputDecoration(
                                //       label: Text(
                                //         'اليوم',
                                //         style: TextStyle(
                                //             color: ConstantColor.primaryColor,
                                //             fontSize: AppSize.s14,
                                //             fontWeight: FontWeight.bold),
                                //       ),
                                //       contentPadding:
                                //           const EdgeInsets.symmetric(
                                //         horizontal: AppPadding.p5,
                                //         vertical: AppPadding.p15,
                                //       ),
                                //       hintStyle: const TextStyle(
                                //           fontSize: FontSize.s13),
                                //       border: InputBorder.none,
                                //     ),
                                //     onChanged: (value) {
                                //       String result = "0";
                                //       if (value.length == 1) {
                                //         result = result + value;
                                //       } else {
                                //         result = value;
                                //       }
                                //       setState(() {
                                //         OrderHelper.instance().day = result;
                                //       });
                                //     },
                                //     validator: (value) {
                                //       if (value!.isEmpty) {
                                //         return "this field is required";
                                //       } else if (int.parse(value) <
                                //           DateTime.now().day) {
                                //         return "the day must be greater than or equal current year";
                                //       }
                                //       return null;
                                //     },
                                //   ),
                                // ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: AppSize.s20,
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

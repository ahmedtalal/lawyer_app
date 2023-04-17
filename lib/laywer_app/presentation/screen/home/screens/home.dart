import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hokok/core/constant.dart';
import 'package:hokok/core/debug_prints.dart';
import 'package:hokok/core/font_manager.dart';
import 'package:hokok/core/routes_manager.dart';
import 'package:hokok/core/shared_widget/empty_data_shared_widget.dart';
import 'package:hokok/domain/entities/major_entity.dart';
import 'package:hokok/domain/entities/public_order_entity.dart';
import 'package:hokok/domain/entities/user_entity.dart';
import 'package:hokok/presentation/blocs/major_bloc/major_bloc.dart';
import 'package:hokok/presentation/blocs/major_bloc/major_helper.dart';
import 'package:hokok/presentation/blocs/major_bloc/major_states.dart';
import 'package:hokok/presentation/blocs/order_bloc/order_bloc.dart';
import 'package:hokok/presentation/blocs/order_bloc/order_helper.dart';
import 'package:hokok/presentation/blocs/order_bloc/order_states.dart';
import 'package:hokok/presentation/blocs/profile_bloc/profile_helper.dart';
import '../../../../../core/assets_manager.dart';
import '../../../../../core/color_manager.dart';
import '../../../../../core/components/appbar_comp/app_bar_comp.dart';
import '../../../../../core/values_manager.dart';
import '../../../../../presentation/widget/shared_widget.dart';

class HomeLawyerScreen extends StatefulWidget {
  const HomeLawyerScreen({Key? key}) : super(key: key);

  @override
  State<HomeLawyerScreen> createState() => _HomeLawyerScreenState();
}

class _HomeLawyerScreenState extends State<HomeLawyerScreen> {
  @override
  void initState() {
    ProfileHelper.instance().getLawyerProfileAction(context);
    OrderHelper.instance().getPublicOrdersForLawyerAction(context);
    MajorHelper.instance().getMajorsActionCon(context);

    super.initState();
  }

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  static List<OrderInfoModel> publicOrders = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _appBar(context),
          const SizedBox(
            height: 30,
          ),
        ],
      ),
    );
  }

  Future<void> showFilterPublicOrderSheet(BuildContext context) {
    return showModalBottomSheet<void>(
      isScrollControlled: true,
      context: context,
      constraints: BoxConstraints(
        maxWidth: MediaQuery.of(context).size.width -
            40, // here increase or decrease in width
      ),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(25.0),
        ),
      ),
      builder: (context) {
        return Padding(
          padding: MediaQuery.of(context).viewInsets,
          child: StatefulBuilder(builder: (context, setState) {
            return Container(
              height: 250.h,
              margin: const EdgeInsets.only(
                left: 30,
                right: 30,
              ),
              padding: const EdgeInsets.only(top: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(18),
              ),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: const Icon(
                        Icons.clear,
                        size: 30,
                        color: Colors.red,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "الترتيب حسب",
                    style: TextStyle(
                      fontSize: 20,
                      fontFamily: FontConstants.fontFamily,
                      color: ColorManager.primary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Form(
                    key: formKey,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 50,
                          child: defaultTextFiled(
                            onChange: (value) {
                              setState(() {
                                OrderHelper.instance().city = value;
                              });
                            },
                            inputType: TextInputType.text,
                            labelText: 'ادخل إسم المدينة',
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'من فضلك ادخل المدينة';
                              }
                              return null;
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 5,
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
                                border:
                                    Border.all(color: Colors.grey, width: 1),
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
                                          'نوع القضية',
                                          style: TextStyle(
                                              color:
                                                  ConstantColor.primaryColor),
                                        ),
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontFamily: FontConstants.fontFamily,
                                          color: ConstantColor.primaryColor,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        value:
                                            OrderHelper.instance().majorValue,
                                        isDense: true,
                                        onChanged: (value) {
                                          setState(() {
                                            printInfo(
                                                "the id of major is $value");
                                            OrderHelper.instance().majorId =
                                                int.parse(value.toString());
                                            OrderHelper.instance().majorValue =
                                                value;
                                            printInfo(
                                                "the major id => ${OrderHelper.instance().majorId = int.parse(value.toString())}");
                                          });
                                        },
                                        items: majors!.map((MajorData value) {
                                          return DropdownMenuItem(
                                              value: value.id.toString(),
                                              child: Container(
                                                alignment:
                                                    Alignment.centerRight,
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 5.0,
                                                          right: 5.0),
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
                          },
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          width: 110.w,
                          child: mainButton(
                            text: 'تأكيد',
                            fct: () {
                              if (formKey.currentState!.validate()) {
                                setState(() {
                                  OrderHelper.instance()
                                      .getPublicOrdersForLawyerAction(context);
                                });
                                Navigator.of(context).pop();
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }),
        );
      },
    );
  }

  Container _appBar(BuildContext context) => Container(
        width: double.infinity,
        height: AppSize.s234,
        color: ColorManager.primary,
        child: AppBarComp(
          onTap: () {
            Navigator.of(context).push(
              RouteGenerator.getRoute(
                const RouteSettings(name: Routes.notificatiosLawyersScreen),
              ),
            );
          },
          icon: Icon(
            Icons.notifications,
            color: ColorManager.thirdy,
            size: 30.sp,
          ),
        ),
      );
}


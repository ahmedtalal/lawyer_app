import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hokok/core/constant.dart';
import 'package:hokok/core/debug_prints.dart';
import 'package:hokok/core/shared_widget/empty_data_shared_widget.dart';
import 'package:hokok/core/shared_widget/text.dart';
import 'package:hokok/domain/entities/sub_majors_entity.dart';
import 'package:hokok/presentation/blocs/major_bloc/major_bloc.dart';
import 'package:hokok/presentation/blocs/major_bloc/major_helper.dart';
import 'package:hokok/presentation/blocs/major_bloc/major_states.dart';

import '../../../../core/color_manager.dart';
import '../../../../core/font_manager.dart';
import '../../../../core/routes_manager.dart';
import '../../../../core/shared_widget/button.dart';
import '../../../../core/strings_manager.dart';
import '../../../../core/values_manager.dart';
import '../../../../domain/entities/major_entity.dart';

class SubMajorsScreen extends StatefulWidget {
  const SubMajorsScreen({required this.model, Key? key}) : super(key: key);
  // final int? id;
 final MajorData model;
  // final String name;

  @override
  State<SubMajorsScreen> createState() => _SubMajorsScreenState();
}

class _SubMajorsScreenState extends State<SubMajorsScreen> {
  @override
  void initState() {
    printInfo("the major id ${widget.model.id}");
    MajorHelper.instance().getSubMajorsActionCon(context);
    super.initState();
  }

  List<SubMajorsInfoModel> subMajors = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.primary,
      body: SingleChildScrollView(
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
                    margin: const EdgeInsets.only(top: AppMargin.m79),
                    padding: const EdgeInsets.all(AppPadding.p20),
                    height: AppSize.s500,
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
              top: 70,
              right: 85,
              child: Container(
                clipBehavior: Clip.hardEdge,
                height: 120,
                width: 200,
                decoration: BoxDecoration(
                    color: ConstantColor.whiteColor,
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.black)),
                child:  Center(
                  child: DefaultText(
                    widget.model.name!,
                    // fontSize: AppSize.s20,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  SizedBox _space(double space) => SizedBox(height: space);

  Widget _body(BuildContext context) =>
      BlocConsumer<MajorBloc, MajorStates>(listener: (context, state) {
        if (state is SubMajorSuccessLoadedState) {
          subMajors = state.subMajorsList;
        }
      }, builder: (context, state) {
        if (state is LoadingState) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _space(AppSize.s70),
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
        return ListView.builder(
          itemCount: subMajors.length,
          itemBuilder: (context, index) {
            return DefaultElevatedButton2(
              subMajors[index].name!,
              onPressed: () => Navigator.of(context).push(
                RouteGenerator.getRoute(
                  RouteSettings(
                    name: Routes.mainOrderScreen,
                    arguments: {
                      "majorId": widget.model.id,
                      "majorName": widget.model.name,
                      "subMajorId": subMajors[index].id,
                      "subMajorName": subMajors[index].name,
                    },
                  ),
                ),
              ),
              size: const Size(AppSize.s180, AppSize.s58),
              fontSize: FontSize.s14,
            );
          },
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
      });
}

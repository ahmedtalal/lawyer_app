import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hokok/core/debug_prints.dart';
import 'package:hokok/core/shared_widget/empty_data_shared_widget.dart';
import 'package:hokok/domain/entities/major_entity.dart';
import 'package:hokok/presentation/blocs/major_bloc/major_bloc.dart';
import 'package:hokok/presentation/blocs/major_bloc/major_helper.dart';
import 'package:hokok/presentation/blocs/major_bloc/major_states.dart';
import 'package:hokok/presentation/screen/main/component/cubit/main_cubit.dart';
import 'package:hokok/presentation/screen/main/component/cubit/main_state.dart';
import 'package:hokok/core/color_manager.dart';
import 'package:hokok/core/font_manager.dart';
import 'package:hokok/core/routes_manager.dart';
import 'package:hokok/core/strings_manager.dart';
import 'package:hokok/presentation/screen/orders/sub_major/sub_majors_screen.dart';

import '../../../core/constants_manager.dart';
import '../../../core/shared_widget/text.dart';
import '../../../core/values_manager.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> with WidgetsBindingObserver {
  List<MajorData> majors = [];

  @override
  void initState() {
    printInfo("done");
    MajorHelper.instance().getMajorsActionCon(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        right: AppPadding.p26,
        left: AppPadding.p37,
        bottom: AppPadding.p0,
      ),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _header(),
            _space(AppSize.s20),
            _categories(),
            _space(AppSize.s35),
          ],
        ),
      ),
    );
  }

  DefaultText _header() => const DefaultText(
        AppStrings.classification,
        fontSize: FontSize.s25,
        fontWeight: FontWeightManager.w400,
      );

  SizedBox _space(double space) => SizedBox(height: space);

  BlocConsumer _categories() => BlocConsumer<MajorBloc, MajorStates>(
        listener: (context, state) {
          if (state is MajorSuccessLoadedState) {
            majors = state.majorsList!;
          }
        },
        builder: (context, state) {
          if (state is LoadingState) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _space(AppSize.s107),
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
          return Container(
            height: 380.h,
            padding: const EdgeInsets.all(8),
            width: AppSize.s312,
            alignment: AlignmentDirectional.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: Colors.grey,
                width: 0.5,
              ),
            ),
            child: GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: AppConstants.crossAxisCount,
              crossAxisSpacing: AppSize.s10,
              mainAxisSpacing: AppSize.s20,
              childAspectRatio: 1 / AspectRatioSize.a1,
              children: List.generate(
                majors.length,
                (index) => _categoryItem(
                  majors[index],
                  _isPrimeColor(index),
                ),
              ),
            ),
          );
        },
      );

  bool _isPrimeColor(int index) {
    return (index == 4 || index == 5 || index == 3 || index == 10 || index == 9)
        ? false
        : true;
  }

  InkWell _categoryItem(MajorData model, [bool primeColor = true]) => InkWell(
        onTap: () {
          Navigator.of(context).push(
            RouteGenerator.getRoute(
              RouteSettings(
                name: Routes.subMajorsScreen,
                arguments: model,
              ),
            ),
          );
        },
        child: Container(
          padding: const EdgeInsets.all(AppPadding.p5),
          width: AppSize.s70,
          height: AppSize.s64,
          decoration: BoxDecoration(
            color: primeColor ? ColorManager.primary : ColorManager.secondary,
            borderRadius: BorderRadius.circular(AppSize.s16),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppPadding.p5,
                    vertical: AppPadding.p2_6,
                  ),
                  child: Text(
                    model.name!,
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    maxLines: AppIntegerNum.i2,
                    style: const TextStyle(
                        color: ColorManager.white,
                        fontFamily: FontConstants.fontFamily),
                  ),
                ),
              ),
              CircleAvatar(
                radius: AppSize.s15,
                backgroundColor: Colors.grey[50],
                child: Image.network(
                  model.icon!,
                  height: AppSize.s15,
                ),
              ),
            ],
          ),
        ),
      );
}

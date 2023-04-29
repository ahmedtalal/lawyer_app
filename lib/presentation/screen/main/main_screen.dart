import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hokok/core/components/shared_widget.dart';
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
import '../../../core/constants_manager.dart';
import '../../../core/shared_widget/button.dart';
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
            height: 450.h,
            padding: const EdgeInsets.all(8),
            width: AppSize.s312,
            alignment: AlignmentDirectional.center,
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
          child: Stack(
            alignment: AlignmentDirectional.topCenter,
            children: [
              Positioned(
                top: 0,
                right: 0,
                child: InkWell(
                  onTap: () {
                    showDialog(
                      context: context,
                      barrierDismissible: true,
                      barrierLabel: '',
                      builder: (BuildContext context) {
                        return Center(
                          child: Container(
                            width: 200,
                            height: 200,
                            color: Colors.white,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                 Text(
                                  model.name!,
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 20),
                                const Text(
                                  'content',
                                  style: TextStyle(fontSize: 16),
                                ),
                                SizedBox(height: 20),
                                Container(
                                  width: 120,
                                  height: 30,
                                  child: DefaultElevatedButton(
                                      'اغلاق',
                                    fontSize:  FontSize.s10,


                                    onPressed: () => Navigator.of(context).pop(),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                  child: Icon(color: Colors.white, Icons.info_outline,size: 14,),
                ),
              ),
              Column(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: AppPadding.p3,
                        vertical: AppPadding.p2_6,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            model.name!,
                            textAlign: TextAlign.center,
                            overflow: TextOverflow.ellipsis,
                            maxLines: AppIntegerNum.i1,
                            style: const TextStyle(
                                color: ColorManager.white,
                                fontSize: 12,
                                fontFamily: FontConstants.fontFamily),
                          ),
                        ],
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
              )
            ],
          ),
        ),
      );
}

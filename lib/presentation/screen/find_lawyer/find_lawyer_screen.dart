import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hokok/config/screen_handler.dart';
import 'package:hokok/core/debug_prints.dart';
import 'package:hokok/core/shared_widget/show_snackbar_shared_widget.dart';
import 'package:hokok/core/values_manager.dart';
import 'package:hokok/domain/entities/lawyer_entity.dart';
import 'package:hokok/presentation/blocs/lawyer_bloc/lawyer_bloc.dart';
import 'package:hokok/presentation/blocs/lawyer_bloc/lawyer_helper.dart';
import 'package:hokok/presentation/blocs/lawyer_bloc/lawyer_states.dart';
import 'package:hokok/presentation/screen/find_lawyer/find_lawyer_widget.dart';
import '../../../core/assets_manager.dart';
import '../../../core/color_manager.dart';
import '../../../core/font_manager.dart';
import '../../../core/strings_manager.dart';

class FindLawyerScreen extends StatelessWidget {
  const FindLawyerScreen({Key? key}) : super(key: key);

  static final List<LawyerAttributes> _lawyers = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          padding: const EdgeInsets.all(10),
          height: ScreenHandler.getScreenHeight(context),
          width: ScreenHandler.getScreenWidth(context),
          child: Column(
            children: [
              const SizedBox(
                height: 35,
              ),
              Container(
                height: AppSize.s40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(AppSize.s15),
                  border: Border.all(
                    width: AppSize.s1,
                    color: ColorManager.grey,
                  ),
                ),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        top: AppPadding.p2,
                        right: AppPadding.p10,
                      ),
                      child: SvgPicture.asset(
                        AssetsManager.searchIcon,
                        colorFilter: const ColorFilter.mode(
                          ColorManager.primary,
                          BlendMode.srcIn,
                        ),
                      ),
                    ),
                    Expanded(
                      child: TextFormField(
                        style: const TextStyle(fontSize: FontSize.s13),
                        decoration: const InputDecoration(
                          hintText: AppStrings.findLawyer,
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: AppPadding.p5,
                            vertical: AppPadding.p10,
                          ),
                          hintStyle: TextStyle(fontSize: FontSize.s13),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 35,
              ),
              Expanded(
                child: BlocConsumer<LawyersBloc, LawyerStates>(
                    listener: (context, state) {
                  if (state is LawyersLoadingState && _lawyers.isNotEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      showSnakBarWidget(
                          context, "Loading more Lawyers", Colors.red),
                    );
                  } else if (state is LawyerFailedRequestState) {
                    state.authErrorMessage(context, state.error);
                    LawyerHelper.instance().isLoadMoreLawyer = false;
                  } else if (state is LawyersLoadedState &&
                      state.lawyers.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      showSnakBarWidget(context, "No more lawyers", Colors.red),
                    );
                  }
                  return;
                }, builder: (context, state) {
                  if (state is LawyerInitState ||
                      state is LawyersLoadingState && _lawyers.isEmpty) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is LawyersLoadedState) {
                    printInfo(
                        "the lenght of lawyers are => ${state.lawyers.length}");
                    _lawyers.addAll(state.lawyers);
                    LawyerHelper.instance().isLoadMoreLawyer = false;
                    ScaffoldMessenger.of(context).hideCurrentSnackBar();
                  } else if (state is LawyersFailedLoadedState &&
                      _lawyers.isEmpty) {
                    return state.showEmptyList();
                  }

                  return ListView.builder(
                    controller:
                        LawyerHelper.instance().paginationListener(context),
                    itemCount: _lawyers.length,
                    itemBuilder: (context, index) {
                      return FindLawyerView(
                        lawyerAttributes: _lawyers[index],
                      );
                    },
                  );
                }),
              ),
              const SizedBox(
                height: 35,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

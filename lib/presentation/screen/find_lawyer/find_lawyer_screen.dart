import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hokok/config/screen_handler.dart';
import 'package:hokok/core/values_manager.dart';
import 'package:hokok/presentation/screen/find_lawyer/find_lawyer_widget.dart';
import '../../../core/assets_manager.dart';
import '../../../core/color_manager.dart';
import '../../../core/font_manager.dart';
import '../../../core/strings_manager.dart';

class FindLawyerScreen extends StatelessWidget {
  const FindLawyerScreen({Key? key}) : super(key: key);

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
                child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return const FindLawyerView();
                  },
                ),
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

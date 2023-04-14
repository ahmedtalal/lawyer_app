import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hokok/core/strings_manager.dart';

import '../../../../core/assets_manager.dart';
import '../../../../core/color_manager.dart';
import '../../../../core/shared_widget/text.dart';
import '../../../../core/values_manager.dart';

class MassagesScreen extends StatelessWidget {
   const MassagesScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: Column(
       mainAxisAlignment: MainAxisAlignment.start,
       crossAxisAlignment: CrossAxisAlignment.start,
       children: [
         _appBar(context),
         const SizedBox(
           height: AppSize.s15,
         ),

         Row(
           mainAxisAlignment: MainAxisAlignment.end,
           children: [
             const DefaultText(
               "الرسائل",
               fontSize: 25,
             ),
             SizedBox(
               width: AppSize.s133,
             ),
             Padding(
               padding: const EdgeInsets.only(
                 left: AppPadding.p25

               ),
               child: SvgPicture.asset(
                 AssetsManager.searchIcon,
                 colorFilter: const ColorFilter.mode(
                   ColorManager.primary,
                   BlendMode.srcIn,

                 ),
               ),
             ),

           ],
         ),
          buildListView()

       ],
     ),
    );
  }
  Container _appBar(BuildContext context) => Container(
    width: double.infinity,
    height: AppSize.s150,
    color: ColorManager.primary,
    padding: const EdgeInsets.only(left: 20),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Spacer(),
        Image.asset(
          AssetsManager.logoEnsaf,
          fit: BoxFit.cover,
          width: AppSize.s177,
          height: AppSize.s88,

        ),
        const Spacer(),
        InkWell(
          onTap: () {},
          child: const Icon(
            Icons.shopping_cart,
            color: ColorManager.thirdy,
            size: 30,
          ),
        ),
      ],
    ),
  );

   Widget buildListView() {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 3,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: AppSize.s312,
            height: AppSize.s60,
            child: Row(
              children: [
                CircleAvatar(
                  radius: AppSize.s60,
                  child: Image.asset(AssetsManager.lawyerImg),
                ),
                Column(
children: [
  DefaultText(AppStrings.name),
  DefaultText(AppStrings.more),


],
                ),
                SizedBox(
                  width: AppSize.s31,
                ),
                DefaultText("منذ 7 د")
              ],
            ),
          ),
        );
      },
    );
  }

}

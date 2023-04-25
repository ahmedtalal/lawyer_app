import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hokok/core/constant.dart';

import '../../../config/screen_handler.dart';
import '../../../core/assets_manager.dart';
import '../../../core/routes_manager.dart';
import '../../../core/shared_widget/button.dart';
import '../../../core/shared_widget/text.dart';
import '../../../core/strings_manager.dart';
import '../../../core/values_manager.dart';

class ChooseLawyer extends StatelessWidget {
  const ChooseLawyer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Container(
                    padding: const EdgeInsets.all(10),
                    height: ScreenHandler.getScreenHeight(context),
                    width: ScreenHandler.getScreenWidth(context),
                    child: buildListView()))));
  }

  Widget buildListView() {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 3,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: AppSize.s25,
                    child: Image.asset(AssetsManager.lawyerImg),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    children: const [
                      DefaultText(
                        AppStrings.name,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ],
                  ),
                  const Spacer(),
                  DefaultText2("منذ 7 د", fontSize: 10)
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                height: 70.h,
                decoration: BoxDecoration(
                    color: ConstantColor.greyWColor,
                    borderRadius: BorderRadius.all(Radius.circular(15))),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          DefaultText2(
                            'المدة المتوقعة',
                            fontWeight: FontWeight.bold,
                          ),
                          DefaultText('10 ايام'),
                        ],
                      ),
                      SizedBox(
                        width: 25.w,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          DefaultText2(
                            'الميزانيه المتوقعة',
                            fontWeight: FontWeight.bold,
                          ),
                          DefaultText('10 ر.س'),
                        ],
                      ),
                      SizedBox(
                        width: 25.w,
                      ),

                      Container(
                        width: 100,
                        height: 30,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: ConstantColor.secondaryColor,
                        ),
                        child: Center(
                          child: InkWell(
                            onTap: () {
                              Navigator.of(context).pushNamed(Routes.profileRoute);
                            },
                            child: const DefaultText(
                              'زيارة البروفيل',
                              fontSize: 15,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      )



                    ],
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: ConstantColor.secondaryColor,
                        borderRadius: BorderRadius.circular(20)),
                    child: const DefaultElevatedButton2(
                      'تفاصيل الطلب',
                      fontSize: 13,
                      size: Size(AppSize.s12, AppSize.s12),
                    ),
                  ),
                  Spacer(),
                  Container(
                    decoration: BoxDecoration(
                        color: ConstantColor.primaryColor,
                        borderRadius: BorderRadius.circular(20)),
                    child: const DefaultElevatedButton2(
                      'موافقة الطلب',
                      fontSize: 13,
                      size: Size(AppSize.s12, AppSize.s12),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}

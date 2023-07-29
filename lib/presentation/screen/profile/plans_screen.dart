import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hokok/core/color_manager.dart';
import 'package:hokok/core/shared_widget/button.dart';

import '../../../core/assets_manager.dart';
import 'component/lawyer_offer_card.dart';

/// plans screen by essa
class PlansScreen extends StatelessWidget {
  const PlansScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 30.w),
          color: ColorManager.primary,
          height: 150.h,
          child: Row(children: [
            const Spacer()
,
            Image(
              image: const AssetImage(
                AssetsManager.logo,
              ),
              width: 200.w,
              fit: BoxFit.cover,
            ),
            const DefaultBackButton(),
          ]),
        ),
        const Text("عروض vip"),
        const Text("يتم زيادة أسعار العروض سنويا بنسبة 15%"),
        Expanded(
          child: ListView.builder(
            itemBuilder: (context, index) {
              return const LawyerOfferCard(
                description: "شنسييشستنبةنمكشسنةميةنميةنك",
                offerName: "العرض شتيلة",
                period: "3",
                price: "600",

              );
            },
            itemCount: 50,
          ),
        )
      ]),
    );
  }
}

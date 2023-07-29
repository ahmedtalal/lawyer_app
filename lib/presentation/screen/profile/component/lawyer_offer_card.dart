import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hokok/core/color_manager.dart';
import 'package:hokok/core/functions.dart';

import '../visa_card_data.dart';

class LawyerOfferCard extends StatelessWidget {
  final String offerName;
  final String period;
  final String price;
  final String description;

  const LawyerOfferCard(
      {Key? key,
      required this.offerName,
      required this.period,
      required this.price,
      required this.description})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5), // Shadow color
            spreadRadius:
                2, // The larger the value, the bigger the shadow spread
            blurRadius: 4, // The larger the value, the more blurry the shadow
            offset: Offset(0, 2), // Changes the position of the shadow
          ),
        ],
      ),
      padding: EdgeInsets.all(16),
      height: 160,
      width: double.infinity,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(
          children: [
            Text(
              offerName,
              style: TextStyle(
                fontSize: 16.sp,
              ),
            ),
            Spacer(),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: ColorManager.grey.withOpacity(.3),
              ),
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Row(children: [
                  Icon(Icons.access_time_outlined),
                  Text("لمدة شهر $period")
                ]),
              ),
            )
          ],
        ),
        Text("الغاء نسبة التطبيق بالكامل لمدة شهر واحد حتى يتم تجديد المدة",
            style: TextStyle(color: ColorManager.textGrey)),
        Row(
          children: [
            Row(
              children: [
                Text(
                  price,
                  style:
                      TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
                ),
                Text(
                  "ريال سعودى",
                  style: TextStyle(
                    fontSize: 16.sp,
                  ),
                ),
              ],
            ),
            Spacer(),
            InkWell(
              onTap: () {
                navigateTo(context, MyFormScreen());
              },
              child: Container(
                width: 85.w,
                padding: EdgeInsets.all(5),
                color: ColorManager.secondary,
                child: Center(
                  child: Text(
                    "شحن",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            )
          ],
        )
      ]),
    );
  }
}

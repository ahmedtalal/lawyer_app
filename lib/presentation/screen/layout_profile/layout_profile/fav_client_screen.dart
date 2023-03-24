import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hokok/core/color_manager.dart';

import '../../../../core/constant.dart';
import '../../../../core/routes_manager.dart';
import '../../../../core/shared_widget/text.dart';
import '../../../../core/values_manager.dart';

class FavClientScreen extends StatelessWidget {
  const FavClientScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: AppSize.s27,
                    backgroundColor: ConstantColor.secondaryColor,
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const DefaultText("فيصل", fontSize: AppSize.s21_4),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: const [
                          Icon(Icons.star,
                            size: AppSize.s15,),
                          Icon(Icons.star,
                            size: AppSize.s15,),
                          Icon(Icons.star,
                            size: AppSize.s15,),
                          Icon(Icons.star,
                            size: AppSize.s15,),
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      const DefaultText("مرحبا بكام انا فيصل حاصل علر.....",
                          fontSize: 11),
                      const SizedBox(
                        height: 5,
                      ),
                      Container(
                        width: 130,
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
                  const SizedBox(
                    width: 35,
                  ),
                  Container(
                    width: 70,
                    height: 30,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(10),
                      ),
                      color: ConstantColor.primaryColor,
                    ),
                    child: Row(
                      children: const [
                        Icon(
                          Icons.person,
                        ),
                        DefaultText("وكلني", fontSize: 10, color: Colors.white),
                      ],
                    ),
                  ),

                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

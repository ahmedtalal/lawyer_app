import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../core/color_manager.dart';
import '../../../../../core/values_manager.dart';
import '../../../../../presentation/screen/profile/component/profile_details_widget.dart';

class HomeLawyerScreen extends StatelessWidget {
  const HomeLawyerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          _appBar(context)
        ],
      ),

    );
  }
  Container _appBar(BuildContext context) => Container(
    width: double.infinity,
    height: AppSize.s234,
    color: ColorManager.primary,
    child: Row(
      children: [
       // const ProfileDetailsWidget(),
      ],
    ),
  );
}

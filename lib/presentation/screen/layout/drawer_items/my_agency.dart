
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hokok/core/assets_manager.dart';
import 'package:hokok/core/strings_manager.dart';

import '../../../../core/constant.dart';

class MyAgencies extends StatelessWidget {
  const MyAgencies({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        Icons.file_copy,
        size: 40,
          color: ConstantColor.whiteColor
      ),
      title:  Text(AppStrings.Myagencies, style: TextStyle(
          color: ConstantColor.whiteColor
      ),),
      onTap: () {},
    );
  }
}

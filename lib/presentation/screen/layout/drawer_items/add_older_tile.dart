
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hokok/core/assets_manager.dart';
import 'package:hokok/core/constant.dart';
import 'package:hokok/core/strings_manager.dart';

class AddOlderTile extends StatelessWidget {
  const AddOlderTile({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        Icons.add_circle_outlined,
        size: 40,
        color: ConstantColor.whiteColor,

      ),
      title: Text(AppStrings.addOlder,style: TextStyle(
        color: ConstantColor.whiteColor
      ),),
      onTap: () {},
    );
  }
}

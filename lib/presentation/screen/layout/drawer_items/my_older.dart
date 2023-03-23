
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hokok/core/assets_manager.dart';
import 'package:hokok/core/strings_manager.dart';

class MyOlder extends StatelessWidget {
  const MyOlder({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.asset(
        AssetsManager.logoImage,
        height: 40,
        fit: BoxFit.cover,
      ),
      title: const Text(AppStrings.Myagencies),
      onTap: () {},
    );
  }
}

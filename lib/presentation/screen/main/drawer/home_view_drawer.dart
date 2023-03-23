import 'package:flutter/material.dart';

import '../../../../core/constant.dart';
import '../../layout/drawer_items/add_older_tile.dart';
import '../../layout/drawer_items/my_agency.dart';


class HomeViewDrawer extends StatelessWidget {
  const HomeViewDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 1.5,
      color: ConstantColor.secondaryColor,
      padding: const EdgeInsets.symmetric(vertical: 30),
      child: ListView(
        children: const [
         // DrawerImage(),
          AddOlderTile(),
          Divider(),
          MyAgencies(),
          Divider(),

        ],
      ),
    );
  }
}

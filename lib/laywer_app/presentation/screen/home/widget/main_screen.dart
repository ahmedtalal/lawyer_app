import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hokok/laywer_app/presentation/screen/home/component/block/main_cubit_lawyer.dart';
import 'package:hokok/laywer_app/presentation/screen/home/component/block/main_states_lawyer.dart';
import 'package:hokok/laywer_app/presentation/screen/home/screens/lawyer_issues_screen.dart';

import '../../../../../core/color_manager.dart';
import '../../../../../core/strings_manager.dart';
import '../../massages/massages_screen.dart';
import '../../orders/orders_scree.dart';
import '../screens/home.dart';

class LawyerHomeScreen extends StatelessWidget {
  const LawyerHomeScreen({Key? key}) : super(key: key);

  static List<Widget> screens = [
    const HomeLawyerScreen(),
    const LawyerIssuesScreen(),
    const LawyerIssuesScreen(),
    const LawyerIssuesScreen(),
    const LawyerIssuesScreen(),
  ];
  static int currentIndex = 0;
  static int navSelectedIndex = 0;

  changeNavIndex(int index) {
    currentIndex = index;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainLawyerCubit, MainLawyerState>(
        builder: (context, state) {
      var cubit = context.read<MainLawyerCubit>();
      return Scaffold(
        body: cubit.screens[cubit.currentIndex],
        bottomNavigationBar: _bottomNav(),
      );
    });
  }

  MainBottomNavBar _bottomNav() => const MainBottomNavBar();
}

List<String> bottomNavStrings = [
  AppStrings.main,
  AppStrings.cases,
  AppStrings.massages,
  AppStrings.contactUs,
  AppStrings.exit,
];

List<IconData> bottomNavIcons = [
  FontAwesomeIcons.house,
  FontAwesomeIcons.magnifyingGlass,
  FontAwesomeIcons.fileLines,
  FontAwesomeIcons.headset,
  FontAwesomeIcons.arrowRightFromBracket,
];

class MainBottomNavBar extends StatefulWidget {
  const MainBottomNavBar({super.key});

  @override
  State<MainBottomNavBar> createState() => _MainBottomNavBarState();
}

class _MainBottomNavBarState extends State<MainBottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainLawyerCubit, MainLawyerState>(
      builder: (context, state) {
        return Container(
          height: 80,
          padding: const EdgeInsets.all(10),
          decoration: const BoxDecoration(
            color: ColorManager.secondary,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40),
              topRight: Radius.circular(40),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(
              bottomNavStrings.length,
              (index) => Row(
                children: [
                  SizedBox(
                    width: (MediaQuery.of(context).size.width / 5) - 20,
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          context.read<MainLawyerCubit>().changeNavIndex(index);
                        });
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            bottomNavIcons[index],
                            color:
                                context.read<MainLawyerCubit>().currentIndex ==
                                        index
                                    ? ColorManager.primary
                                    : ColorManager.white,
                          ),
                          const SizedBox(height: 5),
                          FittedBox(
                            child: Text(
                              bottomNavStrings[index],
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(
                                    color: context
                                                .read<MainLawyerCubit>()
                                                .navSelectedIndex ==
                                            index
                                        ? ColorManager.primary
                                        : ColorManager.white,
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

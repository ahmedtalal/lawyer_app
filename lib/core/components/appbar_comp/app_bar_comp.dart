import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hokok/core/color_manager.dart';
import 'package:hokok/core/components/appbar_comp/app_bar_widget.dart';
import 'package:hokok/presentation/blocs/profile_bloc/profile_bloc.dart';
import 'package:hokok/presentation/blocs/profile_bloc/profile_states.dart';

import '../../../laywer_app/presentation/screen/home/screens/home.dart';
import '../../../presentation/blocs/profile_bloc/profile_helper.dart';

class AppBarComp extends StatefulWidget {
  const AppBarComp({required this.onTap, required this.icon, super.key});
  final void Function()? onTap;
  final Widget? icon;
  @override
  State<AppBarComp> createState() => _AppBarCompState();
}

class _AppBarCompState extends State<AppBarComp> {
  @override
  void initState() {
    ProfileHelper.instance().getLawyerProfileAction(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileBloc, ProfileStates>(
      listener: (context, state) {
        if (state is ProfileFailedState) {
          state.authErrorMessage(context, state.error);
        }
      },
      builder: (context, state) {
        if (state is ProfileLoadedState) {
          return AppBarWidget(
            onClick: widget.onTap,
            icon: widget.icon,
            child: UserPorfileWidget(state: state.userEntity!),
          );
        } else if (state is ProfileFailedState) {
          return AppBarWidget(
            onClick: widget.onTap,
            icon: widget.icon,
            child: const UserPorfileWidget(state: null),
          );
        } else if (state is ProfileLoadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return Container();
      },
    );
  }
}

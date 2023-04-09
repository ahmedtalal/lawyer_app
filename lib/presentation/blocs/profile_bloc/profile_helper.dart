import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hokok/presentation/blocs/profile_bloc/profile_bloc.dart';
import 'package:hokok/presentation/blocs/profile_bloc/profile_events.dart';

class ProfileHelper {
  static ProfileHelper? _profileHelper;
  ProfileHelper._internal();
  static ProfileHelper instance() {
    if (_profileHelper == null) {
      return _profileHelper = ProfileHelper._internal();
    }
    return _profileHelper!;
  }

  String about = "";

  getLawyerProfileAction(BuildContext context) =>
      context.read<ProfileBloc>().add(GetLawyerProfileModelEvent());

  getCLientProfileAction(BuildContext context) =>
      context.read<ProfileBloc>().add(GetClientProfileModelEvent());

  updateClientProfile(BuildContext context, GlobalKey<FormState> formKey) {
    if (formKey.currentState!.validate()) {
      context.read<ProfileBloc>().add(UpdateClientProfileModelEvent());
    }
  }

  updateLawyerProfile(BuildContext context) =>
      context.read<ProfileBloc>().add(UpdateLawyerProfileModelEvent());
}

// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hokok/core/routes_manager.dart';
import 'package:hokok/data/models/user_model.dart';
import 'package:hokok/data/repositories/auth_api_repository.dart';
import 'package:hokok/domain/entities/user_entity.dart';
import 'package:hokok/domain/usecases/use_case_provider.dart';
import 'package:hokok/presentation/blocs/auth_bloc/auth_bloc.dart';
import 'package:hokok/presentation/blocs/auth_bloc/auth_events.dart';
import 'package:hokok/presentation/screen/intro/splash_screen.dart';
import 'package:hokok/presentation/screen/layout/layout_screen.dart';

class AuthHelper {
  static AuthHelper? _authHelper;
  AuthHelper._internal();
  static AuthHelper instance() {
    if (_authHelper == null) {
      return _authHelper = AuthHelper._internal();
    }

    return _authHelper!;
  }

  String optNumber = '';
  String phoneNumber = '';
  String type = "";
  String name = "";
  String email = "";
  String zone = "";
  String city = "";
  List<dynamic>? major;
  String? majorValue;

  UserEntity prepareLawyerInfo() => UserModel(
        type: type,
        name: name,
        email: email,
        phoneNumber: phoneNumber,
        zone: zone,
        city: city,
        major: [majorValue],
      );

  UserEntity prepareUserInfo() => UserModel(
        type: type,
        name: name,
        email: email,
        phoneNumber: phoneNumber,
        zone: zone,
        city: city,
      );

  onSendOptCodeAction(BuildContext context, GlobalKey<FormState> key) {
    if (key.currentState!.validate()) {
      context.read<AuthBloc>().add(AuthSendOptEvent());
    }
  }

  onCreateUserAccount(BuildContext context, GlobalKey<FormState> key) {
    if (key.currentState!.validate()) {
      context.read<AuthBloc>().add(CreateUserAccountEvent());
    }
  }

  onCreateLawyerAccount(BuildContext context, GlobalKey<FormState> key) {
    if (key.currentState!.validate()) {
      context.read<AuthBloc>().add(CreateLawyerAccountEvent());
    }
  }

  onLoginAction(BuildContext context, GlobalKey<FormState> key) {
    if (key.currentState!.validate()) {
      context.read<AuthBloc>().add(AuthLoginUsingPhoneEvent());
    }
  }

  Widget checkUserIsLoginActtion() {
    return UseCaseProvider.instance()
            .creator<AuthApiRepository>(AuthApiRepository.instance())
            .checkUserIsLogined()
        ? const LayoutScreen()
        : const SplashScreen();
  }

  onLogOutAction(BuildContext context) {
    context.read<AuthBloc>().add(LogOutEvent());
  }
}

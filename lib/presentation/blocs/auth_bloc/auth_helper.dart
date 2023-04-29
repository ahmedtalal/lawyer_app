// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hokok/data/models/user_model.dart';
import 'package:hokok/data/repositories/auth_api_repository.dart';
import 'package:hokok/data/services/local/user_info_local_storage.dart';
import 'package:hokok/domain/usecases/use_case_provider.dart';
import 'package:hokok/laywer_app/presentation/screen/home/widget/main_screen.dart';
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
  int? id;
  String? token;
  String? about = "";
  int? status;
  String? personalImage = "";
  String? createdAt = "";
  int? lawyerId;
  String? licenseImg = "";
  int? idNumber;
  String? idExpireDate = "";

  UserModelInfo prepareLawyerInfo() => UserModelInfo(
        id: id,
        token: token,
        type: type,
        name: name,
        email: email,
        phoneNumber: phoneNumber,
        zone: zone,
        city: city,
        majors: [int.parse(majorValue!)],
        status: status,
        personalImage: personalImage,
        createdAt: createdAt,
        lawyerId: lawyerId,
        licenseImg: licenseImg,
        idExpiryDate: idExpireDate,
        about: about,
        idNumber: idNumber,
      );

  UserModelInfo prepareClientInfo() => UserModelInfo(
        id: id,
        token: token,
        type: type,
        name: name,
        email: email,
        phoneNumber: phoneNumber,
        zone: zone,
        city: city,
        status: status,
        createdAt: createdAt,
        personalImage: personalImage,
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
        ? UserInfoLocalService.instance().getUserToken().userType == "client"
            ? const LayoutScreen()
            : const LawyerHomeScreen()
        : const SplashScreen();
  }

  onLogOutAction(BuildContext context) {
    context.read<AuthBloc>().add(LogOutEvent());
  }
}

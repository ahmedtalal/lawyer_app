// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hokok/data/models/user_model.dart';
import 'package:hokok/domain/entities/user_entity.dart';
import 'package:hokok/presentation/blocs/auth_bloc/auth_bloc.dart';
import 'package:hokok/presentation/blocs/auth_bloc/auth_events.dart';

class AuthBlocController {
  static AuthBlocController? _authBLocController;
  AuthBlocController._internal();
  static AuthBlocController instance() {
    if (_authBLocController == null) {
      return _authBLocController = AuthBlocController._internal();
    }

    return _authBLocController!;
  }

  String optNumber = '';
  String phoneNumber = '';
  String type = "";
  String name = "";
  String email = "";
  String zone = "";
  String city = "";
  List<dynamic> majors = [];

  onListenerOptNUmber(String? value) {
    optNumber = value!;
  }

  onListenerPhoneNumber(String? value) {
    phoneNumber = value!;
  }

  onTypeListener(String? value) {
    type = value!;
  }

  onNameListener(String? value) {
    name = value!;
  }

  onEmailListener(String? value) {
    email = value!;
  }

  onZoneListener(String? value) {
    zone = value!;
  }

  onCityListener(String? value) {
    city = value!;
  }

  onMajorListener(List<dynamic>? value) {
    majors = value!;
  }

  UserEntity prepateUserModel() => UserModel(
        type: type,
        name: name,
        email: email,
        phoneNumber: phoneNumber,
        zone: zone,
        city: city,
        majors: majors,
      );

  onSendOptCodeAction(BuildContext context, GlobalKey<FormState> key) {
    if (key.currentState!.validate()) {
      context.read<AuthBloc>().add(AuthSendOptEvent());
    }
  }

  onCreateAccount(BuildContext context, GlobalKey<FormState> key) {
    if (key.currentState!.validate()) {
      context.read<AuthBloc>().add(AuthRegisterEvent());
    }
  }
}

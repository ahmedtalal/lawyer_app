import 'dart:async';

import 'package:hokok/core/debug_prints.dart';
import 'package:hokok/core/response_api_model.dart';
import 'package:hokok/data/models/user_model.dart';
import 'package:hokok/data/repositories/auth_api_repository.dart';
import 'package:hokok/domain/usecases/use_case_provider.dart';
import 'package:hokok/presentation/blocs/auth_bloc/auth_helper.dart';
import 'package:hokok/presentation/blocs/auth_bloc/auth_events.dart';
import 'package:hokok/presentation/blocs/auth_bloc/auth_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthBloc extends Bloc<AuthEvents, AuthStates> {
  AuthBloc() : super(AuthInitState()) {
    on<AuthSendOptEvent>(sendLoginOptCode);
    on<CreateUserAccountEvent>(createUserAccount);
    on<CreateLawyerAccountEvent>(createLawyerAccount);
    on<AuthLoginUsingPhoneEvent>(login);
    on<LogOutEvent>(logout);
  }
  final _controller = AuthHelper.instance();

  Map<String, dynamic> _phoneMapModel() =>
      {"phone_number": _controller.phoneNumber};

  Map<String, dynamic> _userMapModel() =>
      UserModel.toJson1(_controller.prepareUserInfo());

  Map<String, dynamic> _lawyerMapModel() =>
      UserModel.toJson(_controller.prepareLawyerInfo());

  Map<String, dynamic> _phoneOtpMapModel() => {
        "phone_number": _controller.phoneNumber,
        "otp_code": _controller.optNumber,
      };

  FutureOr<void> sendLoginOptCode(AuthEvents events, Emitter emit) async {
    emit(AuthLoadingState());
    Map<String, dynamic> result = await UseCaseProvider.instance()
        .creator<AuthApiRepository>(AuthApiRepository.instance())
        .loginOpt(_phoneMapModel());
    if (result[mapKey] == successReposne) {
      emit(AuthSuccessState());
    } else {
      emit(AuthFailedState(result[mapValue]));
    }
  }

  FutureOr<void> login(AuthEvents events, Emitter emit) async {
    emit(AuthLoadingState());
    printInfo("the otp model is ${_phoneOtpMapModel()}");
    Map<String, dynamic> result = await UseCaseProvider.instance()
        .creator<AuthApiRepository>(AuthApiRepository.instance())
        .login(_phoneOtpMapModel());
    if (result[mapKey] == successReposne) {
      emit(AuthSuccessState());
    } else {
      emit(AuthFailedState(result[mapValue]));
    }
  }

  FutureOr<void> createUserAccount(AuthEvents events, Emitter emit) async {
    emit(AuthLoadingState());
    printInfo("the user model is ${_userMapModel()}");
    Map<String, dynamic> result = await UseCaseProvider.instance()
        .creator<AuthApiRepository>(AuthApiRepository.instance())
        .register(_userMapModel());
    if (result[mapKey] == successReposne) {
      emit(AuthSuccessState());
    } else {
      emit(AuthFailedState(result[mapValue]));
    }
  }

  FutureOr<void> createLawyerAccount(AuthEvents events, Emitter emit) async {
    emit(AuthLoadingState());
    printInfo("the lawyer model is ${_lawyerMapModel()}");
    Map<String, dynamic> result = await UseCaseProvider.instance()
        .creator<AuthApiRepository>(AuthApiRepository.instance())
        .register(_lawyerMapModel());
    if (result[mapKey] == successReposne) {
      emit(AuthSuccessState());
    } else {
      emit(AuthFailedState(result[mapValue]));
    }
  }

  FutureOr<void> logout(LogOutEvent event, Emitter<AuthStates> emit) async {
    bool result = await UseCaseProvider.instance()
        .creator<AuthApiRepository>(AuthApiRepository.instance())
        .logOut();
    if (result == true) {
      emit(LogOutSuccessState());
    } else {
      emit(AuthFailedState("error"));
    }
  }
}

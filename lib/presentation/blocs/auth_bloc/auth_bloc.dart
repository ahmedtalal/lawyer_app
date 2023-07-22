import 'dart:async';

import 'package:dio/dio.dart';
import 'package:hokok/core/debug_prints.dart';
import 'package:hokok/core/response_api_model.dart';
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

  Map<String, dynamic> _clientMapModel() =>
      _controller.prepareClientInfo().clientToJson();

  FormData _clientFormDataModel() =>
      _controller.prepareClientInfo().clientToFormData();

  Map<String, dynamic> _lawyerMapModel() =>
      _controller.prepareLawyerInfo().lawyerToJson();

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
      emit(AuthSuccessState(result: result[mapValue]));
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
      emit(AuthSuccessState(result: result[mapValue]));
    } else {
      emit(AuthFailedState(result[mapValue]));
    }
  }

  FutureOr<void> createUserAccount(AuthEvents events, Emitter emit) async {
    emit(AuthLoadingState());
    printInfo("the user model is ${_clientMapModel()}");
    final model = await AuthHelper.instance().ClientToFormData();
    Map<String, dynamic> result = await UseCaseProvider.instance()
        .creator<AuthApiRepository>(AuthApiRepository.instance())
        .register(model);
    if (result[mapKey] == successReposne) {
      emit(AuthSuccessState(result: result[mapValue]));
    } else {
      emit(AuthFailedState(result[mapValue]));
    }
  }

  FutureOr<void> createLawyerAccount(AuthEvents events, Emitter emit) async {
    emit(AuthLoadingState());
    final model = await AuthHelper.instance().lawyerToFormData();
    Map<String, dynamic> result = await UseCaseProvider.instance()
        .creator<AuthApiRepository>(AuthApiRepository.instance())
        .register(model);
    if (result[mapKey] == successReposne) {
      emit(AuthSuccessState(result: result[mapValue]));
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
      emit(LogOutFailedState("error"));
    }
  }
}

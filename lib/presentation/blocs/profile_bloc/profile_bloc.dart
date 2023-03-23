import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hokok/data/repositories/profile_repository.dart';
import 'package:hokok/domain/usecases/use_case_provider.dart';
import 'package:hokok/presentation/blocs/auth_bloc/auth_helper.dart';
import 'package:hokok/presentation/blocs/profile_bloc/profile_events.dart';
import 'package:hokok/presentation/blocs/profile_bloc/profile_states.dart';

class ProfileBloc extends Bloc<ProfileEvents, ProfileStates> {
  ProfileBloc() : super(ProfileInitState()) {
    on<GetProfileModelEvent>(getProfile);
    on<UpdateClientProfileModelEvent>(updateClientProfile);
    on<UpdateLawyerProfileModelEvent>(updateLawyerProfile);
  }

  FutureOr<void> getProfile(
      GetProfileModelEvent event, Emitter<ProfileStates> emit) async {
    emit(ProfileLoadingState());
    final result = await UseCaseProvider.instance()
        .creator<ProfileRepository>(ProfileRepository.instance())
        .getProfile();
    if (result == null) {
      emit(ProfileFailedState("no profile model"));
    } else {
      emit(ProfileLoadedState(result));
    }
  }

  FutureOr<void> updateClientProfile(
      UpdateClientProfileModelEvent event, Emitter<ProfileStates> emit) async {
    emit(ProfileLoadingActionState());
    final result = await UseCaseProvider.instance()
        .creator<ProfileRepository>(ProfileRepository.instance())
        .updateProfile(
            AuthHelper.instance().prepareClientInfo().clientToJson());
    if (result == false) {
      emit(ProfileFailedState("no profile model"));
    } else {
      emit(PorfileUpdatedSuccessState());
    }
  }

  FutureOr<void> updateLawyerProfile(
      UpdateLawyerProfileModelEvent event, Emitter<ProfileStates> emit) async {
    emit(ProfileLoadingActionState());
    final result = await UseCaseProvider.instance()
        .creator<ProfileRepository>(ProfileRepository.instance())
        .updateProfile(
            AuthHelper.instance().prepareLawyerInfo().lawyerToJson());
    if (result == false) {
      emit(ProfileFailedState("no profile model"));
    } else {
      emit(PorfileUpdatedSuccessState());
    }
  }
}

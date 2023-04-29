import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hokok/core/response_api_model.dart';
import 'package:hokok/data/repositories/certification_repository.dart';
import 'package:hokok/domain/usecases/use_case_provider.dart';
import 'package:hokok/presentation/blocs/certification_bloc/certification_events.dart';
import 'package:hokok/presentation/blocs/certification_bloc/certification_states.dart';

class CertificationBloc extends Bloc<CertificationEvents, CertificationStates> {
  CertificationBloc() : super(CertificationInitState()) {
    on<AddLawyerCertificationEvent>(addLawyerCertification);
    on<GetLawyerCertificationsEvent>(getLawyerCertification);
    on<DeleteCertificationEvent>(deleteLawyerCertification);
  }
String cerImg = '';
String cerId = '';
  FutureOr<void> addLawyerCertification(AddLawyerCertificationEvent event,
      Emitter<CertificationStates> emit) async {
    emit(LawyerCertificationActionState());
    final result = await UseCaseProvider.instance()
        .creator<CertificationRepository>(CertificationRepository.instance())
        .addLawyerCertification(cerImg);
    if (result[mapKey] == successReposne) {
      emit(AddLawyerCertificationSuccessState());
    } else {
      emit(AddLawyerCertificationFailedState());
    }
  }

  FutureOr<void> getLawyerCertification(GetLawyerCertificationsEvent event,
      Emitter<CertificationStates> emit) async {
    emit(CertificationLoadingState());
    final result = await UseCaseProvider.instance()
        .creator<CertificationRepository>(CertificationRepository.instance())
        .getLawyerCertifications();
    if (result.isNotEmpty) {
      emit(CertificationLoadedState(certifications: result));
    } else {
      emit(CertificationFailedLoadedState());
    }
  }

  FutureOr<void> deleteLawyerCertification(
      DeleteCertificationEvent event, Emitter<CertificationStates> emit) async {
    emit(LawyerCertificationActionState());
    final result = await UseCaseProvider.instance()
        .creator<CertificationRepository>(CertificationRepository.instance())
        .deleteLawyerCertification(cerId);
    if (result[mapKey] == successReposne) {
      emit(DeleteLawyerCertificationSuccessState());
    } else {
      emit(DeleteLawyerCertificationFailedState());
    }
  }
}

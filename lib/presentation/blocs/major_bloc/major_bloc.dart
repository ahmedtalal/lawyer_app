import 'dart:async';

import 'package:hokok/data/repositories/majors_api_repository.dart';
import 'package:hokok/domain/entities/major_entity.dart';
import 'package:hokok/domain/usecases/use_case_provider.dart';
import 'package:hokok/presentation/blocs/major_bloc/major_events.dart';
import 'package:hokok/presentation/blocs/major_bloc/major_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MajorBloc extends Bloc<MajorEvents, MajorStates> {
  MajorBloc() : super(MajorsInitState()) {
    on<GetAllMajorsEvent>(getMajors);
    on<GetAllSubMajorsEvent>(getSubMajors);
  }

  FutureOr<void> getMajors(
      GetAllMajorsEvent event, Emitter<MajorStates> emit) async {
    emit(LoadingState());
    List<MajorData>? majorList = await UseCaseProvider.instance()
        .creator<MajorsApiRepository>(MajorsApiRepository.instnace())
        .getAllMajors();
    if (majorList!.isNotEmpty) {
      emit(MajorSuccessLoadedState(majorList));
    } else {
      emit(FailedLoadedState("لا يوجد بيانات"));
    }
  }

  FutureOr<void> getSubMajors(
      GetAllSubMajorsEvent event, Emitter<MajorStates> emit) async {
    emit(LoadingState());
    final majorList = await UseCaseProvider.instance()
        .creator<MajorsApiRepository>(MajorsApiRepository.instnace())
        .getAllSubMajors();
    if (majorList.isNotEmpty) {
      emit(SubMajorSuccessLoadedState(majorList));
    } else {
      emit(FailedLoadedState("لا يوجد بيانات"));
    }
  }
}

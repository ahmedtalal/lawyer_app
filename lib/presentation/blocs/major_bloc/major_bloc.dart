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
  }

  FutureOr<void> getMajors(
      GetAllMajorsEvent event, Emitter<MajorStates> emit) async {
    List<MajorData>? majorList = await UseCaseProvider.instance()
        .creator<MajorsApiRepository>(MajorsApiRepository.instnace())
        .getAllMajors();
    if (majorList!.isNotEmpty) {
      emit(GetMajorsSuccessState(majorList));
    } else {
      emit(GetMajorsFailedState("لا يوجد بيانات"));
    }
  }
}

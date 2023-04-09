import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hokok/data/repositories/lawyer_repository.dart';
import 'package:hokok/domain/entities/lawyer_entity.dart';
import 'package:hokok/domain/usecases/use_case_provider.dart';
import 'package:hokok/presentation/blocs/lawyer_bloc/lawyer_events.dart';
import 'package:hokok/presentation/blocs/lawyer_bloc/lawyer_helper.dart';
import 'package:hokok/presentation/blocs/lawyer_bloc/lawyer_states.dart';

class LawyersBloc extends Bloc<LawyersEvetns, LawyerStates> {
  LawyersBloc() : super(LawyerInitState()) {
    on<GetAllLawyersEvent>(getAllLawyersFun);
  }

  FutureOr<void> getAllLawyersFun(
      GetAllLawyersEvent event, Emitter<LawyerStates> emit) async {
    emit(LawyersLoadingState());
    List<LawyerAttributes> lawyers = await UseCaseProvider.instance()
        .creator<LawyerRepository>(LawyerRepository.instance())
        .getAllLawyers(LawyerHelper.instance().lawyersModel1());
    if (lawyers.isEmpty) {
      emit(LawyerFailedRequestState("OOps:something is wrong^_^!"));
      emit(LawyersFailedLoadedState());
    } else {
      emit(LawyersLoadedState(lawyers: lawyers));
      LawyerHelper.instance().page++;
    }
  }
}

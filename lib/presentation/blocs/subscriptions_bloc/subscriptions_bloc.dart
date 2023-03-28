import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hokok/data/repositories/subscriptions_repository.dart';
import 'package:hokok/domain/usecases/use_case_provider.dart';
import 'package:hokok/presentation/blocs/subscriptions_bloc/subscriptions_events.dart';
import 'package:hokok/presentation/blocs/subscriptions_bloc/subscriptions_states.dart';

class SubscriptionsBloc extends Bloc<SubscriptionsEvents, SubscriptionsStates> {
  SubscriptionsBloc() : super(SubscriptionsInitialState()) {
    on<GetAllPlansEvent>(getAllPlans);
  }

  FutureOr<void> getAllPlans(
      GetAllPlansEvent event, Emitter<SubscriptionsStates> emit) async {
    emit(PlansLoadingState());
    final result = await UseCaseProvider.instance()
        .creator<SubscriptionsRepository>(SubscriptionsRepository.instance())
        .getAllPlans();
    if (result.isEmpty) {
      emit(FailedLoadedState("get all plans errror"));
    } else {
      emit(PlansLoadedState(result));
    }
  }
}

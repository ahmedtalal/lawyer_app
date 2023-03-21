import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hokok/data/repositories/feedback_repository.dart';
import 'package:hokok/domain/usecases/use_case_provider.dart';
import 'package:hokok/presentation/blocs/feedback_bloc/feedback_events.dart';
import 'package:hokok/presentation/blocs/feedback_bloc/feedback_helper.dart';
import 'package:hokok/presentation/blocs/feedback_bloc/feedback_states.dart';

class FeedBackBloc extends Bloc<FeedBackEvents, FeedBackStates> {
  FeedBackBloc() : super(FeedBackInitState()) {
    on<GetAllFeedBacksEvent>(getAllFeedBacks);
    on<AddFeedBackModelEvent>(addFeedBack);
  }

  FutureOr<void> getAllFeedBacks(
      GetAllFeedBacksEvent event, Emitter<FeedBackStates> emit) async {
    emit(FeedBackLoadingState());
    final result = await UseCaseProvider.instance()
        .creator<FeedbackRepository>(FeedbackRepository.instance())
        .getAllFeedbacks();
    if (result!.isEmpty) {
      emit(FeedBackFailedState("the empty list"));
      emit(FeedBackEmptyState());
    } else {
      emit(FeedBackLoadedState(result));
    }
  }

  FutureOr<void> addFeedBack(
      AddFeedBackModelEvent event, Emitter<FeedBackStates> emit) async {
    emit(FeedBackLoadingActionState());
    final result = await UseCaseProvider.instance()
        .creator<FeedbackRepository>(FeedbackRepository.instance())
        .addFeedback(FeedBackHelper.instance().prePareFeedBackModel());
    if (result == true) {
      emit(FeedbackSuccessState());
    } else {
      emit(FeedBackFailedState("add feedback failed"));
    }
  }
}

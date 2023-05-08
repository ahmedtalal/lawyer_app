import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hokok/core/debug_prints.dart';
import 'package:hokok/data/repositories/notification_repository.dart';
import 'package:hokok/domain/usecases/notification_usecase_provider.dart';
import 'package:hokok/presentation/blocs/notification_bloc/notification_events.dart';
import 'package:hokok/presentation/blocs/notification_bloc/notification_states.dart';

class NotificationBloc extends Bloc<NotificationEvents, NotificationStates> {
  NotificationBloc() : super(NotificationInitState()) {
    on<GetALlNotificationsEvent>(getAllNotifications);
  }
  int perPage = 10;
  FutureOr<void> getAllNotifications(
      GetALlNotificationsEvent event, Emitter<NotificationStates> emit) async {
    emit(NotificationLoadingState());
    final result = await NotificationUseCaseProvider.instance()
        .creator<NotificationRepository>(NotificationRepository.instance())
        .getAllNotifications(perPage);
    if(result.isNotEmpty){
      emit(NotificationsLoadedState(result));

    }else {
      emit(NotificationsFailedLoadedState("لا يوجد بيانات"));

    }
  }
}

import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hokok/data/repositories/order_respository.dart';
import 'package:hokok/domain/usecases/use_case_provider.dart';
import 'package:hokok/presentation/blocs/order_bloc/order_events.dart';
import 'package:hokok/presentation/blocs/order_bloc/order_helper.dart';
import 'package:hokok/presentation/blocs/order_bloc/order_states.dart';

class OrderBloc extends Bloc<OrderEvents, OrderStates> {
  OrderBloc() : super(OrdersInitState()) {
    on<GetPublicOrdersForLawyerEvent>(getPublicOrdersForLawyer);
    on<GetOwnOrdersForLawyerEvent>(getOwnOrdersForLawyer);
  }

  FutureOr<void> getPublicOrdersForLawyer(
      GetPublicOrdersForLawyerEvent event, Emitter<OrderStates> emit) async {
    emit(OrderLoadingState());
    final result = await UseCaseProvider.instance()
        .creator<OrderRepository>(OrderRepository.instance())
        .getPublicOrdersForLawyer(
            OrderHelper.instance().city, OrderHelper.instance().majorId);
    if (result.isEmpty) {
      emit(OrderFailedLoadedState("get public order for lawyer failed"));
    } else {
      emit(PublicOrderLoadedState(result));
    }
  }

  FutureOr<void> getOwnOrdersForLawyer(
      GetOwnOrdersForLawyerEvent event, Emitter<OrderStates> emit) async {
    emit(OrderLoadingState());
    final result = await UseCaseProvider.instance()
        .creator<OrderRepository>(OrderRepository.instance())
        .getOwnOrdersForLawyer(
          OrderHelper.instance().city,
          OrderHelper.instance().majorId,
          OrderHelper.instance().status,
        );
    if (result.isEmpty) {
      emit(OrderFailedLoadedState("get public order for lawyer failed"));
    } else {
      emit(OwnOrderLoadedState(result));
    }
  }
}

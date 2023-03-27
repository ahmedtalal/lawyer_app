import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hokok/core/response_api_model.dart';
import 'package:hokok/data/repositories/order_respository.dart';
import 'package:hokok/domain/usecases/use_case_provider.dart';
import 'package:hokok/presentation/blocs/order_bloc/order_events.dart';
import 'package:hokok/presentation/blocs/order_bloc/order_helper.dart';
import 'package:hokok/presentation/blocs/order_bloc/order_states.dart';

class OrderBloc extends Bloc<OrderEvents, OrderStates> {
  OrderBloc() : super(OrdersInitState()) {
    on<GetPublicOrdersForLawyerEvent>(getPublicOrdersForLawyer);
    on<GetOwnOrdersForLawyerEvent>(getOwnOrdersForLawyer);
    on<GetPrivateOrdersForLawyerEvent>(getPrivateOrdersForLawyer);
    on<GetRequestsOrdersForLawyerEvent>(getRequestOrdersForLawyer);
    on<UpdateOrdersForLawyerEvent>(updateOrdersForLawyer);
    on<AddOrderFeedbackForLawyerEvent>(addOrdersFeedbackForLawyer);
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
      emit(OrderFailedLoadedState("get own order for lawyer failed"));
    } else {
      emit(OwnOrderLoadedState(result));
    }
  }

  FutureOr<void> getPrivateOrdersForLawyer(
      GetPrivateOrdersForLawyerEvent event, Emitter<OrderStates> emit) async {
    emit(OrderLoadingState());
    final result = await UseCaseProvider.instance()
        .creator<OrderRepository>(OrderRepository.instance())
        .getPrivateOrdersForLawyer();
    if (result.isEmpty) {
      emit(OrderFailedLoadedState("get own order for lawyer failed"));
    } else {
      emit(PrivateOrderLoadedState(result));
    }
  }

  FutureOr<void> getRequestOrdersForLawyer(
      GetRequestsOrdersForLawyerEvent event, Emitter<OrderStates> emit) async {
    emit(OrderLoadingState());
    final result = await UseCaseProvider.instance()
        .creator<OrderRepository>(OrderRepository.instance())
        .getAllRequestesOrderForLawyer();
    if (result.isEmpty) {
      emit(OrderFailedLoadedState("get own order for lawyer failed"));
    } else {
      emit(RequestOrderLoadedState(result));
    }
  }

  FutureOr<void> updateOrdersForLawyer(
      UpdateOrdersForLawyerEvent event, Emitter<OrderStates> emit) async {
    emit(OrderLoadingState());
    final result = await UseCaseProvider.instance()
        .creator<OrderRepository>(OrderRepository.instance())
        .updateOrderForLawyer(
          OrderHelper.instance().status,
          OrderHelper.instance().orderId,
        );
    if (result[mapKey] == successReposne) {
      emit(OrderActionSuccessState());
    } else {
      emit(OrderActionFailedState());
    }
  }

  FutureOr<void> addOrdersFeedbackForLawyer(
      AddOrderFeedbackForLawyerEvent event, Emitter<OrderStates> emit) async {
    emit(OrderLoadingState());
    final result = await UseCaseProvider.instance()
        .creator<OrderRepository>(OrderRepository.instance())
        .addOrderFeedbackForLawyer(
          OrderHelper.instance().orderId,
          OrderHelper.instance().orderFeedback,
          OrderHelper.instance().orderRate,
        );
    if (result[mapKey] == successReposne) {
      emit(OrderActionSuccessState());
    } else {
      emit(OrderActionFailedState());
    }
  }
}

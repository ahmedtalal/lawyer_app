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
    on<CreateClientOrderEvent>(createClientOrder);
    on<CreatePrivateOrderEvent>(createPrivateOrder);
    on<GetAllClientOderEvent>(getAllOrdersForClient);
    on<GetClientOrderRequestEvent>(getOrdersRequestForClient);
    on<AcceptClientOrderEvent>(acceptClientOrder);
    on<UpdateCLientOrderStatusEvent>(updateClientOrderSatus);
    on<AddClientFeedbackEvent>(addClientFeedback);
    // on<SendLawyerRequestEvent>(sendLawyerRequest);
  }

  FutureOr<void> getPublicOrdersForLawyer(
      GetPublicOrdersForLawyerEvent event, Emitter<OrderStates> emit) async {
    emit(OrderLoadingState());
    final result = await UseCaseProvider.instance()
        .creator<OrderRepository>(OrderRepository.instance())
        .getPublicOrdersForLawyer(
            OrderHelper.instance().city, OrderHelper.instance().majorId);
    if (result.isEmpty) {
      emit(PublicOrderFailedLoadedState("لا يوجد بيانات"));
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
      emit(OwnOrderFailedLoadedState("لا يوجد بيانات"));
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
      emit(PrivateOrderFailedLoadedState("لا يوجد بيانات"));
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
      emit(RequesrOrderFailedLoadedState("لا يوجد بيانات"));
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
      emit(OrderActionFailedState(error: result[mapValue]));
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
      emit(OrderActionFailedState(error: result[mapValue]));
    }
  }

  FutureOr<void> createClientOrder(
      CreateClientOrderEvent event, Emitter<OrderStates> emit) async {
    emit(OrderLoadingState());
    final result = await UseCaseProvider.instance()
        .creator<OrderRepository>(OrderRepository.instance())
        .addOrderForClient(
          OrderHelper.instance().prepareClientOrderModel(),
        );
    if (result[mapKey] == successReposne) {
      emit(OrderActionSuccessState());
    } else {
      emit(OrderActionFailedState(error: result[mapValue]));
    }
  }

  FutureOr<void> createPrivateOrder(
      CreatePrivateOrderEvent event, Emitter<OrderStates> emit) async {
    emit(OrderLoadingState());
    final result = await UseCaseProvider.instance()
        .creator<OrderRepository>(OrderRepository.instance())
        .addOrderForClient(
          OrderHelper.instance().preparePrivateOrderModel(),
        );
    if (result[mapKey] == successReposne) {
      emit(OrderActionSuccessState());
    } else {
      emit(OrderActionFailedState(error: result[mapValue]));
    }
  }

  FutureOr<void> getAllOrdersForClient(
      GetAllClientOderEvent event, Emitter<OrderStates> emit) async {
    emit(OrderLoadingState());
    final result = await UseCaseProvider.instance()
        .creator<OrderRepository>(OrderRepository.instance())
        .getAllOrdersForClient();
    if (result.isEmpty) {
      emit(ClientOrderFailedLoadedState("لا يوجد بيانات"));
    } else {
      emit(ClientOrdersLoadedState(result));
    }
  }

  FutureOr<void> getOrdersRequestForClient(
      GetClientOrderRequestEvent event, Emitter<OrderStates> emit) async {
    print("start event");
    emit(OrderLoadingState());
    final result = await UseCaseProvider.instance()
        .creator<OrderRepository>(OrderRepository.instance())
        .getAllOrderRequestsForClient(OrderHelper.instance().orderId);
    if (result.isEmpty) {
      emit(OrderFailedLoadedState("لا يوجد بيانات"));
    } else {
      print("ClientOrdersRequestLoadedState");
      emit(ClientOrdersRequestLoadedState(result));
    }
  }

  FutureOr<void> acceptClientOrder(
      AcceptClientOrderEvent event, Emitter<OrderStates> emit) async {
    emit(OrderLoadingState());
    final result = await UseCaseProvider.instance()
        .creator<OrderRepository>(OrderRepository.instance())
        .acceptOrderRequestForClient(OrderHelper.instance().requestId);
    if (result[mapKey] == successReposne) {
      emit(OrderActionSuccessState());
    } else {
      emit(OrderActionFailedState(error: result[mapValue]));
    }
  }

  FutureOr<void> updateClientOrderSatus(
      UpdateCLientOrderStatusEvent event, Emitter<OrderStates> emit) async {
    emit(OrderLoadingState());
    final result = await UseCaseProvider.instance()
        .creator<OrderRepository>(OrderRepository.instance())
        .updateOrderStatusFOrClient(
          OrderHelper.instance().status,
          OrderHelper.instance().orderId,
        );
    if (result[mapKey] == successReposne) {
      emit(OrderActionSuccessState());
    } else {
      emit(OrderActionFailedState(error: result[mapValue]));
    }
  }

  FutureOr<void> addClientFeedback(
      AddClientFeedbackEvent event, Emitter<OrderStates> emit) async {
    emit(OrderLoadingState());
    final result = await UseCaseProvider.instance()
        .creator<OrderRepository>(OrderRepository.instance())
        .addOrderFeedbackForClient(
          OrderHelper.instance().orderId,
          OrderHelper.instance().orderFeedback,
          OrderHelper.instance().orderRate,
        );
    if (result[mapKey] == successReposne) {
      emit(OrderActionSuccessState());
    } else {
      emit(OrderActionFailedState(error: result[mapValue]));
    }
  }

  // FutureOr<void> sendLawyerRequest(
  //     SendLawyerRequestEvent event, Emitter<OrderStates> emit) async {
  //   emit(OrderLoadingState());
  //   final result = await UseCaseProvider.instance()
  //       .creator<OrderRepository>(OrderRepository.instance())
  //       .addOrderForLawyer(OrderHelper.instance().lawyerRequestModel());
  //   if (result[mapKey] == successReposne) {
  //     emit(OrderActionSuccessState());
  //   } else {
  //     emit(OrderActionFailedState(error: result[mapValue]));
  //   }
  // }
}

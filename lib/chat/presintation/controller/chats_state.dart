part of 'chats_cubit.dart';

abstract class ChatsState {}

class ChatsInitial extends ChatsState {}

class GetChatsLoadingState extends ChatsState {}

class GetChatsSuccessState extends ChatsState {
  List<ChatsEntity> chats;

  GetChatsSuccessState(this.chats);
}

class GetChatsFailureState extends ChatsState {}

class SubscribeToPlanLoadingState extends ChatsState {}

class SubscribeToPlanSuccessState extends ChatsState {
  String paymentGateway;

  SubscribeToPlanSuccessState(this.paymentGateway);
}

class SubscribeToPlanFailureState extends ChatsState {}



class GetlifeMessageSuccessState extends ChatsState {}

class GetMessagesLoadingState extends ChatsState {}

class GetMessagesSuccessState extends ChatsState {

  GetMessagesSuccessState();
}

class GetMessagesFailureState extends ChatsState {}
class SendMessageFailureState extends ChatsState {}

class SendMessageLoadingState extends ChatsState {}

class SendMessageSuccessState extends ChatsState {}

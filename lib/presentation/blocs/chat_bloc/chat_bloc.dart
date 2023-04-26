import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hokok/data/repositories/chat_repository.dart';
import 'package:hokok/domain/usecases/use_case_provider.dart';
import 'package:hokok/presentation/blocs/chat_bloc/chat_events.dart';
import 'package:hokok/presentation/blocs/chat_bloc/chat_states.dart';

class ChatBloc extends Bloc<ChatEvents, ChatStates> {
  ChatBloc() : super(ChatInitState()) {
    on<GetChatsEvent>(getChats);
    on<GetChatMessagesEvent>(getChatMessages);
  }
  Map<String, dynamic> chatModel = {};
  Map<String, dynamic> chatMessageModel = {};

  FutureOr<void> getChats(GetChatsEvent event, Emitter<ChatStates> emit) async {
    emit(GetChatsLoadingState());
    final result = await UseCaseProvider.instance()
        .creator<ChatRepository>(ChatRepository.instance())
        .getChats(chatModel);
    if (result.isEmpty) {
      emit(GetChatsFailedLoadedState("there is no data"));
    } else {
      emit(GetChatsLoadedState(result));
    }
  }

  FutureOr<void> getChatMessages(
      GetChatMessagesEvent event, Emitter<ChatStates> emit) async {
    emit(GetChatMessagesLoadingState());
    final result = await UseCaseProvider.instance()
        .creator<ChatRepository>(ChatRepository.instance())
        .getChatMessages(chatMessageModel);
    if (result.isEmpty) {
      emit(GetChatMessagesFailedLoadedState("there is no data"));
    } else {
      emit(GetChatMessagesLoadedState(result));
    }
  }
}

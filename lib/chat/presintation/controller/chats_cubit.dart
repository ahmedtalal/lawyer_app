import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pusher_channels_flutter/pusher_channels_flutter.dart';
import '../../../core/base_use_cse.dart';
import '../../../core/sl.dart';
import '../../../data/models/chat_message_model.dart';
import '../../../data/services/local/user_info_local_storage.dart';
import '../../data/parameter/send_message_parameter.dart';
import '../../domain/entities/chats.dart';
import '../../domain/entities/message.dart';
import '../../domain/use_cases/get_all_chats_usecase.dart';
import '../../domain/use_cases/get_all_messages.dart';
import '../../domain/use_cases/send_message_usecase.dart';
part 'chats_state.dart';

class ChatsCubit extends Cubit<ChatsState> {
  ChatsCubit() : super(ChatsInitial());
  final TextEditingController senMessageController = TextEditingController();

  Map<String, dynamic>? eventData;
  String? userCode;
  void onEvent(PusherEvent event) async {
    print("${UserInfoLocalService.instance().getUserCode()}");
    print("....................>>>>>>>>>>");
    print("....................>>>>>>>>>>${event.eventName}");
    if (event.eventName == "new-message-${UserInfoLocalService.instance().getUserCode()}") {
      eventData = json.decode(event.data);
      ChatMessageModel chatMessagesModel = ChatMessageModel.fromJson(eventData!);
      emit(GetlifeMessageSuccessState());
    }

  }
  Future<void> getAllChats() async {
    print('GET ALL Chats ........');
    emit(GetChatsLoadingState());
    final getAllChatsUseCase = sl<GetAllChatsUseCase>();
    (await getAllChatsUseCase(NoParams())
      ..fold((failure) {
        emit(GetChatsFailureState());
        print('failure');
      }, (data) {
        emit(GetChatsSuccessState(data));
        print('data');
      }));
  }
  List<MessageEntity> messages = [];

  Future<void> getChatMessage(int chatId) async {
    print('GET Chat Messages ........');
    emit(GetMessagesLoadingState());
    final getChatMessages = sl<GetAllMessagesUseCase>();
    (await getChatMessages(chatId)
      ..fold((failure) {
        emit(GetMessagesFailureState());
        print('failure');
      }, (data) {
        messages = data;
        emit(GetMessagesSuccessState());
        print('data');
      }));
  }

  Future<void> sendMessage(MessageParameter messageParameter) async {
    emit(SendMessageLoadingState());
    final sendMessageUseCase = sl<SendMessageUseCase>();
    (await sendMessageUseCase(messageParameter)
      ..fold((failure) {
        emit(SendMessageFailureState());
        print('failure');
      }, (data) {
        emit(SendMessageSuccessState());
        print('data');
      }));
  }
}

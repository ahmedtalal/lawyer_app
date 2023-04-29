import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hokok/presentation/blocs/chat_bloc/chat_bloc.dart';
import 'package:hokok/presentation/blocs/chat_bloc/chat_events.dart';

class ChatHelper {
  static ChatHelper? _chatHelper;
  ChatHelper._internal();
  static ChatHelper instance() {
    if (_chatHelper == null) {
      return _chatHelper = ChatHelper._internal();
    }
    return _chatHelper!;
  }

  Map<String, dynamic> chatModel = {};
  Map<String, dynamic> chatMessagesModel = {};

  getChatsFun(BuildContext context) {
    if (chatModel.isNotEmpty) {
      context.read<ChatBloc>().chatModel = chatModel;
      context.read<ChatBloc>().add(GetChatsEvent());
    }
  }

  getChatMessagesFun(BuildContext context) {
    if (chatMessagesModel.isNotEmpty) {
      context.read<ChatBloc>().chatMessageModel = chatMessagesModel;
      context.read<ChatBloc>().add(GetChatMessagesEvent());
    }
  }
}

import 'package:flutter/material.dart';
import 'package:hokok/core/routes_manager.dart';
import 'package:hokok/core/shared_widget/show_snackbar_shared_widget.dart';
import 'package:hokok/data/models/chat_message_model.dart';
import 'package:hokok/data/models/chat_model.dart';

abstract class ChatStates {}

class ChatInitState extends ChatStates {}

class GetChatsLoadingState extends ChatStates {
  Widget showLoadingWidget() => const Center(
        child: CircularProgressIndicator(),
      );
}

class GetChatsLoadedState extends ChatStates {
  final List<Chats> result;
  GetChatsLoadedState(this.result);
}

class GetChatsFailedLoadedState extends ChatStates {
  final dynamic error;
  GetChatsFailedLoadedState(this.error);
}

class SendMessageActionState extends ChatStates {}

class SendMessageActionSuccessState extends ChatStates {
  navigateTo(RouteSettings settings, BuildContext context) {
    return Navigator.of(context)
        .pushReplacement(RouteGenerator.getRoute(settings));
  }
}

class SendMessageActionFailedState extends ChatStates {
  showErrorMessage(BuildContext context, String title, Color backgroundColor) =>
      ScaffoldMessenger.of(context).showSnackBar(
        showSnakBarWidget(
          context,
          title,
          backgroundColor,
        ),
      );
}

class GetChatMessagesLoadingState extends ChatStates {
  Widget showLoadingWidget() => const Center(
        child: CircularProgressIndicator(),
      );
}

class GetChatMessagesLoadedState extends ChatStates {
  final List<ChatMessages> result;
  GetChatMessagesLoadedState(this.result);
}

class GetChatMessagesFailedLoadedState extends ChatStates {
  final dynamic error;
  GetChatMessagesFailedLoadedState(this.error);
}

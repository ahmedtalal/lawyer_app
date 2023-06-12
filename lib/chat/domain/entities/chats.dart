import 'package:hokok/chat/domain/entities/sender.dart';

import 'message.dart';

class ChatsEntity {
  final int conversationId;
  final String name;
  final int recieverId;
  // final int unreadMessagesCount;
  final MessageEntity lastMessage;
  ChatsEntity({
    required this.conversationId,
    required this.name,
    required this.recieverId,
    // required this.unreadMessagesCount,
    required this.lastMessage,
  });
}






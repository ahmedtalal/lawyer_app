import '../../domain/entities/chats.dart';
import 'message_model.dart';

class ChatsModel extends ChatsEntity {
  ChatsModel(
      {required super.conversationId,
      required super.name,
        required super.recieverId,

        required super.lastMessage});
  factory ChatsModel.fromJson(Map<String, dynamic> json) {
    return ChatsModel(
      conversationId: json['id']??0,
      name: json['name']??'',
      recieverId: json['receiver_id']??0,
      // unreadMessagesCount: json['unread_messages_count']??'',
      lastMessage: MessageModel.fromJson(json['last_message']),
    );
  }
}

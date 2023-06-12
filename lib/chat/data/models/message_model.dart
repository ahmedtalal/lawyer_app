
import 'package:hokok/chat/data/models/sender_model.dart';

import '../../domain/entities/message.dart';

class MessageModel extends MessageEntity {
  MessageModel(
      {required super.messageID,
      // required super.isSeen,
      required super.direction,
      required super.createdAt,
      required super.message,
      required super.sender});
  factory MessageModel.fromJson(Map<String, dynamic> json) {
    return MessageModel(
      messageID: json['chat_id'] ?? 0,
      // isSeen: json['is_seen'] ?? '',
      direction: json["direction"] ?? '',
      createdAt: json['created_at'] ?? 0,
      message: json['content'] ?? '',
      sender: SenderModel.fromJson(json["sender"]) ,
    );
  }
}

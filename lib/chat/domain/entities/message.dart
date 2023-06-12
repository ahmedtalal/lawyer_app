import 'package:hokok/chat/domain/entities/sender.dart';

class MessageEntity {
  final int messageID;
  // final int isSeen;
  final String direction;
  final String createdAt;
  final String message;
  final SenderEntitiy sender;

  MessageEntity(
      {required this.direction,
      required this.messageID,
      // required this.isSeen,
      required this.createdAt,
      required this.message,
      required this.sender});
}

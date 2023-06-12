import 'package:dartz/dartz.dart';
import '../../../core/failure.dart';
import '../../data/parameter/send_message_parameter.dart';
import '../entities/chats.dart';
import '../entities/message.dart';

abstract class BaseChatsRepository {
  Future<Either<FailureTest, List<ChatsEntity>>> getAllChats();
  Future<Either<FailureTest, List<MessageEntity>>> getChatMessages(int chatId);
  Future<Either<FailureTest, void>> sendMessage(MessageParameter messageParameter);
}

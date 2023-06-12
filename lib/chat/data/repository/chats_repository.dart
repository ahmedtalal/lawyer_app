import 'package:dartz/dartz.dart';
import '../../../core/failure.dart';
import '../../domain/entities/chats.dart';
import '../../domain/entities/message.dart';
import '../../domain/repository/base_chat_repo.dart';
import '../data_source/chat_remote_datasource.dart';
import '../parameter/send_message_parameter.dart';

class ChatsRepositoryImpl implements BaseChatsRepository {
  final ChatsRemoteDataSource _chatsRemoteDataSource;

  ChatsRepositoryImpl(this._chatsRemoteDataSource);

  @override
  Future<Either<FailureTest, List<ChatsEntity>>> getAllChats() async {
    try {
      List<ChatsEntity> chats = await _chatsRemoteDataSource.getAllChats();
      return Right(chats);
    } on Exception catch (e) {
      return const Left(
        ServerFailure(
          errorModel: ErrorModel(),
        ),
      );
    }
  }
  @override
  Future<Either<FailureTest, List<MessageEntity>>> getChatMessages(int chatId) async {
    try {
      List<MessageEntity> messages = await _chatsRemoteDataSource.getChatMessage(chatId);
      return Right(messages);
    } on Exception catch (e) {
      return const Left(
        ServerFailure(
          errorModel: ErrorModel(),
        ),
      );
    }
  }
  @override
  Future<Either<FailureTest, void>> sendMessage(MessageParameter messageParameter) async {
    try {
      var result = await _chatsRemoteDataSource.sendMessage(
        messageParameter,
      );
      return Right(result);
    } on Exception catch (e) {
      return const Left(
        ServerFailure(
          errorModel: ErrorModel(),
        ),
      );
    }
  }
}

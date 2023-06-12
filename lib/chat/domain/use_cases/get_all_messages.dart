import 'package:dartz/dartz.dart';
import '../../../core/base_use_cse.dart';
import '../../../core/failure.dart';
import '../entities/message.dart';
import '../repository/base_chat_repo.dart';

class GetAllMessagesUseCase extends BaseUseCase<List<MessageEntity>, int> {
  final BaseChatsRepository baseChatsRepo;

  GetAllMessagesUseCase(this.baseChatsRepo);

  @override
  Future<Either<FailureTest, List<MessageEntity>>> call(int chatID) async {
    return await baseChatsRepo.getChatMessages(chatID);
  }
}

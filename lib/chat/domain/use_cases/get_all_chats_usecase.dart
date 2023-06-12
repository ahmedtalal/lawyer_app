import 'package:dartz/dartz.dart';
import '../../../core/base_use_cse.dart';
import '../../../core/failure.dart';
import '../entities/chats.dart';
import '../repository/base_chat_repo.dart';

class GetAllChatsUseCase extends BaseUseCase<List<ChatsEntity>,NoParams>{
  final BaseChatsRepository baseChatsRepo;

  GetAllChatsUseCase(this.baseChatsRepo);

  @override
  Future<Either<FailureTest, List<ChatsEntity>>> call(NoParams noParams) async{
    return await baseChatsRepo.getAllChats();
  }
}
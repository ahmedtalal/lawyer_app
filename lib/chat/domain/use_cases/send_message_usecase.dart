import 'package:dartz/dartz.dart';
import '../../../core/base_use_cse.dart';
import '../../../core/failure.dart';
import '../../data/parameter/send_message_parameter.dart';
import '../repository/base_chat_repo.dart';


class SendMessageUseCase extends BaseUseCase<void,MessageParameter >{
  final BaseChatsRepository baseChatsRepo;
  SendMessageUseCase(this.baseChatsRepo);

  @override
  Future<Either<FailureTest, void>> call( params) async{
    return await baseChatsRepo.sendMessage(params);
  }
}
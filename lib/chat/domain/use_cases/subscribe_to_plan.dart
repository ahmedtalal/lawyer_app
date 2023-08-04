import 'package:dartz/dartz.dart';
import 'package:hokok/chat/data/parameter/visa_card_parameter.dart';
import '../../../core/base_use_cse.dart';
import '../../../core/failure.dart';
import '../../data/parameter/send_message_parameter.dart';
import '../repository/base_chat_repo.dart';


class SubscribeToPlanUseCase extends BaseUseCase<String,VisaCardParameter >{
  final BaseChatsRepository baseChatsRepo;
  SubscribeToPlanUseCase(this.baseChatsRepo);

  @override
  Future<Either<FailureTest, String>> call( params) async{
    return await baseChatsRepo.subscribeToPlan(params);
  }
}
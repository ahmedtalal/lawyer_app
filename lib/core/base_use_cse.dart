import 'package:dartz/dartz.dart';
import 'failure.dart';

abstract class BaseUseCase<T,Params>{
  Future<Either<FailureTest,T>> call(Params params);
}

class NoParams{

}





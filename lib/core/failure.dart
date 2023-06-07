
abstract class FailureTest  {
  final ErrorModel errorModel;

  const FailureTest({required this.errorModel});


}

class ServerFailure extends FailureTest {
  const ServerFailure({required super.errorModel});
}

class ErrorModel  {
  final String? errorMessage;
  final int? statusCode;
  const ErrorModel({ this.errorMessage,this.statusCode});

  }


class Failure<T>{
  final T errorModel;
  Failure(this.errorModel);
}
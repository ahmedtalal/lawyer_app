import 'package:hokok/domain/entities/major_entity.dart';

abstract class MajorStates {}

class MajorsInitState extends MajorStates {}

class GetMajorsSuccessState extends MajorStates {
  List<MajorData>? majorsList;
  GetMajorsSuccessState(this.majorsList);
}

class GetMajorsFailedState extends MajorStates {
  String? errorMessage;
  GetMajorsFailedState(this.errorMessage);
}

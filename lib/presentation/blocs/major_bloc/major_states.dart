import 'package:hokok/domain/entities/major_entity.dart';
import 'package:hokok/domain/entities/sub_majors_entity.dart';

abstract class MajorStates {}

class MajorsInitState extends MajorStates {}

class LoadingState extends MajorStates {}

class MajorSuccessLoadedState extends MajorStates {
  List<MajorData>? majorsList;
  MajorSuccessLoadedState(this.majorsList);
}

class SubMajorSuccessLoadedState extends MajorStates {
  List<SubMajorsInfoModel> subMajorsList;
  SubMajorSuccessLoadedState(this.subMajorsList);
}

class FailedLoadedState extends MajorStates {
  String? errorMessage;
  FailedLoadedState(this.errorMessage);
}

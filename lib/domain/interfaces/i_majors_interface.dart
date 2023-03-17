import 'dart:async';

abstract class IMajorsInterface {
  FutureOr<dynamic> getAllMajors();
  FutureOr<dynamic> getAllSubMajors();
}

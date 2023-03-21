import 'dart:async';

abstract class IFeedbackInterface {
  FutureOr<dynamic> getAllFeedbacks();
  FutureOr<dynamic> getSpecialFeedback(var data);
  FutureOr<dynamic> addFeedback(var model);
  FutureOr<dynamic> deleteFeedback(var index);
}

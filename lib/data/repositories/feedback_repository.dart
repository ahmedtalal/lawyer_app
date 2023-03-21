import 'dart:async';

import 'package:hokok/data/models/feed_back_model.dart';
import 'package:hokok/data/services/api/feedback_api_service.dart';
import 'package:hokok/domain/interfaces/i_feedback_interface.dart';

class FeedbackRepository implements IFeedbackInterface {
  static FeedbackRepository? _feedbackRepository;
  FeedbackRepository._internal();
  static FeedbackRepository instance() {
    if (_feedbackRepository == null) {
      return _feedbackRepository = FeedbackRepository._internal();
    }
    return _feedbackRepository!;
  }

  @override
  FutureOr<bool> addFeedback(model) async {
    return await FeedbackAPiService.instance().addFeedBack(model);
  }

  @override
  FutureOr deleteFeedback(index) {
    // TODO: implement deleteFeedback
    throw UnimplementedError();
  }

  @override
  FutureOr<List<FeedBackData>?> getAllFeedbacks() async {
    return await FeedbackAPiService.instance().getAllFeedbacks();
  }

  @override
  FutureOr getSpecialFeedback(data) {
    // TODO: implement getSpecialFeedback
    throw UnimplementedError();
  }
}

import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hokok/data/models/feed_back_model.dart';
import 'package:hokok/data/services/local/user_info_local_storage.dart';
import 'package:hokok/presentation/blocs/feedback_bloc/feedback_bloc.dart';
import 'package:hokok/presentation/blocs/feedback_bloc/feedback_events.dart';

class FeedBackHelper {
  static FeedBackHelper? _feedBackHelper;
  FeedBackHelper._internal();
  static FeedBackHelper instance() {
    if (_feedBackHelper == null) {
      return _feedBackHelper = FeedBackHelper._internal();
    }
    return _feedBackHelper!;
  }

  int rate = 1;
  String feedBackMessage = "";
  int? userId = UserInfoLocalService.instance().getUserToken().id;

  FeedBackData prePareFeedBackModel() => FeedBackData(
        id: userId,
        rate: rate,
        feedback: feedBackMessage,
      );

  getAllFeedBacksAction(BuildContext context) {
    context.read<FeedBackBloc>().add(GetAllFeedBacksEvent());
  }

  addFeedBackAction(BuildContext context, GlobalKey<FormState> key) {
    if (key.currentState!.validate()) {
      context.read<FeedBackBloc>().add(AddFeedBackModelEvent());
    }
  }
}

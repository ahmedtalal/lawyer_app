import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hokok/data/services/local/user_info_local_storage.dart';
import 'package:hokok/domain/entities/comment_entity.dart';
import 'package:hokok/presentation/blocs/comment_bloc/comment_bloc.dart';
import 'package:hokok/presentation/blocs/comment_bloc/comment_events.dart';

class CommentHelper {
  static CommentHelper? _commentHelper;
  CommentHelper._internal();
  static CommentHelper instance() {
    if (_commentHelper == null) {
      return _commentHelper = CommentHelper._internal();
    }
    return _commentHelper!;
  }

  int? userId = UserInfoLocalService.instance().getUserToken().id;
  String type = "";
  String description = "";

  CommentData prepareCommentModel() => CommentData(
        id: userId,
        type: type,
        description: description,
      );

  getAllCommentsAction(BuildContext context) {
    context.read<CommentBloc>().add(GetAllCommentsEvent());
  }

  addCommentAction(BuildContext context, GlobalKey<FormState> key) {
    if (key.currentState!.validate()) {
      context.read<CommentBloc>().add(AddCommentEvent());
    }
  }
}

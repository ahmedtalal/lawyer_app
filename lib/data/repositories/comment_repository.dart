import 'dart:async';

import 'package:hokok/domain/entities/comment_entity.dart';
import 'package:hokok/domain/interfaces/i_comment_interface.dart';

import '../services/api/comments_api_service.dart';

class CommentsRepository implements ICommentInterface {
  static CommentsRepository? _commentsRepository;
  CommentsRepository._internal();
  static CommentsRepository instance() {
    if (_commentsRepository == null) {
      return _commentsRepository = CommentsRepository._internal();
    }
    return _commentsRepository!;
  }

  @override
  FutureOr<bool> addComment(model) async {
    return await CommentsAPiService.instance().addCommentAPiService(model);
  }

  @override
  FutureOr deleteComment(index) {
    // TODO: implement deleteComment
    throw UnimplementedError();
  }

  @override
  FutureOr<List<CommentData>?> getAllComments() async {
    return await CommentsAPiService.instance().getAllCommentsAPiService();
  }

  @override
  FutureOr getSpecialComment(index) {
    // TODO: implement getSpecialComment
    throw UnimplementedError();
  }

  @override
  FutureOr updateCommentModel(model) {
    // TODO: implement updateCommentModel
    throw UnimplementedError();
  }
}

import 'dart:async';

abstract class ICommentInterface {
  FutureOr<dynamic> getAllComments();
  FutureOr<dynamic> getSpecialComment(var index);
  FutureOr<dynamic> addComment(var model);
  FutureOr<dynamic> deleteComment(var index);
  FutureOr<dynamic> updateCommentModel(var model);
}

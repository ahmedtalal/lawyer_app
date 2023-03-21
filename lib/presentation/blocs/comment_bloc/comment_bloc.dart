import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hokok/data/repositories/comment_repository.dart';
import 'package:hokok/domain/usecases/use_case_provider.dart';
import 'package:hokok/presentation/blocs/comment_bloc/comment_events.dart';
import 'package:hokok/presentation/blocs/comment_bloc/comment_helper.dart';
import 'package:hokok/presentation/blocs/comment_bloc/comment_states.dart';

class CommentBloc extends Bloc<CommentEvents, CommentStates> {
  CommentBloc() : super(CommentInitState()) {
    on<GetAllCommentsEvent>(getAllComments);
    on<AddCommentEvent>(addComment);
  }

  FutureOr<void> getAllComments(
      GetAllCommentsEvent event, Emitter<CommentStates> emit) async {
    emit(CommentLoadingState());
    final result = await UseCaseProvider.instance()
        .creator<CommentsRepository>(CommentsRepository.instance())
        .getAllComments();
    if (result!.isEmpty) {
      emit(CommentFailedState("there is no comments"));
    } else {
      emit(CommentLoadedState(result));
    }
  }

  FutureOr<void> addComment(
      AddCommentEvent event, Emitter<CommentStates> emit) async {
    emit(CommentLoadingActionState());
    final result = await UseCaseProvider.instance()
        .creator<CommentsRepository>(CommentsRepository.instance())
        .addComment(CommentHelper.instance().prepareCommentModel());
    if (result == true) {
      emit(CommentSuccessState());
    } else {
      emit(CommentFailedState("add feedback failed"));
    }
  }
}

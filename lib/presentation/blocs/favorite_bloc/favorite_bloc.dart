import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hokok/core/response_api_model.dart';
import 'package:hokok/data/repositories/favorite_repository.dart';
import 'package:hokok/domain/usecases/use_case_provider.dart';
import 'package:hokok/presentation/blocs/favorite_bloc/favorite_events.dart';
import 'package:hokok/presentation/blocs/favorite_bloc/favorite_states.dart';

class FavoriteBloc extends Bloc<FavoriteEvents, FavoriteStates> {
  FavoriteBloc() : super(FavoriteInitState()) {
    on<AddToFavoriteEvent>(addToFavorite);
    on<GetAllFavoritesEvent>(getAllFavorite);
    on<DeleteFavoriteEvent>(deleteFavorite);
  }
  String favId = '';
  FutureOr<void> addToFavorite(AddToFavoriteEvent event,
      Emitter<FavoriteStates> emit) async {
    emit(FavoriteActionState());
    final result = await UseCaseProvider.instance()
        .creator<FavoriteRepository>(FavoriteRepository.instance())
        .addToFavorite(favId);
    if (result[mapKey] == successReposne) {
      emit(AddToFavoriteSuccessState());
    } else {
      emit(AddToFavoriteFailedState());
    }
  }

  FutureOr<void> getAllFavorite(GetAllFavoritesEvent event,
      Emitter<FavoriteStates> emit) async {
    emit(FavoriteLoadingState());
    final result = await UseCaseProvider.instance()
        .creator<FavoriteRepository>(FavoriteRepository.instance())
        .getAllFavorite();
    if (result.isNotEmpty) {
      emit(FavoriteLoadedState(favorites: result));
    } else {
      emit(FavoriteFailedLoadedState());
    }
  }

  FutureOr<void> deleteFavorite(
      DeleteFavoriteEvent event, Emitter<FavoriteStates> emit) async {
    emit(FavoriteActionState());
    final result = await UseCaseProvider.instance()
        .creator<FavoriteRepository>(FavoriteRepository.instance())
        .deleteFavorite(favId);
    if (result[mapKey] == successReposne) {
      emit(DeleteFavoriteSuccessState());
    } else {
      emit(DeleteFavoriteFailedState());
    }
  }
}

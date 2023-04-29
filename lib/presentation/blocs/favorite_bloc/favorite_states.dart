import 'package:flutter/material.dart';
import 'package:hokok/core/routes_manager.dart';
import 'package:hokok/core/shared_widget/show_snackbar_shared_widget.dart';
import 'package:hokok/data/models/favorite_model.dart';

abstract class FavoriteStates {}

class FavoriteInitState extends FavoriteStates {}

class FavoriteLoadingState extends FavoriteStates {
  Widget waitingLoadingData(BuildContext context) => const Center(
    child: CircularProgressIndicator(),
  );
}

class FavoriteLoadedState extends FavoriteStates {
  List<FavoriteInfoModel>? favorites;
  FavoriteLoadedState({required this.favorites});
}

class FavoriteFailedLoadedState extends FavoriteStates {
  showErrorMessage(BuildContext context, String title, Color backgroundColor) =>
      ScaffoldMessenger.of(context).showSnackBar(
        showSnakBarWidget(
          context,
          title,
          backgroundColor,
        ),
      );
}

class FavoriteActionState extends FavoriteStates {}

class AddToFavoriteSuccessState extends FavoriteStates {
  goTo(RouteSettings settings, BuildContext context) {
    return Navigator.of(context)
        .pushReplacement(RouteGenerator.getRoute(settings));
  }
}

class AddToFavoriteFailedState extends FavoriteStates {
  showErrorMessage(BuildContext context, String title, Color backgroundColor) =>
      ScaffoldMessenger.of(context).showSnackBar(
        showSnakBarWidget(
          context,
          title,
          backgroundColor,
        ),
      );
}

class DeleteFavoriteSuccessState extends FavoriteStates{
  goTo(RouteSettings settings, BuildContext context) {
    return Navigator.of(context)
        .pushReplacement(RouteGenerator.getRoute(settings));
  }
}

class DeleteFavoriteFailedState extends FavoriteStates {
  showErrorMessage(BuildContext context, String title, Color backgroundColor) =>
      ScaffoldMessenger.of(context).showSnackBar(
        showSnakBarWidget(
          context,
          title,
          backgroundColor,
        ),
      );
}
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hokok/presentation/blocs/favorite_bloc/favorite_bloc.dart';
import 'package:hokok/presentation/blocs/favorite_bloc/favorite_events.dart';

class FavoriteHelper{
  static FavoriteHelper? _favoriteHelper;
  FavoriteHelper._internal();
  static FavoriteHelper instance(){
    if(_favoriteHelper == null){
      return _favoriteHelper = FavoriteHelper._internal();
    }
    return _favoriteHelper!;
  }

  String favId = '';

  addToFavoriteFun(BuildContext context,GlobalKey<FormState> form){
    if(form.currentState!.validate()){
      context.read<FavoriteBloc>().favId = favId;
      context.read<FavoriteBloc>().add(AddToFavoriteEvent());
    }
  }

  getAllFavoritesFun(BuildContext context){
    context.read<FavoriteBloc>().add(GetAllFavoritesEvent());
  }

  deleteFavoriteFun(BuildContext context){
    if(favId.isNotEmpty){
      context.read<FavoriteBloc>().favId = favId;
      context.read<FavoriteBloc>().add(DeleteFavoriteEvent());
    }
  }
}
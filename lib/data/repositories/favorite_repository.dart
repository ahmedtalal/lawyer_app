import 'package:hokok/data/models/favorite_model.dart';
import 'package:hokok/data/services/api/favorite_api_services.dart';
import 'package:hokok/domain/interfaces/i_favorite_interface.dart';

class FavoriteRepository implements IFavoriteInterface{
  static FavoriteRepository? _favoriteRepository;
  FavoriteRepository._internal();
  static FavoriteRepository instance(){
    if(_favoriteRepository == null){
      return _favoriteRepository = FavoriteRepository._internal();
    }
    return _favoriteRepository!;
  }
  @override
  Future<Map<String,dynamic>> addToFavorite(model) async{
   return await FavoriteApiServices.instance().addToFavoriteSer(model);
  }

  @override
  Future<Map<String,dynamic>> deleteFavorite(model) async{
    return await FavoriteApiServices.instance().deleteFavoriteSer(model);
  }

  @override
  Future<List<FavoriteInfoModel>> getAllFavorite() async{
    return await FavoriteApiServices.instance().getAllFavoritesSer();
  }

}
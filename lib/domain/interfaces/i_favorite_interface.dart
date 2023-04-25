abstract class IFavoriteInterface{
  Future<dynamic> getAllFavorite();
  Future<dynamic> addToFavorite(var model);
  Future<dynamic> deleteFavorite(var model);
}
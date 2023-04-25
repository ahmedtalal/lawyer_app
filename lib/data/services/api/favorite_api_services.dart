import 'package:dio/dio.dart';
import 'package:hokok/config/dio_exception.dart';
import 'package:hokok/core/api_paths.dart';
import 'package:hokok/core/debug_prints.dart';
import 'package:hokok/core/response_api_model.dart';
import 'package:hokok/data/models/favorite_model.dart';
import 'package:hokok/data/services/api/crud_helper.dart';
import 'package:hokok/data/services/local/user_info_local_storage.dart';

class FavoriteApiServices {
  static FavoriteApiServices? _favoriteApiServices;
  FavoriteApiServices._internal();
  static FavoriteApiServices instance() {
    if (_favoriteApiServices == null) {
      return _favoriteApiServices = FavoriteApiServices._internal();
    }
    return _favoriteApiServices!;
  }

  Future<List<FavoriteInfoModel>> getAllFavoritesSer() async {
    try {
      Options options = Options(headers: {
        "authorization":
            "Bearer ${UserInfoLocalService.instance().getUserToken().token}"
      });
      Response response = await CrudApiHelper.instance.getRequest(
        path: GET_ALL_FAVORITES_REQUEST_PATH,
        options: options,
      );
      printDone("the get all favorite success => ${response.data}");
      return FavoriteModel.fromJson(response.data).data!;
    } on DioError catch (error) {
      final message = DioExceptions.dioErrorHandling(error);
      printError("the get all favorite error from dio catch => $message");
      return [];
    } catch (e) {
      printError("the get all favorites error from catch => $e");
      return [];
    }
  }

  Future<Map<String, dynamic>> addToFavoriteSer(String favId) async {
    try {
      Options options = Options(headers: {
        "authorization":
            "Bearer ${UserInfoLocalService.instance().getUserToken().token}"
      });
      Response response = await CrudApiHelper.instance.postRequest(
        path: ADD_TO_FAVORITE_REQUEST_PATH,
        data: {"favorite_id":favId},
        options: options,
      );
      printDone("the add to favorite success => ${response.data}");
      return successRequest(response.data);
    } on DioError catch (error) {
      final message = DioExceptions.dioErrorHandling(error);
      printError("the add to favorite error from catch => $message");
      return failedRequest(message);
    } catch (e) {
      printError("the add to favorite error from catch => $e");
      return failedRequest(e.toString());
    }
  }

  Future<Map<String,dynamic>> deleteFavoriteSer(String favId)async{
    try{
      Options options = Options(headers: {
        "authorization":
        "Bearer ${UserInfoLocalService.instance().getUserToken().token}"
      });
      Response response = await CrudApiHelper.instance.deleteRequest(
        path: DELETE_FAVORITE_REQUEST_PATH+favId,
        options: options,
      );
      printDone("the delete favorite success => ${response.data}");
      return successRequest(response.data);
    }on DioError catch(error){
      final message = DioExceptions.dioErrorHandling(error);
      printError("the delete to favorite error from dio catch => $message");
      return failedRequest(message);
    } catch(e){
      printError("the delete favorite error from catch => $e");
      return failedRequest(e.toString());
    }
  }
}

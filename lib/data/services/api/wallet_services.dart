import 'dart:async';
import 'package:dio/dio.dart';
import 'package:hokok/config/dio_exception.dart';
import 'package:hokok/core/api_paths.dart';
import 'package:hokok/core/debug_prints.dart';
import 'package:hokok/data/models/transaction_model.dart';
import 'package:hokok/data/services/api/api_helper.dart';
import 'package:hokok/data/services/local/user_info_local_storage.dart';
import 'package:hokok/domain/entities/transaction_entity.dart';
import 'package:hokok/domain/entities/wallet_entity.dart';

class WalletServices {
  static WalletServices? _walletServices;
  WalletServices._internal();
  static WalletServices instance() {
    if (_walletServices == null) {
      return _walletServices = WalletServices._internal();
    }
    return _walletServices!;
  }

  FutureOr<WalletEntity?> getAllWalletSer() async {
    try {
      Options options = Options(headers: {
        "authorization":
            "Bearer ${UserInfoLocalService.instance().getUserToken().token}"
      });
      Response response = await CurdApiHelper.instance.getRequest(
        path: GET_ALL_WALLET_REQUEST_PATH,
        options: options,
      );
      printDone("the get  wallet success => ${response.data}");
      return response.data;
    } on DioError catch (error) {
      String message = DioExceptions.dioErrorHandling(error);
      printError("the get wallet error from dio catch => $message");
      return null;
    } catch (e) {
      printError("the get wallet error from dio catch => $e");
      return null;
    }
  }

  FutureOr<List<TransactionInfoModel>> getAllTransactionsSer(int status) async {
    try {
      Options options = Options(headers: {
        "authorization":
            "Bearer ${UserInfoLocalService.instance().getUserToken().token}"
      });
      Response response = await CurdApiHelper.instance.getRequest(
        path: GET_ALL_TRANSACTIONS_REQUEST_PATH,
        options: options,
        parameters: {"status": status},
      );
      printDone("the get  all transactions success => ${response.data}");
      return TransactionModel.fromJson(response.data).data!;
    } on DioError catch (error) {
      String message = DioExceptions.dioErrorHandling(error);
      printError("the get all transactions error from dio catch => $message");
      return [];
    } catch (e) {
      printError("the get all transactions error from  catch => $e");
      return [];
    }
  }
}

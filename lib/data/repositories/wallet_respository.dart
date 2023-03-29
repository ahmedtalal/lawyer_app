import 'package:hokok/domain/entities/transaction_entity.dart';
import 'package:hokok/domain/entities/wallet_entity.dart';
import 'dart:async';
import 'package:hokok/domain/interfaces/i_wallet_interface.dart';
import 'package:hokok/data/services/api/wallet_services.dart';

class WalletRepository implements IWalletInterface {
  static WalletRepository? _walletRepository;
  WalletRepository._internal();
  static WalletRepository instance() {
    if (_walletRepository == null) {
      return _walletRepository = WalletRepository._internal();
    }
    return _walletRepository!;
  }

  @override
  FutureOr<WalletEntity?> getWallet() async {
    return await WalletServices.instance().getAllWalletSer();
  }

  @override
  FutureOr<List<TransactionInfoModel>> getAllTransactions(int status) async {
    return await WalletServices.instance().getAllTransactionsSer(status);
  }
}

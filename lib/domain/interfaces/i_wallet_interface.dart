import 'dart:async';

import 'package:hokok/domain/entities/transaction_entity.dart';
import 'package:hokok/domain/entities/wallet_entity.dart';

abstract class IWalletInterface {
  FutureOr<WalletEntity?> getWallet();
  FutureOr<List<TransactionInfoModel>> getAllTransactions(int status);
}

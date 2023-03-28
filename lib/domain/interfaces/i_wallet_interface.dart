import 'dart:async';

import 'package:hokok/domain/entities/wallet_entity.dart';

abstract class IWalletInterface {
  FutureOr<WalleEntity?> getWallet();
}

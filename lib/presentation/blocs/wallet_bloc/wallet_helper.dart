import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hokok/presentation/blocs/wallet_bloc/wallet_bloc.dart';
import 'package:hokok/presentation/blocs/wallet_bloc/wallet_events.dart';

class WalletHlper {
  static WalletHlper? _walletHlper;
  WalletHlper._internal();
  static WalletHlper instance() {
    if (_walletHlper == null) {
      return _walletHlper = WalletHlper._internal();
    }
    return _walletHlper!;
  }

  int status = 0;
  onGetWalletAction(BuildContext context) =>
      context.read<WalletBloc>().add(GetWalletEvent());

  onGetAllTransactionsAction(BuildContext context) =>
      context.read<WalletBloc>().add(GetAllTransactionsEvent());
}

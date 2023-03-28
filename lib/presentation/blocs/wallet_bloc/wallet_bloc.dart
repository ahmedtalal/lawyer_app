import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hokok/presentation/blocs/wallet_bloc/wallet_events.dart';
import 'package:hokok/presentation/blocs/wallet_bloc/wallet_states.dart';

class WalletBloc extends Bloc<WalletEvents, WalletStates> {
  WalletBloc() : super(WalletInitialState()) {
    on<GetWalletEvent>(getWalletModel);
  }

  FutureOr<void> getWalletModel(
      GetWalletEvent event, Emitter<WalletStates> emit) async {}
}

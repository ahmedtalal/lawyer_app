import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hokok/data/repositories/wallet_respository.dart';
import 'package:hokok/domain/usecases/use_case_provider.dart';
import 'package:hokok/presentation/blocs/wallet_bloc/wallet_events.dart';
import 'package:hokok/presentation/blocs/wallet_bloc/wallet_helper.dart';
import 'package:hokok/presentation/blocs/wallet_bloc/wallet_states.dart';

class WalletBloc extends Bloc<WalletEvents, WalletStates> {
  WalletBloc() : super(WalletInitialState()) {
    on<GetWalletEvent>(getWalletModel);
    on<GetAllTransactionsEvent>(getAllTransactions);
  }

  FutureOr<void> getWalletModel(
      GetWalletEvent event, Emitter<WalletStates> emit) async {
    emit(WalletLoadingState());
    final result = await UseCaseProvider.instance()
        .creator<WalletRepository>(WalletRepository.instance())
        .getWallet();
    if (result == null) {
      emit(WalletFailedLoadedState());
    } else {
      emit(WalletLoadedState(result));
    }
  }

  FutureOr<void> getAllTransactions(
      GetAllTransactionsEvent event, Emitter<WalletStates> emit) async {
    emit(WalletLoadingState());
    final result = await UseCaseProvider.instance()
        .creator<WalletRepository>(WalletRepository.instance())
        .getAllTransactions(WalletHlper.instance().status);
    if (result.isEmpty) {
      emit(WalletFailedLoadedState());
    } else {
      emit(TransactionsLoadedState(result));
    }
  }
}

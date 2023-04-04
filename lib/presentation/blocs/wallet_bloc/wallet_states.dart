import 'package:flutter/material.dart';
import 'package:hokok/core/shared_widget/show_snackbar_shared_widget.dart';
import 'package:hokok/domain/entities/transaction_entity.dart';
import 'package:hokok/domain/entities/wallet_entity.dart';

abstract class WalletStates {}

class WalletInitialState extends WalletStates {}

class WalletLoadingState extends WalletStates {}

class WalletLoadedState extends WalletStates {
  WalletEntity entity;
  WalletLoadedState(this.entity);
}

class TransactionsLoadedState extends WalletStates {
  List<TransactionInfoModel> transactoins;
  TransactionsLoadedState(this.transactoins);
}

class WalletFailedLoadedState extends WalletStates {}

class WalletFailedState extends WalletStates {
  dynamic error;
  WalletFailedState(this.error);

  authErrorMessage(BuildContext context, String title) {
    ScaffoldMessenger.of(context).showSnackBar(
      showSnakBarWidget(context, title, Colors.red),
    );
  }
}

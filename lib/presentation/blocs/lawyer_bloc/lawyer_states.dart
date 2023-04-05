import 'package:flutter/material.dart';
import 'package:hokok/core/shared_widget/empty_data_shared_widget.dart';
import 'package:hokok/core/shared_widget/show_snackbar_shared_widget.dart';
import 'package:hokok/domain/entities/lawyer_entity.dart';

abstract class LawyerStates {}

class LawyerInitState extends LawyerStates {}

class LawyersLoadingState extends LawyerStates {}

class LawyersLoadedState extends LawyerStates {
  List<LawyerAttributes> lawyers;
  LawyersLoadedState({required this.lawyers});
}

class LawyersFailedLoadedState extends LawyerStates {
  Widget showEmptyList() => emptyDataSharedWidget();
}

class LawyerFailedRequestState extends LawyerStates {
  String error;
  LawyerFailedRequestState(this.error);
  authErrorMessage(BuildContext context, String title) {
    ScaffoldMessenger.of(context).showSnackBar(
      showSnakBarWidget(context, title, Colors.red),
    );
  }
}

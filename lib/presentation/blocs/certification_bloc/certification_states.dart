import 'package:flutter/material.dart';
import 'package:hokok/core/routes_manager.dart';
import 'package:hokok/core/shared_widget/show_snackbar_shared_widget.dart';
import 'package:hokok/data/models/certification_model.dart';

abstract class CertificationStates {}

class CertificationInitState extends CertificationStates {}

class CertificationLoadingState extends CertificationStates {
  Widget waitingLoadingData(BuildContext context) => const Center(
        child: CircularProgressIndicator(),
      );
}

class CertificationLoadedState extends CertificationStates {
  List<CertificationInfoModel>? certifications;
  CertificationLoadedState({required this.certifications});
}

class CertificationFailedLoadedState extends CertificationStates {
  showErrorMessage(BuildContext context, String title, Color backgroundColor) =>
      ScaffoldMessenger.of(context).showSnackBar(
        showSnakBarWidget(
          context,
          title,
          backgroundColor,
        ),
      );
}

class LawyerCertificationActionState extends CertificationStates {}

class AddLawyerCertificationSuccessState extends CertificationStates {
  goTo(RouteSettings settings, BuildContext context) {
    return Navigator.of(context)
        .pushReplacement(RouteGenerator.getRoute(settings));
  }
}

class AddLawyerCertificationFailedState extends CertificationStates {
  showErrorMessage(BuildContext context, String title, Color backgroundColor) =>
      ScaffoldMessenger.of(context).showSnackBar(
        showSnakBarWidget(
          context,
          title,
          backgroundColor,
        ),
      );
}

class DeleteLawyerCertificationSuccessState extends CertificationStates{
  goTo(RouteSettings settings, BuildContext context) {
    return Navigator.of(context)
        .pushReplacement(RouteGenerator.getRoute(settings));
  }
}

class DeleteLawyerCertificationFailedState extends CertificationStates {
  showErrorMessage(BuildContext context, String title, Color backgroundColor) =>
      ScaffoldMessenger.of(context).showSnackBar(
        showSnakBarWidget(
          context,
          title,
          backgroundColor,
        ),
      );
}
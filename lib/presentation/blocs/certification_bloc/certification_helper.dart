import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hokok/presentation/blocs/certification_bloc/certification_bloc.dart';
import 'package:hokok/presentation/blocs/certification_bloc/certification_events.dart';

class CertificationHelper{
  static CertificationHelper? _certificationHelper;
  CertificationHelper._internal();
  static CertificationHelper instance(){
    if(_certificationHelper == null){
      return _certificationHelper = CertificationHelper._internal();
    }
    return _certificationHelper!;
  }

  String cerImg = '';
  String cerId = '';

  addLawyerCertificationFun(BuildContext context,GlobalKey<FormState> form){
    if(form.currentState!.validate()){
      context.read<CertificationBloc>().cerImg = cerImg;
      context.read<CertificationBloc>().add(AddLawyerCertificationEvent());
    }
  }

  getLawyerCertificationsFun(BuildContext context){
    context.read<CertificationBloc>().add(GetLawyerCertificationsEvent());
  }

  deleteLawyerCertificationsFun(BuildContext context){
    if(cerId.isNotEmpty){
      context.read<CertificationBloc>().cerId = cerId;
      context.read<CertificationBloc>().add(DeleteCertificationEvent());
    }
  }
}
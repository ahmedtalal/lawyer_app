import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hokok/presentation/blocs/lawyer_bloc/lawyer_bloc.dart';
import 'package:hokok/presentation/blocs/lawyer_bloc/lawyer_events.dart';

class LawyerHelper {
  static LawyerHelper? _lawyerHelper;
  LawyerHelper._internal();
  static LawyerHelper instance() {
    if (_lawyerHelper == null) {
      return _lawyerHelper = LawyerHelper._internal();
    }
    return _lawyerHelper!;
  }

  int page = 1;
  int perPage = 10;
  int majorId = 0;
  String city = '';
  double rate = 0;
  bool isLoadMoreLawyer = false;
  ScrollController scrollController = ScrollController();

  Map<String, dynamic> lawyersModel1() => {
        "page": page,
        "per_page": perPage,
      };
  Map<String, dynamic> lawyersModel2() => {
        "page": page,
        "per_page": perPage,
        "major_id": majorId,
        "city": city,
        "rate": rate,
      };
  onGetAllLawyers(BuildContext context) =>
      context.read<LawyersBloc>().add(GetAllLawyersEvent());

  ScrollController paginationListener(BuildContext context) {
    return scrollController
      ..addListener(() {
        if (scrollController.offset ==
                scrollController.position.maxScrollExtent &&
            !isLoadMoreLawyer) {
          isLoadMoreLawyer = true;
          LawyerHelper.instance().onGetAllLawyers(context);
        }
      });
  }
}

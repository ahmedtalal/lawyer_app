import 'dart:async';

import 'package:dio/dio.dart';
import 'package:hokok/config/dio_exception.dart';
import 'package:hokok/core/debug_prints.dart';
import 'package:hokok/core/response_api_model.dart';
import 'package:hokok/data/models/lawyer_model.dart';
import 'package:hokok/data/services/api/crud_helper.dart';
import 'package:hokok/data/services/local/user_info_local_storage.dart';
import 'package:hokok/domain/entities/lawyer_entity.dart';

import '../../../core/api_paths.dart';

class LawyerApiService {
  static LawyerApiService? _lawyerApiService;
  LawyerApiService._internal();
  static LawyerApiService instance() {
    if (_lawyerApiService == null) {
      return _lawyerApiService = LawyerApiService._internal();
    }
    return _lawyerApiService!;
  }

  FutureOr<List<LawyerAttributes>> getAllLawyersApiSer(
      Map<String, dynamic> data) async {
    try {
      Options options = Options(headers: {
        "authorization":
            "Bearer ${UserInfoLocalService.instance().getUserToken().token}"
      });
      Response response = await CrudApiHelper.instance.getRequest(
        path: GET_ALL_LAWYERS_REQUEST_PATH,
        options: options,
        parameters: data,
      );
      printDone("the get all lawyers success => ${response.data}");
      return LawyerModel.fromJson(response.data).data!.lawyers!;
    } on DioError catch (error) {
      String message = DioExceptions.dioErrorHandling(error);
      printError("the get all lawyers error from dio error => $message");
      return [];
    } catch (e) {
      printError("the get all lawyers errors from catchs => $e");
      return [];
    }
  }

  FutureOr<Map<String, dynamic>> getStatisticsSer() async {
    try {
      Options options = Options(headers: {
        "authorization":
            "Bearer ${UserInfoLocalService.instance().getUserToken().token}"
      });
      Response response = await CrudApiHelper.instance.getRequest(
        path: GET_ALL_statistics_REQUEST_PATH,
        options: options,
      );
      printDone("the get all statistics success => ${response.data}");
      return successRequest(response.data);
    } on DioError catch (error) {
      final message = DioExceptions.dioErrorHandling(error);
      printError("the get statistics error from dio catch => $message");
      return failedRequest(message);
    } catch (e) {
      printError("the get statistics error from dio catch => $e");
      return failedRequest(e.toString());
    }
  }
}

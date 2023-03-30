import 'dart:async';

import 'package:dio/dio.dart';
import 'package:hokok/config/dio_exception.dart';
import 'package:hokok/core/api_paths.dart';
import 'package:hokok/core/debug_prints.dart';
import 'package:hokok/data/models/major_model.dart';
import 'package:hokok/data/models/sub_majors_model.dart';
import 'package:hokok/data/services/api/api_helper.dart';
import 'package:hokok/domain/entities/major_entity.dart';
import 'package:hokok/domain/entities/sub_majors_entity.dart';

class MajorsApiService {
  static MajorsApiService? _majorsApiService;
  MajorsApiService._internal();
  static MajorsApiService instance() {
    if (_majorsApiService == null) {
      return _majorsApiService = MajorsApiService._internal();
    }
    return _majorsApiService!;
  }

  Future<List<MajorData>?> getAllMajorsApiService() async {
    try {
      Response response =
          await CurdApiHelper.instance.getRequest(path: ALL_MAJOR_REQUEST_PATH);
      printDone(
          "the majors are ${MajorsModel.fromJson(response.data).data!.length}");
      return MajorsModel.fromJson(response.data).data;
    } on DioError catch (error) {
      String message = DioExceptions.dioErrorHandling(error);
      printError("get all majors error from dio catch are $message");
      return [];
    } catch (e) {
      printError("get all majors error from dio catch are $e");
      return [];
    }
  }

  FutureOr<List<SubMajorsInfoModel>> getAllSUbMajors() async {
    try {
      Response response = await CurdApiHelper.instance
          .getRequest(path: ALL_SUB_MAJOR_REQUEST_PATH);
      printDone("get all sub majors success ${response.data}");
      return SubMajorsModel.fromJson(response.data).data!;
    } on DioError catch (error) {
      String message = DioExceptions.dioErrorHandling(error);
      printError("the get all sub majors failed from dio catch $message");
      return [];
    } catch (e) {
      printError("the get all sub majors from catch $e");
      return [];
    }
  }
}

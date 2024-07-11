
import 'dart:async';
import 'dart:developer';

import 'package:climbers/custom_error.dart';
import 'package:climbers/models/app_documents/app_documents.dart';
import 'package:climbers/models/app_settings/app_settings.dart';
import 'package:climbers/services/app/app_service_contract.dart';
import 'package:climbers/utils/dio.dart';
import 'package:climbers/utils/errors.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class AppService implements IAppService{
  final Dio _dio;

  @override
  Future<AppSettings> getBranchSettings({int? branchId}) async{
    try{
      if(branchId == null || branchId == 0){
        branchId = null;
      }
      final response = await _dio.get("$apiHost/app/getData", queryParameters: {
        'branch_id': branchId
      }..removeWhere((key, value) => value == null));
      final data = throwCustomErrorOrGetData(response);
      return AppSettings.fromJson(data);
    }on DioException catch(e){
      if(e.message?.contains("SocketException") ?? false){
        throw const CustomError(code: 200, message: 'Network error', localizationCode: 'socket-exception');
      }else if(e.error is TimeoutException){
        throwTimeoutCustomError();
      }
      rethrow;
    }
  }

  @override
  Future<AppDocuments> getTermsAndServices({int? branchId}) async{
    try{
      if(branchId == null || branchId == 0){
        branchId = null;
      }
      final termsResponse = await _dio.get("$apiHost/app/getLegalTexts", queryParameters: {
        'branch_id': branchId
      }..removeWhere((key, value) => value == null));
      final documents = throwCustomErrorOrGetData(termsResponse);

      return AppDocuments.fromJson(documents);
    }on DioException catch(e){
      if(e.message?.contains("SocketException") ?? false){
        throw const CustomError(code: 200, message: 'Network error', localizationCode: 'socket-exception');
      }else if(e.error is TimeoutException){
        throwTimeoutCustomError();
      }
      rethrow;
    }
  }

  @override
  Future<String?> getBase64Logo({int? branchId}) async{
    try{
      if(branchId == null || branchId == 0){
        branchId = null;
      }
      final response = await _dio.get("$apiHost/app/getLogo", queryParameters: {
        'branch_id': branchId
      }..removeWhere((key, value) => value == null));
      if(response.data.toString().isEmpty){
        return null;
      }
      final data = throwCustomErrorOrGetData(response);
      return data["logo"];
    }on DioException catch(e){
      if(e.message?.contains("SocketException") ?? false){
        throw const CustomError(code: 200, message: 'Network error', localizationCode: 'socket-exception');
      }else if(e.error is TimeoutException){
        throwTimeoutCustomError();
      }
      return null;
    }on CustomError catch(_){
      return null;
    }
  }

  const AppService({
    required Dio dio,
  }) : _dio = dio;

}
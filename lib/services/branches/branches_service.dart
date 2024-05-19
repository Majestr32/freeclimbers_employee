
import 'dart:async';
import 'dart:developer';
import 'dart:ui';

import 'package:freeclimbers_employee/models/access_token/access_token.dart';
import 'package:freeclimbers_employee/services/branches/branches_service_contract.dart';
import 'package:dio/dio.dart';

import '../../custom_error.dart';
import '../../models/branch/branch.dart';
import '../../utils/dio.dart';
import '../../utils/errors.dart';

class BranchesService implements IBranchService{
  final Dio _dio;

  Dio _authenticatedDio(AccessToken token,{String? contentType}) {
    final headers = {'Authorization': 'Bearer ${token.accessToken}', "Content-Type": contentType ?? "application/x-www-form-urlencoded"};
    final options = _dio.options.copyWith(headers: headers);
    Dio dio = Dio(options)..interceptors.addAll(_dio.interceptors);
    return dio;
  }

  @override
  Future<void> addBranch({required String branchId, required AccessToken token}) async{
    try{
      final response = await _authenticatedDio(token).post("$apiHost/member/addBranch", data: {
        'id': branchId
      });
      final data = throwCustomErrorOrGetData(response);
      if(data is Iterable){
        return;
      }
      if(data['validate'] == false){
        throw CustomError(code: 200, targets: (data["errors"] as Map<String,dynamic>).keys.toList(), message: ((data["errors"] as Map<String,dynamic>).values.first as List).first);
      }
    } on DioError catch(e){
      if(e.message.contains("SocketException")){
        throw CustomError(code: 200, message: 'Network error', localizationCode: 'socket-exception');
      }else if(e.error is TimeoutException){
        throwTimeoutCustomError();
      }
      rethrow;
    }
  }

  @override
  Future<List<Branch>> listBranches({required AccessToken token}) async{
    try{
      final response = await _authenticatedDio(token).get("$apiHost/member/getBranchList");
      final data = throwCustomErrorOrGetData(response);
      return (data as List).map((e) => Branch.fromJson(e)).toList();
    } on DioError catch(e){
      if(e.message.contains("SocketException")){
        throw CustomError(code: 200, message: 'Network error', localizationCode: 'socket-exception');
      }else if(e.error is TimeoutException){
        throwTimeoutCustomError();
      }
      rethrow;
    }
  }

  @override
  Future<void> removeBranch({required String branchId, required AccessToken token}) async{
    try{
      await _authenticatedDio(token).post("$apiHost/member/deleteBranch", data: {
        'id': branchId
      });
    } on DioError catch(e){
      if(e.message.contains("SocketException")){
        throw CustomError(code: 200, message: 'Network error', localizationCode: 'socket-exception');
      }else if(e.error is TimeoutException){
        throwTimeoutCustomError();
      }
      rethrow;
    }
  }

  @override
  Future<String> getBranchLogo({required String branchId}) async{
    try{
      log("getting logo");
      final response = await _dio.get("$apiHost/branch/getLogo", queryParameters: {
        'id': branchId
      });
      log(response.data.toString());
      return response.data["data"]["logo"];
    } on DioError catch(e){
      if(e.message.contains("SocketException")){
        throw CustomError(code: 200, message: 'Network error', localizationCode: 'socket-exception');
      }else if(e.error is TimeoutException){
        throwTimeoutCustomError();
      }
      rethrow;
    }
  }

  const BranchesService({
    required Dio dio,
  }) : _dio = dio;
}
import 'dart:async';

import 'package:climbers/models/branch_qr_data/branch_qr_data.dart';
import 'package:climbers/services/qr_code/qr_code_service_contract.dart';
import 'package:dio/dio.dart';

import '../../custom_error.dart';
import '../../utils/dio.dart';
import '../../utils/errors.dart';

class QrCodeService implements IQrCodeService{
  final Dio _dio;

  ///Throws CustomError(code: 400, message: 'Branch not found', localizationCode: 'branch-not-found'); if branch not found
  @override
  Future<BranchQrData> getDataFromQrCode({required String code}) async{
    try{
      final response = await _dio.get("$apiHost/branch/getByCode", queryParameters: {
        'code': code
      });
      if(response.data["code"] == 400){
        throw CustomError(code: 400, message: 'Branch not found', localizationCode: 'branch-not-found');
      }
      return BranchQrData.fromJson(response.data["data"]);
    } on DioException catch(e){
      if(e.message?.contains("SocketException") ?? false){
        throw CustomError(code: 200, message: 'Network error', localizationCode: 'socket-exception');
      }else if(e.error is TimeoutException){
        throwTimeoutCustomError();
      }
      rethrow;
    }
  }

  const QrCodeService({
    required Dio dio,
  }) : _dio = dio;
}
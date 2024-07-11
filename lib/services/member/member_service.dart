import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'package:universal_io/io.dart';
import 'dart:typed_data';

import 'package:climbers/consts/api.dart';
import 'package:climbers/custom_error.dart';
import 'package:climbers/models/access_token/access_token.dart';
import 'package:climbers/models/member_data/member_data.dart';
import 'package:climbers/models/member_registration_code/member_registration_code.dart';
import 'package:climbers/services/member/member_service_contract.dart';
import 'package:climbers/utils/dio.dart';
import 'package:climbers/utils/errors.dart';
import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';
import 'package:path_provider/path_provider.dart';

class MemberService implements IMemberService{
  final Dio _dio;

  Dio _authenticatedDio(AccessToken token,{String? contentType, ResponseType? responseType}) {
    final headers = {'Authorization': 'Bearer ${token.accessToken}'};
    final options = _dio.options.copyWith(headers: headers);
    final dio = Dio(options)..interceptors.addAll(_dio.interceptors);
    dio.options.contentType = contentType ?? "application/x-www-form-urlencoded";
    if(responseType != null){
      dio.options.responseType = responseType;
    }
    return dio;
  }

  ///If branch_id is specified:
  ///{
  ///     "code": 200,
  ///     "status": "SUCCESS",
  ///     "description": "OK",
  ///     "message": "",
  ///     "data": {
  ///         "validate": true,
  ///         "id": "29",
  ///         "branch_id": "10",
  ///         "code": "REGISTRATION;BRANCH;MGRXF12P41RFFFPRMR5T314WFQ1E6GQM",
  ///         "qrcode": ""
  ///     }
  /// }
  @override
  Future<String?> registerMember({String? branchId, String? company, int? salutationId, String? title, String? firstname, String? lastname, String? street, int? postcode, String? city, int? countryId, String? email, String? phone, String? birthday, String? memberNo, String? username, String? password, String? passwordRepeat, int? categoryId, String? languageCode, bool? newsLetter, bool? acceptApsTerms, bool? acceptBranchTerms}) async{
    try{
      final response = await _dio.post("$apiHost/member/register",
          queryParameters: {"branch_id": branchId},
          data: {
            'company': company,
            'salutation_id': salutationId,
            'title': title,
            'firstname': firstname,
            'lastname': lastname,
            'street': street,
            'postcode': postcode,
            'city': city,
            'country_id': countryId,
            'email': email,
            'phone': phone,
            'birthday': birthday,
            'member_no': memberNo,
            'username': username,
            'password': password,
            'password_repeat': passwordRepeat,
            'category_id': categoryId,
            'language_code': languageCode,
            'newsletter': newsLetter == null ? null : newsLetter ? 1 : 0,
            'accept_aps_terms': acceptApsTerms == null ? null : acceptApsTerms ? 1 : 0,
            'accept_branch_terms': acceptBranchTerms == null ? null : acceptBranchTerms ? 1 : 0,
          }..removeWhere((key, value) => value == null));

      final data = throwCustomErrorOrGetData(response);
      if(data['validate'] == false){
        throw CustomError(code: 200, targets: (data["errors"] as Map<String,dynamic>).keys.toList(), message: ((data["errors"] as Map<String,dynamic>).values.first as List).first);
      }

      if((data as Map<String,dynamic>).containsKey("code")){
        return data["code"] as String;
      }else{
        return null;
      }
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
  Future<void> resetPassword({required String email}) async{
    try{
      final response = await _dio.post("$apiHost/auth/resetPassword", data: {
        'email': email
      });
      if(response.data['code'] == 400){
        throw CustomError(code: 400, message: response.data['message'], targets: ['email']);
      }
    } on DioException catch(e){
      if(e.message?.contains("SocketException") ?? false){
        throw const CustomError(code: 200, message: 'Network error', localizationCode: 'socket-exception');
      }else if(e.error is TimeoutException){
        throwTimeoutCustomError();
      }
      rethrow;
    }
  }

  @override
  Future<AccessToken> refreshToken({required AccessToken token}) async{
    try{
      final response = await _dio.post("$apiHost/auth/token", data: {
        'refresh_token': token.refreshToken,
        'grant_type': 'refresh_token',
        ...authorizationSecrets
      });
      return AccessToken.fromJson(response.data);
    } on DioException catch(e){
      if(e.message?.contains("SocketException") ?? false){
        throw const CustomError(code: 200, message: 'Network error', localizationCode: 'socket-exception');
      }else if(e.error is TimeoutException){
        throwTimeoutCustomError();
      }else if(e.response!.statusCode == 401){
        throw CustomError(code: 401, message: e.response!.data['error_description']);
      }else if(e.response!.statusCode == 400){
        throw CustomError(code: 400, message: e.response!.data['error_description']);
      }
      rethrow;
    }
  }

  @override
  Future<AccessToken> signIn({required String email, required String password}) async{
    try{
      final response = await _dio.post("$apiHost/auth/token", data: {
        'username': email,
        'password': password,
        'grant_type': 'password',
        ...authorizationSecrets
      });
      return AccessToken.fromJson(response.data);
    } on DioException catch(e){
      if(e.message?.contains("SocketException") ?? false){
        throw const CustomError(code: 200, message: 'Network error', localizationCode: 'socket-exception');
      }else if(e.error is TimeoutException){
        throwTimeoutCustomError();
      }else if(e.response!.statusCode! >= 400){
        throw CustomError(code: 401, message: e.response!.data['error_description']);
      }
      rethrow;
    }
  }

  @override
  Future<MemberData> getMemberData({required AccessToken token}) async{
    try{
      final response = await _authenticatedDio(token).get("$apiHost/member/get");
      if(response.data["code"] == 401){
        throw const CustomError(code: 401, message: 'Session expired', localizationCode: 'session-expired');
      }
      return MemberData.fromJson(response.data["data"]);
    } on DioException catch(e){
      if(e.message?.contains("SocketException") ?? false){
        throw const CustomError(code: 200, message: 'Network error', localizationCode: 'socket-exception');
      }else if(e.error is TimeoutException){
        throw const CustomError(code: 400, message: 'Timeout', localizationCode: 'timeout');
      }
      rethrow;
    }
  }

  @override
  Future<String?> getMemberImage({required AccessToken token}) async{
    try{
      final response = await _authenticatedDio(token).get("$apiHost/member/getPhoto");
      if(response.data["data"] is bool){
        return null;
      }else{
        return response.data["data"];
      }
    } on DioException catch(e){
      if(e.message?.contains("SocketException") ?? false){
        throw const CustomError(code: 200, message: 'Network error', localizationCode: 'socket-exception');
      }else if(e.error is TimeoutException){
        throwTimeoutCustomError();
      }
      rethrow;
    }
  }

  @override
  Future<void> logout({required AccessToken token}) => _authenticatedDio(token).get("$apiHost/auth/logout");

  @override
  Future<void> changeLogoUrl({required Uint8List imgBytes, required AccessToken token}) async{
    try{
      FormData formData = FormData.fromMap({
        "photo": MultipartFile.fromBytes(imgBytes, filename: 'profile_image', contentType: MediaType('image','png')),
      });
      final response = await _authenticatedDio(token, contentType: 'multipart/form-data').post("$apiHost/member/updatePhoto", data: formData);
      log(response.data.toString());
    } on DioException catch(e){
      if(e.message?.contains("SocketException") ?? false){
        throw const CustomError(code: 200, message: 'Network error', localizationCode: 'socket-exception');
      }else if(e.error is TimeoutException){
        throwTimeoutCustomError();
      }
      rethrow;
    }
  }

  @override
  Future<void> updateMember({String? company, int? salutationId, String? title, String? firstname, String? lastname, String? street, int? postcode, String? city, int? countryId, String? email, String? phone, String? birthday, String? memberNo, String? username,required AccessToken token}) async{
    try{
      final response = await _authenticatedDio(token).post("$apiHost/member/update", data: {
        'company': company,
        'salutation_id': salutationId,
        'title': title,
        'firstname': firstname,
        'lastname': lastname,
        'street': street,
        'postcode': postcode,
        'city': city,
        'country_id': countryId,
        'email': email,
        'phone': phone,
        'birthday': birthday,
        'member_no': memberNo,
        'username': username,
      }..removeWhere((key, value) => value == null));

      final data = throwCustomErrorOrGetData(response);
      if(data['validate'] == false){
        throw CustomError(code: 200, targets: (data["errors"] as Map<String,dynamic>).keys.toList(), message: ((data["errors"] as Map<String,dynamic>).values.first as List).first);
      }
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
  Future<void> removeLogo({required AccessToken token}) async{
    try{
      await _authenticatedDio(token).post("$apiHost/member/removePhoto");
    } on DioException catch(e){
      if(e.message?.contains("SocketException") ?? false){
        throw const CustomError(code: 200, message: 'Network error', localizationCode: 'socket-exception');
      }else if(e.error is TimeoutException){
        throwTimeoutCustomError();
      }
      rethrow;
    }
  }

  @override
  Future<void> updateMemberPassword({required String oldPassword, required String newPassword, required String newPasswordRepeat, required AccessToken token}) async{
    try{
      final response = await _authenticatedDio(token).post("$apiHost/member/updatePassword", data: {
        'password_old': oldPassword,
        'password': newPassword,
        'password_repeat': newPasswordRepeat
      });
      if(response.data["data"]["validate"] == false){
        final message = (response.data["data"]["errors"] as Map<String,dynamic>).values.first is List ?
        ((response.data["data"]["errors"] as Map<String,dynamic>).values.first as List).first : (response.data["data"]["errors"] as Map<String,dynamic>).values.first as String;
        throw CustomError(code: 200, targets: (response.data["data"]["errors"] as Map<String,dynamic>).keys.toList(), message: message);
      }
    } on DioException catch(e){
      if(e.message?.contains("SocketException") ?? false){
        throw const CustomError(code: 200, message: 'Network error', localizationCode: 'socket-exception');
      }else if(e.error is TimeoutException){
        throwTimeoutCustomError();
      }
      rethrow;
    }
  }

  //(await Pass().fetchPreviewFromUrl(url: "$apiHost/member/getWalletPass/?type=apple", headers: {'Authorization': "Bearer ${token.accessToken}"}));
  @override
  Future<File> getWalletPass({required AccessToken token,required String branchId}) async{
    final appDir = await getApplicationDocumentsDirectory();
    final dir = await Directory(appDir.path+'/'+'passes').create(recursive: true);
    final file = await File('${dir.path}/ca.pkpass').create(recursive: true);
    final response = await _authenticatedDio(token, responseType: ResponseType.bytes).post("$apiHost/member/getWalletPass",
        queryParameters: {
          'type' : 'apple'
        }, data: {
          'branch_id' : branchId
        });
    file.writeAsBytesSync(response.data);
    return file;
  }

  @override
  Future<MemberRegistrationCode> getRegistrationCode({required AccessToken token}) async{
    try{
      final response = await _authenticatedDio(token).get("$apiHost/member/getMemberRegCode");
      return MemberRegistrationCode.fromJson(response.data["data"]);
    } on DioException catch(e){
      if(e.message?.contains("SocketException") ?? false){
        throw const CustomError(code: 200, message: 'Network error', localizationCode: 'socket-exception');
      }else if(e.error is TimeoutException){
        throwTimeoutCustomError();
      }
      rethrow;
    }
  }

  const MemberService({
    required Dio dio,
  }) : _dio = dio;
}
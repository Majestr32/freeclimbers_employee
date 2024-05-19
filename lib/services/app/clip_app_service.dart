import 'dart:convert';
import 'dart:ui';

import 'package:freeclimbers_employee/models/app_settings/app_settings.dart';
import 'package:freeclimbers_employee/utils/jwt.dart';
import 'package:cupertino_http/cupertino_client.dart';
import 'package:http/http.dart';

import '../../models/app_documents/app_documents.dart';
import '../../utils/dio.dart';
import 'app_service_contract.dart';
import 'package:cupertino_http/cupertino_http.dart';

class ClipAppService implements IAppService {
  final Client client;

  const ClipAppService({required this.client});

  @override
  Future<String?> getBase64Logo({int? branchId}) async{
    String token = generateJwt();
    String path = "$apiHost/app/getLogo";
    if(branchId != null){
      path += "?branch_id=$branchId";
    }
    final url = Uri.parse(path);
    final response =
        await client.get(url, headers: {"Authorization": "Bearer $token"});
    final data = response.body;
    if(data.isEmpty){
      return null;
    }
    return jsonDecode(response.body)["data"]["logo"];
  }

  @override
  Future<AppSettings> getBranchSettings(
      {int? branchId}) async {
    String token = generateJwt();
    String path = "$apiHost/app/getData";
    if(branchId != null){
      path += "?branch_id=$branchId";
    }
    final url = Uri.parse(path);
    final response =
        await client.get(url, headers: {"Authorization": "Bearer $token"});
    return AppSettings.fromJson(jsonDecode(response.body)["data"]);
  }

  @override
  Future<AppDocuments> getTermsAndServices({int? branchId}) async{
    String token = generateJwt();

    final response = await client.get(Uri.parse("$apiHost/app/getLegalTexts${branchId == null ? "" : "?branch_id=$branchId"}"),
    headers: {"Authorization": "Bearer $token"});
    final data = jsonDecode(response.body)["data"];

    return AppDocuments.fromJson(data);
  }
}

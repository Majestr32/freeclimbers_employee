import 'package:climbers/data/shared_prefs/app_shared_prefs_contract.dart';
import 'package:climbers/models/app_documents/app_documents.dart';
import 'package:climbers/services/app/app_service_contract.dart';
import 'package:climbers/services/branches/branches_service_contract.dart';
import 'package:flutter/cupertino.dart';

import '../../models/app_settings/app_settings.dart';

class AppRepository{
  final IAppService _appService;
  final IAppSharedPrefs _sharedPrefs;

  Future<AppSettings> getBranchSettings({int? branchId}) => _appService.getBranchSettings(branchId: branchId);
  Future<AppDocuments> getTermsAndServices({int? branchId}) => _appService.getTermsAndServices(branchId: branchId);
  Future<String?> getBase64Logo({int? branchId}) => _appService.getBase64Logo(branchId: branchId);

  String? getSelectedBranchId() => _sharedPrefs.getSelectedBranchId();
  Future<void> setSelectedBranchId(String branchId) => _sharedPrefs.setSelectedBranchId(branchId);

  const AppRepository({
    required IAppService appService,
    required IAppSharedPrefs sharedPrefs,
    required IBranchService branchService
  })
      : _appService = appService,
        _sharedPrefs = sharedPrefs;

}
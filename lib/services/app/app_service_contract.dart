import 'package:freeclimbers_employee/models/app_documents/app_documents.dart';

import '../../models/app_settings/app_settings.dart';

abstract class IAppService{
  Future<AppSettings> getBranchSettings({int? branchId});
  Future<AppDocuments> getTermsAndServices({int? branchId});
  Future<String?> getBase64Logo({int? branchId});
}
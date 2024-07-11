import 'dart:convert';

import 'package:climbers/models/app_settings/app_settings.dart';
import 'package:climbers/services/app/app_service_contract.dart';
import 'package:climbers/services/branches/branches_service_contract.dart';

import '../../models/access_token/access_token.dart';
import '../../models/branch/branch.dart';

class BranchRepository{
  final IAppService _appService;
  final IBranchService _branchService;

  ///Returns branches with initialized images and settings
  Future<List<Branch>> listBranches({required AccessToken token}) async {
    final branches = await _branchService.listBranches(token: token);
    final branchesWithImages = Stream.fromIterable(branches
        .map((e) async{
          int branchNo = int.parse(e.details.no);
          final branchSettings = await _appService.getBranchSettings(branchId: branchNo);
          return e.copyWith.call(branchSettings: branchSettings);
    })).asyncMap((event) => event).toList();
    return branchesWithImages;
  }
  Future<void> addBranch({required String branchId, required AccessToken token}) => _branchService.addBranch(branchId: branchId, token: token);
  Future<void> removeBranch({required String branchId, required AccessToken token}) => _branchService.removeBranch(branchId: branchId, token: token);

  const BranchRepository({
    required IBranchService branchService,
    required IAppService appService
  }) :  _appService = appService,
        _branchService = branchService;
}
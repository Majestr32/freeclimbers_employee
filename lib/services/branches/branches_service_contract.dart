import 'package:freeclimbers_employee/models/access_token/access_token.dart';
import 'package:freeclimbers_employee/models/branch/branch.dart';

abstract class IBranchService{
  Future<List<Branch>> listBranches({required AccessToken token});
  Future<void> addBranch({required String branchId, required AccessToken token});
  Future<void> removeBranch({required String branchId, required AccessToken token});
  Future<String> getBranchLogo({required String branchId});
}
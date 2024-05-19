import 'package:freeclimbers_employee/models/access_token/access_token.dart';
import 'package:freeclimbers_employee/utils/lock_timeout.dart';

abstract class IAppSharedPrefs{
  AccessToken? getAccessToken();
  Future<void> putAccessToken(AccessToken token);
  Future<void> clearAccessToken();
  bool getRequirePin();
  bool getLoginWithFaceId();
  bool getPushMessages();
  bool isLockedWithFaceId();
  LockTimeout getLockTimeout();
  String? getLanguage();

  String? getSelectedBranchId();
  Future<void> setSelectedBranchId(String branchId);

  bool isHomeTutorialCompleted();
  bool isMenuTutorialCompleted();
  Future<void> endHomeTutorial();
  Future<void> endMenuTutorial();

  Future<void> setNightMode(bool isDarkMode);
  ///Returns true if night mode is on
  bool? getNightMode();

  ///Return map with String branch id and Int priority starting from 1
  Map<String, dynamic> getBranchesOrders();
  Future<void> setBranchOrder(Map<String,int> branchOrders);

  void setRequirePin(bool value);
  void setLockTimeout(LockTimeout timeout);
  void setDueLockDate(DateTime date);
  void setLoginWithFaceId(bool value);
  void setPushMessages(bool value);
  void setLanguage(String locale);
}
import 'dart:convert';
import 'dart:developer';

import 'package:freeclimbers_employee/data/shared_prefs/app_shared_prefs_contract.dart';
import 'package:freeclimbers_employee/models/access_token/access_token.dart';
import 'package:freeclimbers_employee/utils/lock_timeout.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppSharedPrefs implements IAppSharedPrefs{
  final SharedPreferences _sharedPreferences;

  final String jwtAccessToken = 'access_token';
  final String jwtExpiresIn = 'expires_in';
  final String jwtRefreshToken = 'refresh_token';

  final String pushMessages = 'push_messages';
  final String requirePin = 'require_pin';
  final String loginWithFaceId = 'login_with_face_id';
  final String language = 'language';
  final String selectedBranchId = 'selected_branch_id';
  final String branchesOrders = 'branches_orders';
  final String lockTimeout = 'lock_timeout';
  final String isLocked = 'is_lock';
  final String isMenuTutorialComplete = 'is_menu_tutorial_complete';
  final String isHomeTutorialComplete = 'is_home_tutorial_complete';
  final String isNightMode = 'is_night_mode';

  @override
  AccessToken? getAccessToken() {
    final accessToken = _sharedPreferences.getString(jwtAccessToken);
    final expiresIn = _sharedPreferences.getString(jwtExpiresIn);
    final refreshToken = _sharedPreferences.getString(jwtRefreshToken);

    if([accessToken,expiresIn,refreshToken].any((e) => e == null)){
      return null;
    }

    return AccessToken(
        accessToken: _decode(accessToken!),
        expiresIn: int.parse(_decode(expiresIn!)),
        refreshToken: _decode(refreshToken!));
  }

  @override
  Future<void> putAccessToken(AccessToken token) async{
    await _sharedPreferences.setString(jwtAccessToken, _encode(token.accessToken));
    await _sharedPreferences.setString(jwtExpiresIn, _encode(token.expiresIn.toString()));
    await _sharedPreferences.setString(jwtRefreshToken, _encode(token.refreshToken));
  }

  @override
  Future<void> clearAccessToken() async{
    await _sharedPreferences.remove(jwtAccessToken);
    await _sharedPreferences.remove(jwtExpiresIn);
    await _sharedPreferences.remove(jwtRefreshToken);
  }

  @override
  bool getLoginWithFaceId() => _sharedPreferences.getBool(loginWithFaceId) ?? false;

  @override
  bool getPushMessages() => _sharedPreferences.getBool(pushMessages) ?? false;

  @override
  bool getRequirePin() => _sharedPreferences.getBool(requirePin) ?? false;

  @override
  String? getLanguage() => _sharedPreferences.getString(language);

  @override
  void setLanguage(String locale) => _sharedPreferences.setString(language, locale);

  @override
  void setLoginWithFaceId(bool value) => _sharedPreferences.setBool(loginWithFaceId, value);

  @override
  void setPushMessages(bool value) => _sharedPreferences.setBool(pushMessages, value);

  @override
  void setRequirePin(bool value) => _sharedPreferences.setBool(requirePin, value);

  String _encode(String value) => utf8.fuse(base64).encode(value);
  String _decode(String value) => utf8.fuse(base64).decode(value);

  const AppSharedPrefs({
    required SharedPreferences sharedPreferences,
  }) : _sharedPreferences = sharedPreferences;

  @override
  Map<String, dynamic> getBranchesOrders() {
    String jsonData = _sharedPreferences.getString(branchesOrders) ?? '';
    if(jsonData.isEmpty){
      return {};
    }
    log(jsonData);
    return jsonDecode(jsonData);
  }

  @override
  String? getSelectedBranchId() {
    return _sharedPreferences.getString(selectedBranchId);
  }

  @override
  Future<void> setBranchOrder(Map<String,int> branchOrders) {
    final encodedOrder = jsonEncode(branchOrders);
    return _sharedPreferences.setString(branchesOrders, encodedOrder);
  }

  @override
  Future<void> setSelectedBranchId(String branchId) {
    return _sharedPreferences.setString(selectedBranchId, branchId);
  }

  @override
  LockTimeout getLockTimeout() {
    return LockTimeout.findByDuration(_sharedPreferences.getInt(lockTimeout) ?? 30);
  }

  @override
  void setLockTimeout(LockTimeout timeout) {
    _sharedPreferences.setInt(lockTimeout, timeout.duration.inSeconds);
  }

  @override
  bool isLockedWithFaceId() {
    final milliseconds = _sharedPreferences.getInt(isLocked) ?? DateTime.now().millisecondsSinceEpoch;
    final durationInMilliseconds = getLockTimeout().duration.inMilliseconds;
    final date = DateTime.fromMillisecondsSinceEpoch(milliseconds).add(Duration(milliseconds: durationInMilliseconds));
    return DateTime.now().compareTo(date) > 0;
  }

  ///Sets milliseconds since epoch
  @override
  void setDueLockDate(DateTime date) {
    _sharedPreferences.setInt(isLocked, date.millisecondsSinceEpoch);
  }

  @override
  Future<void> endHomeTutorial() {
    return _sharedPreferences.setBool(isHomeTutorialComplete, true);
  }

  @override
  Future<void> endMenuTutorial(){
    return _sharedPreferences.setBool(isMenuTutorialComplete, true);
  }

  @override
  bool isHomeTutorialCompleted(){
    return _sharedPreferences.getBool(isHomeTutorialComplete) ?? false;
  }

  @override
  bool isMenuTutorialCompleted() {
    return _sharedPreferences.getBool(isMenuTutorialComplete) ?? false;
  }

  @override
  bool? getNightMode() {
    return _sharedPreferences.getBool(isNightMode);
  }

  @override
  Future<void> setNightMode(bool isDarkMode) {
    return _sharedPreferences.setBool(isNightMode, isDarkMode);
  }

}
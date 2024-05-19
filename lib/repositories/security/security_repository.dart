import 'package:universal_io/io.dart';

import 'package:freeclimbers_employee/utils/lock_timeout.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:local_auth/local_auth.dart';

import '../../data/shared_prefs/app_shared_prefs_contract.dart';

class SecurityRepository{
  final LocalAuthentication _auth;

  final IAppSharedPrefs? _appSharedPrefs;

  bool getLoginWithFaceId() => _appSharedPrefs!.getLoginWithFaceId();

  bool getPushMessages() => _appSharedPrefs!.getPushMessages();

  bool getRequirePin() => _appSharedPrefs!.getRequirePin();

  bool isLockedWithFaceId() => _appSharedPrefs!.isLockedWithFaceId();

  LockTimeout getLockTimeout() => _appSharedPrefs!.getLockTimeout();

  Future<BiometricType> getDefaultBiometricType() async{
    if(!(await _isSupported())){
      return BiometricType.weak;
    }
    final availableBiometrics = await _auth.getAvailableBiometrics();
    if(availableBiometrics.contains(BiometricType.face)){
      return BiometricType.face;
    }else if(availableBiometrics.contains(BiometricType.fingerprint) || (Platform.isAndroid && availableBiometrics.contains(BiometricType.strong))){
      return BiometricType.fingerprint;
    }else{
      return BiometricType.weak;
    }
  }

  void setLockTimeout(LockTimeout timeout) => _appSharedPrefs!.setLockTimeout(timeout);

  void setLoginWithFaceId(bool value) => _appSharedPrefs!.setLoginWithFaceId(value);

  void setPushMessages(bool value) => _appSharedPrefs!.setPushMessages(value);

  void setRequirePin(bool value) => _appSharedPrefs!.setRequirePin(value);

  void setDueLockDate(DateTime date) => _appSharedPrefs!.setDueLockDate(date);

  Future<bool> authWithBiometrics() async{
    if(!(await _isSupported())){
      return false;
    }
    try{
      final result = await _auth.authenticate(localizedReason: ' ',
          options: AuthenticationOptions(stickyAuth: true, sensitiveTransaction: true, biometricOnly: false));
      return result;
    }on PlatformException catch(e){
      return false;
    }
  }

  Future<bool> hasBiometrics() async{
    if(!(await _isSupported())){
      return false;
    }
    final result = await _auth.getAvailableBiometrics();
    return result.isNotEmpty;
  }

  Future<bool> _isSupported() async => (await _auth.isDeviceSupported()) && await _auth.canCheckBiometrics;

  const SecurityRepository({
    required LocalAuthentication auth,
    required AppLocalizations localization,
    required IAppSharedPrefs? appSharedPrefs,
  })  : _auth = auth,
        _appSharedPrefs = appSharedPrefs;
}
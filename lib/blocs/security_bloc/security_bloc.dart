
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:local_auth/local_auth.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';

import '../../repositories/security/security_repository.dart';
import '../../utils/lock_timeout.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

part 'security_event.dart';
part 'security_state.dart';
part 'security_bloc.freezed.dart';

typedef AuthenticateFunction = Future<bool> Function();

class SecurityBloc extends Bloc<SecurityEvent, SecurityState> {
  final SecurityRepository _securityRepository;
  final OneSignal _oneSignal;
  SecurityBloc({required SecurityRepository securityRepository,
    required OneSignal oneSignal})
      : _securityRepository = securityRepository,
        _oneSignal = oneSignal,
        super(const SecurityState.initial()) {
    on<SecurityEvent>((event,emit) async{
      await event.map(fetchAvailableSecurities: (e) => _fetchAvailableSecurities(e,emit),
          toggleLoginWithFaceId: (e) => _toggleLoginWithFaceId(e, emit),
          togglePushMessages: (e) => _togglePushMessages(e, emit),
          setTimeout: (e) => _setTimeout(e, emit),
          discardAuthentication: (e) => _discardAuthentication(e, emit),
          authWithSetMethod: (e) => _authWithSetMethod(e, emit));
    });
    add(SecurityEvent.fetchAvailableSecurities(firstLaunch: true));
  }

  Future<void> _setTimeout(_SetTimeoutEvent event, Emitter<SecurityState> emit) async{
    _securityRepository.setLockTimeout(event.timeout);
    _securityRepository.setDueLockDate(DateTime.now());
    emit(state.setTimeout(event.timeout));
  }

  Future _authWithSetMethod(_AuthWithSetMethodEvent event, Emitter<SecurityState> emit) async{
    if(!state.loginWithFaceId || (state.loginWithFaceId && !state.isLocked)){
      emit(SecurityState.passed(loginWithFaceId: state.loginWithFaceId, pushMessages: state.pushMessages, timeout: state.timeout!, biometricType: state.biometricType!));
      return;
    }
    bool passed = false;
    final AuthenticateFunction authFunction;
    authFunction = _securityRepository.authWithBiometrics;
    passed = await authFunction.call();
    if(passed){
      _securityRepository.setDueLockDate(DateTime.now());
      emit(SecurityState.passed(loginWithFaceId: state.loginWithFaceId, pushMessages: state.pushMessages, timeout: state.timeout!, biometricType: state.biometricType!));
    }
  }

  Future _discardAuthentication(_DiscardAuthenticationEvent event, Emitter<SecurityState> emit) async{
    emit(SecurityState.failed(loginWithFaceId: state.loginWithFaceId, timeout: state.timeout!, pushMessages: state.pushMessages, biometricType: state.biometricType!));
  }

  Future _fetchAvailableSecurities(_FetchAvailableSecuritiesEvent event, Emitter<SecurityState> emit) async{
    final loginWithFaceId = _securityRepository.getLoginWithFaceId();
    final pushMessages = _securityRepository.getPushMessages();
    final lockTimeout = _securityRepository.getLockTimeout();
    final isLocked = event.firstLaunch ? true : _securityRepository.isLockedWithFaceId();
    final biometricType = await _securityRepository.getDefaultBiometricType();
    emit(SecurityState.initialized(loginWithFaceId: loginWithFaceId, timeout: lockTimeout, pushMessages: pushMessages, isLocked: isLocked, biometricType: biometricType));
  }

  Future _togglePushMessages(_TogglePushMessagesEvent event, Emitter<SecurityState> emit) async{
    final toggledOn = !state.pushMessages;
    final accepted = await _oneSignal.promptUserForPushNotificationPermission();
    if(toggledOn && !accepted){
      return;
    }
    _oneSignal.setNotificationWillShowInForegroundHandler((event) {
      event.complete(accepted ? event.notification : null);
    });
    await _oneSignal.disablePush(!accepted);
    _securityRepository.setPushMessages(toggledOn);
    emit(state.togglePushMessages(toggledOn));
  }

  Future _toggleLoginWithFaceId(_ToggleLoginWithFaceIdEvent event, Emitter<SecurityState> emit) async{
    final toggledOn = !state.loginWithFaceId;
    if(toggledOn){
      final activated = await _securityRepository.authWithBiometrics();
      if(!activated){
        return;
      }
      add(SecurityEvent.setTimeout(timeout: state.timeout!));
      emit(SecurityState.enabledBiometrics(loginWithFaceId: state.loginWithFaceId, pushMessages: state.pushMessages, timeout: state.timeout!, biometricType: state.biometricType!));
    }
    emit(SecurityState.initialized(loginWithFaceId: state.loginWithFaceId, pushMessages: state.pushMessages, timeout: state.timeout!, biometricType: state.biometricType!));
    _securityRepository.setLoginWithFaceId(toggledOn);
    emit(state.toggleLoginWithFaceId(toggledOn));
  }

}

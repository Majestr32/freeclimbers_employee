part of 'security_bloc.dart';

@freezed
class SecurityState with _$SecurityState {

  const SecurityState._();

  bool get needAuthentication => maybeMap(
      passed: (_) => false,
      orElse: () => true);

  bool get pushMessages => maybeMap(
      initialized: (state) => state.pushMessages,
      passed: (state) => state.pushMessages,
      enabledBiometrics: (state) => state.pushMessages,
      orElse: () => false);

  bool get loginWithFaceId => maybeMap(
      initialized: (state) => state.loginWithFaceId,
      passed: (state) => state.loginWithFaceId,
      enabledBiometrics: (state) => state.loginWithFaceId,
      orElse: () => false);

  LockTimeout? get timeout => maybeMap(
      initialized: (state) => state.timeout,
      passed: (state) => state.timeout,
      enabledBiometrics: (state) => state.timeout,
      orElse: () => null);

  BiometricType? get biometricType => maybeMap(
      initialized: (state) => state.biometricType,
      passed: (state) => state.biometricType,
      enabledBiometrics: (state) => state.biometricType,
      orElse: () => null);

  ///Searches for AppLocalization from [context]
  String lockingMechanism(BuildContext context) => (biometricType ?? BiometricType.weak) == BiometricType.face ? AppLocalizations.of(context)!.face_id : biometricType == BiometricType.fingerprint ? AppLocalizations.of(context)!.fingerprint : AppLocalizations.of(context)!.pin;

  SecurityState toggleLoginWithFaceId(bool toggleOn) =>
      map(initial: (state) => state,
          initialized: (state) => state.copyWith.call(loginWithFaceId: toggleOn),
          enabledBiometrics: (state) => state.copyWith.call(loginWithFaceId: toggleOn),
          passed: (state) => state.copyWith.call(loginWithFaceId: toggleOn),
          failed: (state) => state.copyWith.call(loginWithFaceId: toggleOn));

  SecurityState togglePushMessages(bool toggleOn) =>
      map(initial: (state) => state,
          initialized: (state) => state.copyWith.call(pushMessages: toggleOn),
          enabledBiometrics: (state) => state.copyWith.call(pushMessages: toggleOn),
          passed: (state) => state.copyWith.call(pushMessages: toggleOn),
          failed: (state) => state.copyWith.call(pushMessages: toggleOn));

  SecurityState setTimeout(LockTimeout timeout) =>
      map(initial: (state) => state,
          initialized: (state) => state.copyWith.call(timeout: timeout),
          enabledBiometrics: (state) => state.copyWith.call(timeout: timeout),
          passed: (state) => state.copyWith.call(timeout: timeout),
          failed: (state) => state.copyWith.call(timeout: timeout));

  bool get isLocked => maybeMap(
      initialized: (state) => state.isLocked,
      orElse: () => false);

  const factory SecurityState.initial() = _InitialState;
  const factory SecurityState.initialized({required bool loginWithFaceId, required LockTimeout timeout, required bool pushMessages, @Default(false) bool isLocked, required BiometricType biometricType}) = _InitializedState;
  const factory SecurityState.enabledBiometrics({required bool loginWithFaceId, required LockTimeout timeout, required bool pushMessages, required BiometricType biometricType}) = _EnabledBiometricsState;
  const factory SecurityState.passed({required bool loginWithFaceId, required LockTimeout timeout, required bool pushMessages, required BiometricType biometricType}) = _PassedState;
  const factory SecurityState.failed({required bool loginWithFaceId, required LockTimeout timeout, required bool pushMessages, required BiometricType biometricType}) = _FailedState;
}

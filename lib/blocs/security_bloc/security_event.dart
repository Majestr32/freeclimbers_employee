part of 'security_bloc.dart';

@freezed
class SecurityEvent with _$SecurityEvent {
  const factory SecurityEvent.fetchAvailableSecurities({required bool firstLaunch}) = _FetchAvailableSecuritiesEvent;
  const factory SecurityEvent.authWithSetMethod() = _AuthWithSetMethodEvent;
  const factory SecurityEvent.togglePushMessages() = _TogglePushMessagesEvent;
  const factory SecurityEvent.setTimeout({required LockTimeout timeout}) = _SetTimeoutEvent;
  const factory SecurityEvent.discardAuthentication() = _DiscardAuthenticationEvent;

  const factory SecurityEvent.toggleLoginWithFaceId() = _ToggleLoginWithFaceIdEvent;
}

part of 'connectivity_bloc.dart';

@freezed
class ConnectivityEvent with _$ConnectivityEvent {
  const factory ConnectivityEvent.showTimeout() = _ShowTimeoutEvent;
  const factory ConnectivityEvent.connect() = _ConnectEvent;
  const factory ConnectivityEvent.disconnect() = _DisconnectEvent;
}

part of 'connectivity_bloc.dart';

@freezed
class ConnectivityState with _$ConnectivityState {
  const factory ConnectivityState.initial() = _InitialState;
  const factory ConnectivityState.active() = _ActiveState;
  const factory ConnectivityState.lostConnectivity() = _LostConnectivityState;
}

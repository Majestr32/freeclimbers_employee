part of 'servers_bloc.dart';

@freezed
class ServersState with _$ServersState {
  const ServersState._();

  String get selectedServerId => maybeMap(
      loaded: (state) => state.selectedServerId,
      orElse: () => "1");

  Server get selectedServer => maybeMap(
      loaded: (state) => state.servers.firstWhere((e) => e.id == selectedServerId),
      orElse: () => const Server(id: "", serverURL: ""));

  List<Server> get servers => maybeMap(
      loaded: (state) => state.servers,
      orElse: () => []);

  const factory ServersState.initial() = _InitialState;
  const factory ServersState.loaded({required String selectedServerId, required List<Server> servers}) = _LoadedState;
}

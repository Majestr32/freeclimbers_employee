part of 'servers_bloc.dart';

@freezed
class ServersEvent with _$ServersEvent {
  const factory ServersEvent.fetchServers() = _FetchServers;
  const factory ServersEvent.selectServer({required String serverId}) = _SelectServer;
  const factory ServersEvent.addServer({required String serverURL, String? name}) = _AddServer;
}

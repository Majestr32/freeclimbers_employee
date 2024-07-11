import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../models/server/server.dart';
import '../../repositories/servers/servers_repository.dart';

part 'servers_event.dart';

part 'servers_state.dart';

part 'servers_bloc.freezed.dart';

class ServersBloc extends Bloc<ServersEvent, ServersState> {
  final ServersRepository _serversRepository;

  ServersBloc({required ServersRepository serversRepository})
      : _serversRepository = serversRepository,
        super(const ServersState.initial()) {
    on<ServersEvent>(_mapEventToState);
  }

  Future<void> _mapEventToState(
          ServersEvent event, Emitter<ServersState> emit) =>
      event.map(
          fetchServers: (e) => _fetchServers(e, emit),
          selectServer: (e) => _selectServer(e, emit),
          addServer: (e) => _addServer(e, emit));

  Future<void> _fetchServers(_FetchServers event, Emitter<ServersState> emit) async{
    final servers = _serversRepository.getServers();
    final selectedServerId = _serversRepository.getSelectedServerId();
    emit(ServersState.loaded(selectedServerId: selectedServerId, servers: servers));
  }

  Future<void> _selectServer(_SelectServer event, Emitter<ServersState> emit) async{
    _serversRepository.setSelectedServerId(event.serverId);
    emit(ServersState.loaded(selectedServerId: event.serverId, servers: state.servers));
  }

  Future<void> _addServer(_AddServer event, Emitter<ServersState> emit) async{
    await _serversRepository.addServer(event.serverURL, event.name);
    final servers = _serversRepository.getServers();
    emit(ServersState.loaded(selectedServerId: servers.last.id, servers: servers));
  }
}

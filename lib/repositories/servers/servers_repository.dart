import 'package:climbers/data/shared_prefs/app_shared_prefs_contract.dart';

import '../../models/server/server.dart';

class ServersRepository{
  final IAppSharedPrefs _sharedPrefs;

  String getSelectedServerId() => _sharedPrefs.getSelectedServerId();
  Future<void> setSelectedServerId(String serverId) => _sharedPrefs.setSelectedServerId(serverId);
  Future<void> addServer(String serverURL, [String? name]) => _sharedPrefs.addServer(serverURL, name);
  List<Server> getServers() => _sharedPrefs.getServers();

  const ServersRepository({
    required IAppSharedPrefs sharedPrefs,
  }) : _sharedPrefs = sharedPrefs;
}
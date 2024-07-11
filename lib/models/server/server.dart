import 'package:freezed_annotation/freezed_annotation.dart';

part 'server.freezed.dart';
part 'server.g.dart';

@freezed
class Server with _$Server {
  const Server._();

  String get displayName => name != null ? name! : serverURL;

  const factory Server({
    required String id,
    String? name,
    required String serverURL,
  }) = _Server;

  factory Server.fromJson(Map<String, Object?> json)
  => _$ServerFromJson(json);
}
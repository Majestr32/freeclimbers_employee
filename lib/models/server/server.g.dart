// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'server.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ServerImpl _$$ServerImplFromJson(Map<String, dynamic> json) => _$ServerImpl(
      id: json['id'] as String,
      name: json['name'] as String?,
      serverURL: json['serverURL'] as String,
    );

Map<String, dynamic> _$$ServerImplToJson(_$ServerImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'serverURL': instance.serverURL,
    };

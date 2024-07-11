// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_settings.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AppSettingsImpl _$$AppSettingsImplFromJson(Map<String, dynamic> json) =>
    _$AppSettingsImpl(
      name1: json['name1'] as String,
      registerText: json['register_text'] as String?,
      required:
          RequiredFields.fromJson(json['required'] as Map<String, dynamic>),
      colors: ColorSet.fromJson(json['colors'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$AppSettingsImplToJson(_$AppSettingsImpl instance) =>
    <String, dynamic>{
      'name1': instance.name1,
      'register_text': instance.registerText,
      'required': instance.required,
      'colors': instance.colors,
    };

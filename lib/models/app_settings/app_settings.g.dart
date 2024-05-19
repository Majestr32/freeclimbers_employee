// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_settings.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AppSettings _$$_AppSettingsFromJson(Map<String, dynamic> json) =>
    _$_AppSettings(
      name1: json['name1'] as String,
      registerText: json['register_text'] as String?,
      required:
          RequiredFields.fromJson(json['required'] as Map<String, dynamic>),
      colors: ColorSet.fromJson(json['colors'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_AppSettingsToJson(_$_AppSettings instance) =>
    <String, dynamic>{
      'name1': instance.name1,
      'register_text': instance.registerText,
      'required': instance.required,
      'colors': instance.colors,
    };

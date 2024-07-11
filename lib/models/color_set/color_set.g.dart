// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'color_set.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ColorSetImpl _$$ColorSetImplFromJson(Map<String, dynamic> json) =>
    _$ColorSetImpl(
      light: ThemeColors.fromJson(json['light'] as Map<String, dynamic>),
      dark: ThemeColors.fromJson(json['dark'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ColorSetImplToJson(_$ColorSetImpl instance) =>
    <String, dynamic>{
      'light': instance.light,
      'dark': instance.dark,
    };

// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_settings.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AppSettings _$AppSettingsFromJson(Map<String, dynamic> json) {
  return _AppSettings.fromJson(json);
}

/// @nodoc
mixin _$AppSettings {
  String get name1 => throw _privateConstructorUsedError;
  @JsonKey(name: 'register_text')
  String? get registerText => throw _privateConstructorUsedError;
  RequiredFields get required => throw _privateConstructorUsedError;
  ColorSet get colors => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AppSettingsCopyWith<AppSettings> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppSettingsCopyWith<$Res> {
  factory $AppSettingsCopyWith(
          AppSettings value, $Res Function(AppSettings) then) =
      _$AppSettingsCopyWithImpl<$Res, AppSettings>;
  @useResult
  $Res call(
      {String name1,
      @JsonKey(name: 'register_text') String? registerText,
      RequiredFields required,
      ColorSet colors});

  $RequiredFieldsCopyWith<$Res> get required;
  $ColorSetCopyWith<$Res> get colors;
}

/// @nodoc
class _$AppSettingsCopyWithImpl<$Res, $Val extends AppSettings>
    implements $AppSettingsCopyWith<$Res> {
  _$AppSettingsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name1 = null,
    Object? registerText = freezed,
    Object? required = null,
    Object? colors = null,
  }) {
    return _then(_value.copyWith(
      name1: null == name1
          ? _value.name1
          : name1 // ignore: cast_nullable_to_non_nullable
              as String,
      registerText: freezed == registerText
          ? _value.registerText
          : registerText // ignore: cast_nullable_to_non_nullable
              as String?,
      required: null == required
          ? _value.required
          : required // ignore: cast_nullable_to_non_nullable
              as RequiredFields,
      colors: null == colors
          ? _value.colors
          : colors // ignore: cast_nullable_to_non_nullable
              as ColorSet,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $RequiredFieldsCopyWith<$Res> get required {
    return $RequiredFieldsCopyWith<$Res>(_value.required, (value) {
      return _then(_value.copyWith(required: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ColorSetCopyWith<$Res> get colors {
    return $ColorSetCopyWith<$Res>(_value.colors, (value) {
      return _then(_value.copyWith(colors: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_AppSettingsCopyWith<$Res>
    implements $AppSettingsCopyWith<$Res> {
  factory _$$_AppSettingsCopyWith(
          _$_AppSettings value, $Res Function(_$_AppSettings) then) =
      __$$_AppSettingsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name1,
      @JsonKey(name: 'register_text') String? registerText,
      RequiredFields required,
      ColorSet colors});

  @override
  $RequiredFieldsCopyWith<$Res> get required;
  @override
  $ColorSetCopyWith<$Res> get colors;
}

/// @nodoc
class __$$_AppSettingsCopyWithImpl<$Res>
    extends _$AppSettingsCopyWithImpl<$Res, _$_AppSettings>
    implements _$$_AppSettingsCopyWith<$Res> {
  __$$_AppSettingsCopyWithImpl(
      _$_AppSettings _value, $Res Function(_$_AppSettings) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name1 = null,
    Object? registerText = freezed,
    Object? required = null,
    Object? colors = null,
  }) {
    return _then(_$_AppSettings(
      name1: null == name1
          ? _value.name1
          : name1 // ignore: cast_nullable_to_non_nullable
              as String,
      registerText: freezed == registerText
          ? _value.registerText
          : registerText // ignore: cast_nullable_to_non_nullable
              as String?,
      required: null == required
          ? _value.required
          : required // ignore: cast_nullable_to_non_nullable
              as RequiredFields,
      colors: null == colors
          ? _value.colors
          : colors // ignore: cast_nullable_to_non_nullable
              as ColorSet,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AppSettings implements _AppSettings {
  const _$_AppSettings(
      {required this.name1,
      @JsonKey(name: 'register_text') this.registerText,
      required this.required,
      required this.colors});

  factory _$_AppSettings.fromJson(Map<String, dynamic> json) =>
      _$$_AppSettingsFromJson(json);

  @override
  final String name1;
  @override
  @JsonKey(name: 'register_text')
  final String? registerText;
  @override
  final RequiredFields required;
  @override
  final ColorSet colors;

  @override
  String toString() {
    return 'AppSettings(name1: $name1, registerText: $registerText, required: $required, colors: $colors)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AppSettings &&
            (identical(other.name1, name1) || other.name1 == name1) &&
            (identical(other.registerText, registerText) ||
                other.registerText == registerText) &&
            (identical(other.required, required) ||
                other.required == required) &&
            (identical(other.colors, colors) || other.colors == colors));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, name1, registerText, required, colors);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AppSettingsCopyWith<_$_AppSettings> get copyWith =>
      __$$_AppSettingsCopyWithImpl<_$_AppSettings>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AppSettingsToJson(
      this,
    );
  }
}

abstract class _AppSettings implements AppSettings {
  const factory _AppSettings(
      {required final String name1,
      @JsonKey(name: 'register_text') final String? registerText,
      required final RequiredFields required,
      required final ColorSet colors}) = _$_AppSettings;

  factory _AppSettings.fromJson(Map<String, dynamic> json) =
      _$_AppSettings.fromJson;

  @override
  String get name1;
  @override
  @JsonKey(name: 'register_text')
  String? get registerText;
  @override
  RequiredFields get required;
  @override
  ColorSet get colors;
  @override
  @JsonKey(ignore: true)
  _$$_AppSettingsCopyWith<_$_AppSettings> get copyWith =>
      throw _privateConstructorUsedError;
}

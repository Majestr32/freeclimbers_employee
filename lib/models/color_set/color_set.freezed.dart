// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'color_set.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ColorSet _$ColorSetFromJson(Map<String, dynamic> json) {
  return _ColorSet.fromJson(json);
}

/// @nodoc
mixin _$ColorSet {
  ThemeColors get light => throw _privateConstructorUsedError;
  ThemeColors get dark => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ColorSetCopyWith<ColorSet> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ColorSetCopyWith<$Res> {
  factory $ColorSetCopyWith(ColorSet value, $Res Function(ColorSet) then) =
      _$ColorSetCopyWithImpl<$Res, ColorSet>;
  @useResult
  $Res call({ThemeColors light, ThemeColors dark});

  $ThemeColorsCopyWith<$Res> get light;
  $ThemeColorsCopyWith<$Res> get dark;
}

/// @nodoc
class _$ColorSetCopyWithImpl<$Res, $Val extends ColorSet>
    implements $ColorSetCopyWith<$Res> {
  _$ColorSetCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? light = null,
    Object? dark = null,
  }) {
    return _then(_value.copyWith(
      light: null == light
          ? _value.light
          : light // ignore: cast_nullable_to_non_nullable
              as ThemeColors,
      dark: null == dark
          ? _value.dark
          : dark // ignore: cast_nullable_to_non_nullable
              as ThemeColors,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ThemeColorsCopyWith<$Res> get light {
    return $ThemeColorsCopyWith<$Res>(_value.light, (value) {
      return _then(_value.copyWith(light: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ThemeColorsCopyWith<$Res> get dark {
    return $ThemeColorsCopyWith<$Res>(_value.dark, (value) {
      return _then(_value.copyWith(dark: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_ColorSetCopyWith<$Res> implements $ColorSetCopyWith<$Res> {
  factory _$$_ColorSetCopyWith(
          _$_ColorSet value, $Res Function(_$_ColorSet) then) =
      __$$_ColorSetCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({ThemeColors light, ThemeColors dark});

  @override
  $ThemeColorsCopyWith<$Res> get light;
  @override
  $ThemeColorsCopyWith<$Res> get dark;
}

/// @nodoc
class __$$_ColorSetCopyWithImpl<$Res>
    extends _$ColorSetCopyWithImpl<$Res, _$_ColorSet>
    implements _$$_ColorSetCopyWith<$Res> {
  __$$_ColorSetCopyWithImpl(
      _$_ColorSet _value, $Res Function(_$_ColorSet) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? light = null,
    Object? dark = null,
  }) {
    return _then(_$_ColorSet(
      light: null == light
          ? _value.light
          : light // ignore: cast_nullable_to_non_nullable
              as ThemeColors,
      dark: null == dark
          ? _value.dark
          : dark // ignore: cast_nullable_to_non_nullable
              as ThemeColors,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ColorSet extends _ColorSet {
  const _$_ColorSet({required this.light, required this.dark}) : super._();

  factory _$_ColorSet.fromJson(Map<String, dynamic> json) =>
      _$$_ColorSetFromJson(json);

  @override
  final ThemeColors light;
  @override
  final ThemeColors dark;

  @override
  String toString() {
    return 'ColorSet(light: $light, dark: $dark)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ColorSet &&
            (identical(other.light, light) || other.light == light) &&
            (identical(other.dark, dark) || other.dark == dark));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, light, dark);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ColorSetCopyWith<_$_ColorSet> get copyWith =>
      __$$_ColorSetCopyWithImpl<_$_ColorSet>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ColorSetToJson(
      this,
    );
  }
}

abstract class _ColorSet extends ColorSet {
  const factory _ColorSet(
      {required final ThemeColors light,
      required final ThemeColors dark}) = _$_ColorSet;
  const _ColorSet._() : super._();

  factory _ColorSet.fromJson(Map<String, dynamic> json) = _$_ColorSet.fromJson;

  @override
  ThemeColors get light;
  @override
  ThemeColors get dark;
  @override
  @JsonKey(ignore: true)
  _$$_ColorSetCopyWith<_$_ColorSet> get copyWith =>
      throw _privateConstructorUsedError;
}

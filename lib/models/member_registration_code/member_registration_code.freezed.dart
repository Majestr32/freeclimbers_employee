// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'member_registration_code.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MemberRegistrationCode _$MemberRegistrationCodeFromJson(
    Map<String, dynamic> json) {
  return _MemberRegistrationCode.fromJson(json);
}

/// @nodoc
mixin _$MemberRegistrationCode {
  String get code => throw _privateConstructorUsedError;
  String get qrcode => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MemberRegistrationCodeCopyWith<MemberRegistrationCode> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MemberRegistrationCodeCopyWith<$Res> {
  factory $MemberRegistrationCodeCopyWith(MemberRegistrationCode value,
          $Res Function(MemberRegistrationCode) then) =
      _$MemberRegistrationCodeCopyWithImpl<$Res, MemberRegistrationCode>;
  @useResult
  $Res call({String code, String qrcode});
}

/// @nodoc
class _$MemberRegistrationCodeCopyWithImpl<$Res,
        $Val extends MemberRegistrationCode>
    implements $MemberRegistrationCodeCopyWith<$Res> {
  _$MemberRegistrationCodeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? qrcode = null,
  }) {
    return _then(_value.copyWith(
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      qrcode: null == qrcode
          ? _value.qrcode
          : qrcode // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MemberRegistrationCodeCopyWith<$Res>
    implements $MemberRegistrationCodeCopyWith<$Res> {
  factory _$$_MemberRegistrationCodeCopyWith(_$_MemberRegistrationCode value,
          $Res Function(_$_MemberRegistrationCode) then) =
      __$$_MemberRegistrationCodeCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String code, String qrcode});
}

/// @nodoc
class __$$_MemberRegistrationCodeCopyWithImpl<$Res>
    extends _$MemberRegistrationCodeCopyWithImpl<$Res,
        _$_MemberRegistrationCode>
    implements _$$_MemberRegistrationCodeCopyWith<$Res> {
  __$$_MemberRegistrationCodeCopyWithImpl(_$_MemberRegistrationCode _value,
      $Res Function(_$_MemberRegistrationCode) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? qrcode = null,
  }) {
    return _then(_$_MemberRegistrationCode(
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      qrcode: null == qrcode
          ? _value.qrcode
          : qrcode // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MemberRegistrationCode
    with DiagnosticableTreeMixin
    implements _MemberRegistrationCode {
  const _$_MemberRegistrationCode({required this.code, required this.qrcode});

  factory _$_MemberRegistrationCode.fromJson(Map<String, dynamic> json) =>
      _$$_MemberRegistrationCodeFromJson(json);

  @override
  final String code;
  @override
  final String qrcode;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'MemberRegistrationCode(code: $code, qrcode: $qrcode)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'MemberRegistrationCode'))
      ..add(DiagnosticsProperty('code', code))
      ..add(DiagnosticsProperty('qrcode', qrcode));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MemberRegistrationCode &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.qrcode, qrcode) || other.qrcode == qrcode));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, code, qrcode);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MemberRegistrationCodeCopyWith<_$_MemberRegistrationCode> get copyWith =>
      __$$_MemberRegistrationCodeCopyWithImpl<_$_MemberRegistrationCode>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MemberRegistrationCodeToJson(
      this,
    );
  }
}

abstract class _MemberRegistrationCode implements MemberRegistrationCode {
  const factory _MemberRegistrationCode(
      {required final String code,
      required final String qrcode}) = _$_MemberRegistrationCode;

  factory _MemberRegistrationCode.fromJson(Map<String, dynamic> json) =
      _$_MemberRegistrationCode.fromJson;

  @override
  String get code;
  @override
  String get qrcode;
  @override
  @JsonKey(ignore: true)
  _$$_MemberRegistrationCodeCopyWith<_$_MemberRegistrationCode> get copyWith =>
      throw _privateConstructorUsedError;
}

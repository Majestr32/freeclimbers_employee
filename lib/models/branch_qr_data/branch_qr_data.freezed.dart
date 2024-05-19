// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'branch_qr_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

BranchQrData _$BranchQrDataFromJson(Map<String, dynamic> json) {
  return _BranchQrData.fromJson(json);
}

/// @nodoc
mixin _$BranchQrData {
  String get id => throw _privateConstructorUsedError;
  String get no => throw _privateConstructorUsedError;
  String get company => throw _privateConstructorUsedError;
  @JsonKey(name: 'logo')
  String get logoStr => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BranchQrDataCopyWith<BranchQrData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BranchQrDataCopyWith<$Res> {
  factory $BranchQrDataCopyWith(
          BranchQrData value, $Res Function(BranchQrData) then) =
      _$BranchQrDataCopyWithImpl<$Res, BranchQrData>;
  @useResult
  $Res call(
      {String id,
      String no,
      String company,
      @JsonKey(name: 'logo') String logoStr});
}

/// @nodoc
class _$BranchQrDataCopyWithImpl<$Res, $Val extends BranchQrData>
    implements $BranchQrDataCopyWith<$Res> {
  _$BranchQrDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? no = null,
    Object? company = null,
    Object? logoStr = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      no: null == no
          ? _value.no
          : no // ignore: cast_nullable_to_non_nullable
              as String,
      company: null == company
          ? _value.company
          : company // ignore: cast_nullable_to_non_nullable
              as String,
      logoStr: null == logoStr
          ? _value.logoStr
          : logoStr // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_BranchQrDataCopyWith<$Res>
    implements $BranchQrDataCopyWith<$Res> {
  factory _$$_BranchQrDataCopyWith(
          _$_BranchQrData value, $Res Function(_$_BranchQrData) then) =
      __$$_BranchQrDataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String no,
      String company,
      @JsonKey(name: 'logo') String logoStr});
}

/// @nodoc
class __$$_BranchQrDataCopyWithImpl<$Res>
    extends _$BranchQrDataCopyWithImpl<$Res, _$_BranchQrData>
    implements _$$_BranchQrDataCopyWith<$Res> {
  __$$_BranchQrDataCopyWithImpl(
      _$_BranchQrData _value, $Res Function(_$_BranchQrData) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? no = null,
    Object? company = null,
    Object? logoStr = null,
  }) {
    return _then(_$_BranchQrData(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      no: null == no
          ? _value.no
          : no // ignore: cast_nullable_to_non_nullable
              as String,
      company: null == company
          ? _value.company
          : company // ignore: cast_nullable_to_non_nullable
              as String,
      logoStr: null == logoStr
          ? _value.logoStr
          : logoStr // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_BranchQrData extends _BranchQrData {
  const _$_BranchQrData(
      {required this.id,
      required this.no,
      required this.company,
      @JsonKey(name: 'logo') required this.logoStr})
      : super._();

  factory _$_BranchQrData.fromJson(Map<String, dynamic> json) =>
      _$$_BranchQrDataFromJson(json);

  @override
  final String id;
  @override
  final String no;
  @override
  final String company;
  @override
  @JsonKey(name: 'logo')
  final String logoStr;

  @override
  String toString() {
    return 'BranchQrData(id: $id, no: $no, company: $company, logoStr: $logoStr)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_BranchQrData &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.no, no) || other.no == no) &&
            (identical(other.company, company) || other.company == company) &&
            (identical(other.logoStr, logoStr) || other.logoStr == logoStr));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, no, company, logoStr);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BranchQrDataCopyWith<_$_BranchQrData> get copyWith =>
      __$$_BranchQrDataCopyWithImpl<_$_BranchQrData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_BranchQrDataToJson(
      this,
    );
  }
}

abstract class _BranchQrData extends BranchQrData {
  const factory _BranchQrData(
      {required final String id,
      required final String no,
      required final String company,
      @JsonKey(name: 'logo') required final String logoStr}) = _$_BranchQrData;
  const _BranchQrData._() : super._();

  factory _BranchQrData.fromJson(Map<String, dynamic> json) =
      _$_BranchQrData.fromJson;

  @override
  String get id;
  @override
  String get no;
  @override
  String get company;
  @override
  @JsonKey(name: 'logo')
  String get logoStr;
  @override
  @JsonKey(ignore: true)
  _$$_BranchQrDataCopyWith<_$_BranchQrData> get copyWith =>
      throw _privateConstructorUsedError;
}

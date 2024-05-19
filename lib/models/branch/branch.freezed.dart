// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'branch.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Branch _$BranchFromJson(Map<String, dynamic> json) {
  return _Branch.fromJson(json);
}

/// @nodoc
mixin _$Branch {
  String get id => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  AppSettings? get branchSettings => throw _privateConstructorUsedError;
  @JsonKey(name: 'member_id')
  String get memberId => throw _privateConstructorUsedError;
  @JsonKey(name: 'branch_id')
  String get branchId => throw _privateConstructorUsedError;
  @JsonKey(name: 'branch_customer_id')
  String? get branchCustomerId => throw _privateConstructorUsedError;
  @JsonKey(name: 'branch')
  BranchDetails get details => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BranchCopyWith<Branch> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BranchCopyWith<$Res> {
  factory $BranchCopyWith(Branch value, $Res Function(Branch) then) =
      _$BranchCopyWithImpl<$Res, Branch>;
  @useResult
  $Res call(
      {String id,
      @JsonKey(ignore: true) AppSettings? branchSettings,
      @JsonKey(name: 'member_id') String memberId,
      @JsonKey(name: 'branch_id') String branchId,
      @JsonKey(name: 'branch_customer_id') String? branchCustomerId,
      @JsonKey(name: 'branch') BranchDetails details});

  $AppSettingsCopyWith<$Res>? get branchSettings;
  $BranchDetailsCopyWith<$Res> get details;
}

/// @nodoc
class _$BranchCopyWithImpl<$Res, $Val extends Branch>
    implements $BranchCopyWith<$Res> {
  _$BranchCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? branchSettings = freezed,
    Object? memberId = null,
    Object? branchId = null,
    Object? branchCustomerId = freezed,
    Object? details = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      branchSettings: freezed == branchSettings
          ? _value.branchSettings
          : branchSettings // ignore: cast_nullable_to_non_nullable
              as AppSettings?,
      memberId: null == memberId
          ? _value.memberId
          : memberId // ignore: cast_nullable_to_non_nullable
              as String,
      branchId: null == branchId
          ? _value.branchId
          : branchId // ignore: cast_nullable_to_non_nullable
              as String,
      branchCustomerId: freezed == branchCustomerId
          ? _value.branchCustomerId
          : branchCustomerId // ignore: cast_nullable_to_non_nullable
              as String?,
      details: null == details
          ? _value.details
          : details // ignore: cast_nullable_to_non_nullable
              as BranchDetails,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $AppSettingsCopyWith<$Res>? get branchSettings {
    if (_value.branchSettings == null) {
      return null;
    }

    return $AppSettingsCopyWith<$Res>(_value.branchSettings!, (value) {
      return _then(_value.copyWith(branchSettings: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $BranchDetailsCopyWith<$Res> get details {
    return $BranchDetailsCopyWith<$Res>(_value.details, (value) {
      return _then(_value.copyWith(details: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_BranchCopyWith<$Res> implements $BranchCopyWith<$Res> {
  factory _$$_BranchCopyWith(_$_Branch value, $Res Function(_$_Branch) then) =
      __$$_BranchCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      @JsonKey(ignore: true) AppSettings? branchSettings,
      @JsonKey(name: 'member_id') String memberId,
      @JsonKey(name: 'branch_id') String branchId,
      @JsonKey(name: 'branch_customer_id') String? branchCustomerId,
      @JsonKey(name: 'branch') BranchDetails details});

  @override
  $AppSettingsCopyWith<$Res>? get branchSettings;
  @override
  $BranchDetailsCopyWith<$Res> get details;
}

/// @nodoc
class __$$_BranchCopyWithImpl<$Res>
    extends _$BranchCopyWithImpl<$Res, _$_Branch>
    implements _$$_BranchCopyWith<$Res> {
  __$$_BranchCopyWithImpl(_$_Branch _value, $Res Function(_$_Branch) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? branchSettings = freezed,
    Object? memberId = null,
    Object? branchId = null,
    Object? branchCustomerId = freezed,
    Object? details = null,
  }) {
    return _then(_$_Branch(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      branchSettings: freezed == branchSettings
          ? _value.branchSettings
          : branchSettings // ignore: cast_nullable_to_non_nullable
              as AppSettings?,
      memberId: null == memberId
          ? _value.memberId
          : memberId // ignore: cast_nullable_to_non_nullable
              as String,
      branchId: null == branchId
          ? _value.branchId
          : branchId // ignore: cast_nullable_to_non_nullable
              as String,
      branchCustomerId: freezed == branchCustomerId
          ? _value.branchCustomerId
          : branchCustomerId // ignore: cast_nullable_to_non_nullable
              as String?,
      details: null == details
          ? _value.details
          : details // ignore: cast_nullable_to_non_nullable
              as BranchDetails,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Branch with DiagnosticableTreeMixin implements _Branch {
  const _$_Branch(
      {required this.id,
      @JsonKey(ignore: true) this.branchSettings,
      @JsonKey(name: 'member_id') required this.memberId,
      @JsonKey(name: 'branch_id') required this.branchId,
      @JsonKey(name: 'branch_customer_id') this.branchCustomerId,
      @JsonKey(name: 'branch') required this.details});

  factory _$_Branch.fromJson(Map<String, dynamic> json) =>
      _$$_BranchFromJson(json);

  @override
  final String id;
  @override
  @JsonKey(ignore: true)
  final AppSettings? branchSettings;
  @override
  @JsonKey(name: 'member_id')
  final String memberId;
  @override
  @JsonKey(name: 'branch_id')
  final String branchId;
  @override
  @JsonKey(name: 'branch_customer_id')
  final String? branchCustomerId;
  @override
  @JsonKey(name: 'branch')
  final BranchDetails details;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Branch(id: $id, branchSettings: $branchSettings, memberId: $memberId, branchId: $branchId, branchCustomerId: $branchCustomerId, details: $details)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Branch'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('branchSettings', branchSettings))
      ..add(DiagnosticsProperty('memberId', memberId))
      ..add(DiagnosticsProperty('branchId', branchId))
      ..add(DiagnosticsProperty('branchCustomerId', branchCustomerId))
      ..add(DiagnosticsProperty('details', details));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Branch &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.branchSettings, branchSettings) ||
                other.branchSettings == branchSettings) &&
            (identical(other.memberId, memberId) ||
                other.memberId == memberId) &&
            (identical(other.branchId, branchId) ||
                other.branchId == branchId) &&
            (identical(other.branchCustomerId, branchCustomerId) ||
                other.branchCustomerId == branchCustomerId) &&
            (identical(other.details, details) || other.details == details));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, branchSettings, memberId,
      branchId, branchCustomerId, details);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BranchCopyWith<_$_Branch> get copyWith =>
      __$$_BranchCopyWithImpl<_$_Branch>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_BranchToJson(
      this,
    );
  }
}

abstract class _Branch implements Branch {
  const factory _Branch(
          {required final String id,
          @JsonKey(ignore: true) final AppSettings? branchSettings,
          @JsonKey(name: 'member_id') required final String memberId,
          @JsonKey(name: 'branch_id') required final String branchId,
          @JsonKey(name: 'branch_customer_id') final String? branchCustomerId,
          @JsonKey(name: 'branch') required final BranchDetails details}) =
      _$_Branch;

  factory _Branch.fromJson(Map<String, dynamic> json) = _$_Branch.fromJson;

  @override
  String get id;
  @override
  @JsonKey(ignore: true)
  AppSettings? get branchSettings;
  @override
  @JsonKey(name: 'member_id')
  String get memberId;
  @override
  @JsonKey(name: 'branch_id')
  String get branchId;
  @override
  @JsonKey(name: 'branch_customer_id')
  String? get branchCustomerId;
  @override
  @JsonKey(name: 'branch')
  BranchDetails get details;
  @override
  @JsonKey(ignore: true)
  _$$_BranchCopyWith<_$_Branch> get copyWith =>
      throw _privateConstructorUsedError;
}

// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'extend_profile_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ExtendProfileEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(MemberData memberData) checkIfProblemExist,
    required TResult Function(MemberData updateFields) extendProfile,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(MemberData memberData)? checkIfProblemExist,
    TResult? Function(MemberData updateFields)? extendProfile,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(MemberData memberData)? checkIfProblemExist,
    TResult Function(MemberData updateFields)? extendProfile,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CheckIfProblemExistEvent value)
        checkIfProblemExist,
    required TResult Function(_ExtendProfileEvent value) extendProfile,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CheckIfProblemExistEvent value)? checkIfProblemExist,
    TResult? Function(_ExtendProfileEvent value)? extendProfile,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CheckIfProblemExistEvent value)? checkIfProblemExist,
    TResult Function(_ExtendProfileEvent value)? extendProfile,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExtendProfileEventCopyWith<$Res> {
  factory $ExtendProfileEventCopyWith(
          ExtendProfileEvent value, $Res Function(ExtendProfileEvent) then) =
      _$ExtendProfileEventCopyWithImpl<$Res, ExtendProfileEvent>;
}

/// @nodoc
class _$ExtendProfileEventCopyWithImpl<$Res, $Val extends ExtendProfileEvent>
    implements $ExtendProfileEventCopyWith<$Res> {
  _$ExtendProfileEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_CheckIfProblemExistEventCopyWith<$Res> {
  factory _$$_CheckIfProblemExistEventCopyWith(
          _$_CheckIfProblemExistEvent value,
          $Res Function(_$_CheckIfProblemExistEvent) then) =
      __$$_CheckIfProblemExistEventCopyWithImpl<$Res>;
  @useResult
  $Res call({MemberData memberData});

  $MemberDataCopyWith<$Res> get memberData;
}

/// @nodoc
class __$$_CheckIfProblemExistEventCopyWithImpl<$Res>
    extends _$ExtendProfileEventCopyWithImpl<$Res, _$_CheckIfProblemExistEvent>
    implements _$$_CheckIfProblemExistEventCopyWith<$Res> {
  __$$_CheckIfProblemExistEventCopyWithImpl(_$_CheckIfProblemExistEvent _value,
      $Res Function(_$_CheckIfProblemExistEvent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? memberData = null,
  }) {
    return _then(_$_CheckIfProblemExistEvent(
      memberData: null == memberData
          ? _value.memberData
          : memberData // ignore: cast_nullable_to_non_nullable
              as MemberData,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $MemberDataCopyWith<$Res> get memberData {
    return $MemberDataCopyWith<$Res>(_value.memberData, (value) {
      return _then(_value.copyWith(memberData: value));
    });
  }
}

/// @nodoc

class _$_CheckIfProblemExistEvent implements _CheckIfProblemExistEvent {
  const _$_CheckIfProblemExistEvent({required this.memberData});

  @override
  final MemberData memberData;

  @override
  String toString() {
    return 'ExtendProfileEvent.checkIfProblemExist(memberData: $memberData)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CheckIfProblemExistEvent &&
            (identical(other.memberData, memberData) ||
                other.memberData == memberData));
  }

  @override
  int get hashCode => Object.hash(runtimeType, memberData);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CheckIfProblemExistEventCopyWith<_$_CheckIfProblemExistEvent>
      get copyWith => __$$_CheckIfProblemExistEventCopyWithImpl<
          _$_CheckIfProblemExistEvent>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(MemberData memberData) checkIfProblemExist,
    required TResult Function(MemberData updateFields) extendProfile,
  }) {
    return checkIfProblemExist(memberData);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(MemberData memberData)? checkIfProblemExist,
    TResult? Function(MemberData updateFields)? extendProfile,
  }) {
    return checkIfProblemExist?.call(memberData);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(MemberData memberData)? checkIfProblemExist,
    TResult Function(MemberData updateFields)? extendProfile,
    required TResult orElse(),
  }) {
    if (checkIfProblemExist != null) {
      return checkIfProblemExist(memberData);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CheckIfProblemExistEvent value)
        checkIfProblemExist,
    required TResult Function(_ExtendProfileEvent value) extendProfile,
  }) {
    return checkIfProblemExist(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CheckIfProblemExistEvent value)? checkIfProblemExist,
    TResult? Function(_ExtendProfileEvent value)? extendProfile,
  }) {
    return checkIfProblemExist?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CheckIfProblemExistEvent value)? checkIfProblemExist,
    TResult Function(_ExtendProfileEvent value)? extendProfile,
    required TResult orElse(),
  }) {
    if (checkIfProblemExist != null) {
      return checkIfProblemExist(this);
    }
    return orElse();
  }
}

abstract class _CheckIfProblemExistEvent implements ExtendProfileEvent {
  const factory _CheckIfProblemExistEvent(
      {required final MemberData memberData}) = _$_CheckIfProblemExistEvent;

  MemberData get memberData;
  @JsonKey(ignore: true)
  _$$_CheckIfProblemExistEventCopyWith<_$_CheckIfProblemExistEvent>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_ExtendProfileEventCopyWith<$Res> {
  factory _$$_ExtendProfileEventCopyWith(_$_ExtendProfileEvent value,
          $Res Function(_$_ExtendProfileEvent) then) =
      __$$_ExtendProfileEventCopyWithImpl<$Res>;
  @useResult
  $Res call({MemberData updateFields});

  $MemberDataCopyWith<$Res> get updateFields;
}

/// @nodoc
class __$$_ExtendProfileEventCopyWithImpl<$Res>
    extends _$ExtendProfileEventCopyWithImpl<$Res, _$_ExtendProfileEvent>
    implements _$$_ExtendProfileEventCopyWith<$Res> {
  __$$_ExtendProfileEventCopyWithImpl(
      _$_ExtendProfileEvent _value, $Res Function(_$_ExtendProfileEvent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? updateFields = null,
  }) {
    return _then(_$_ExtendProfileEvent(
      updateFields: null == updateFields
          ? _value.updateFields
          : updateFields // ignore: cast_nullable_to_non_nullable
              as MemberData,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $MemberDataCopyWith<$Res> get updateFields {
    return $MemberDataCopyWith<$Res>(_value.updateFields, (value) {
      return _then(_value.copyWith(updateFields: value));
    });
  }
}

/// @nodoc

class _$_ExtendProfileEvent implements _ExtendProfileEvent {
  const _$_ExtendProfileEvent({required this.updateFields});

  @override
  final MemberData updateFields;

  @override
  String toString() {
    return 'ExtendProfileEvent.extendProfile(updateFields: $updateFields)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ExtendProfileEvent &&
            (identical(other.updateFields, updateFields) ||
                other.updateFields == updateFields));
  }

  @override
  int get hashCode => Object.hash(runtimeType, updateFields);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ExtendProfileEventCopyWith<_$_ExtendProfileEvent> get copyWith =>
      __$$_ExtendProfileEventCopyWithImpl<_$_ExtendProfileEvent>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(MemberData memberData) checkIfProblemExist,
    required TResult Function(MemberData updateFields) extendProfile,
  }) {
    return extendProfile(updateFields);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(MemberData memberData)? checkIfProblemExist,
    TResult? Function(MemberData updateFields)? extendProfile,
  }) {
    return extendProfile?.call(updateFields);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(MemberData memberData)? checkIfProblemExist,
    TResult Function(MemberData updateFields)? extendProfile,
    required TResult orElse(),
  }) {
    if (extendProfile != null) {
      return extendProfile(updateFields);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CheckIfProblemExistEvent value)
        checkIfProblemExist,
    required TResult Function(_ExtendProfileEvent value) extendProfile,
  }) {
    return extendProfile(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CheckIfProblemExistEvent value)? checkIfProblemExist,
    TResult? Function(_ExtendProfileEvent value)? extendProfile,
  }) {
    return extendProfile?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CheckIfProblemExistEvent value)? checkIfProblemExist,
    TResult Function(_ExtendProfileEvent value)? extendProfile,
    required TResult orElse(),
  }) {
    if (extendProfile != null) {
      return extendProfile(this);
    }
    return orElse();
  }
}

abstract class _ExtendProfileEvent implements ExtendProfileEvent {
  const factory _ExtendProfileEvent({required final MemberData updateFields}) =
      _$_ExtendProfileEvent;

  MemberData get updateFields;
  @JsonKey(ignore: true)
  _$$_ExtendProfileEventCopyWith<_$_ExtendProfileEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ExtendProfileState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            RequiredFields requiredBranchFields,
            MemberData memberFields,
            String branchNo,
            String branchId,
            String company)
        initial,
    required TResult Function(
            RequiredFields requiredBranchFields,
            MemberData memberFields,
            String branchNo,
            String branchId,
            String company)
        identifiedProblem,
    required TResult Function(
            RequiredFields requiredBranchFields,
            MemberData memberFields,
            String branchNo,
            String branchId,
            String company)
        loading,
    required TResult Function() conflictResolved,
    required TResult Function(
            CustomError error,
            RequiredFields requiredBranchFields,
            MemberData memberFields,
            String branchNo,
            String branchId,
            String company)
        error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            RequiredFields requiredBranchFields,
            MemberData memberFields,
            String branchNo,
            String branchId,
            String company)?
        initial,
    TResult? Function(
            RequiredFields requiredBranchFields,
            MemberData memberFields,
            String branchNo,
            String branchId,
            String company)?
        identifiedProblem,
    TResult? Function(
            RequiredFields requiredBranchFields,
            MemberData memberFields,
            String branchNo,
            String branchId,
            String company)?
        loading,
    TResult? Function()? conflictResolved,
    TResult? Function(
            CustomError error,
            RequiredFields requiredBranchFields,
            MemberData memberFields,
            String branchNo,
            String branchId,
            String company)?
        error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            RequiredFields requiredBranchFields,
            MemberData memberFields,
            String branchNo,
            String branchId,
            String company)?
        initial,
    TResult Function(
            RequiredFields requiredBranchFields,
            MemberData memberFields,
            String branchNo,
            String branchId,
            String company)?
        identifiedProblem,
    TResult Function(
            RequiredFields requiredBranchFields,
            MemberData memberFields,
            String branchNo,
            String branchId,
            String company)?
        loading,
    TResult Function()? conflictResolved,
    TResult Function(
            CustomError error,
            RequiredFields requiredBranchFields,
            MemberData memberFields,
            String branchNo,
            String branchId,
            String company)?
        error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitialState value) initial,
    required TResult Function(_IdentifiedProblemState value) identifiedProblem,
    required TResult Function(_LoadingState value) loading,
    required TResult Function(_ConflictResolvedState value) conflictResolved,
    required TResult Function(_ErrorState value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InitialState value)? initial,
    TResult? Function(_IdentifiedProblemState value)? identifiedProblem,
    TResult? Function(_LoadingState value)? loading,
    TResult? Function(_ConflictResolvedState value)? conflictResolved,
    TResult? Function(_ErrorState value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitialState value)? initial,
    TResult Function(_IdentifiedProblemState value)? identifiedProblem,
    TResult Function(_LoadingState value)? loading,
    TResult Function(_ConflictResolvedState value)? conflictResolved,
    TResult Function(_ErrorState value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExtendProfileStateCopyWith<$Res> {
  factory $ExtendProfileStateCopyWith(
          ExtendProfileState value, $Res Function(ExtendProfileState) then) =
      _$ExtendProfileStateCopyWithImpl<$Res, ExtendProfileState>;
}

/// @nodoc
class _$ExtendProfileStateCopyWithImpl<$Res, $Val extends ExtendProfileState>
    implements $ExtendProfileStateCopyWith<$Res> {
  _$ExtendProfileStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_InitialStateCopyWith<$Res> {
  factory _$$_InitialStateCopyWith(
          _$_InitialState value, $Res Function(_$_InitialState) then) =
      __$$_InitialStateCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {RequiredFields requiredBranchFields,
      MemberData memberFields,
      String branchNo,
      String branchId,
      String company});

  $RequiredFieldsCopyWith<$Res> get requiredBranchFields;
  $MemberDataCopyWith<$Res> get memberFields;
}

/// @nodoc
class __$$_InitialStateCopyWithImpl<$Res>
    extends _$ExtendProfileStateCopyWithImpl<$Res, _$_InitialState>
    implements _$$_InitialStateCopyWith<$Res> {
  __$$_InitialStateCopyWithImpl(
      _$_InitialState _value, $Res Function(_$_InitialState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? requiredBranchFields = null,
    Object? memberFields = null,
    Object? branchNo = null,
    Object? branchId = null,
    Object? company = null,
  }) {
    return _then(_$_InitialState(
      requiredBranchFields: null == requiredBranchFields
          ? _value.requiredBranchFields
          : requiredBranchFields // ignore: cast_nullable_to_non_nullable
              as RequiredFields,
      memberFields: null == memberFields
          ? _value.memberFields
          : memberFields // ignore: cast_nullable_to_non_nullable
              as MemberData,
      branchNo: null == branchNo
          ? _value.branchNo
          : branchNo // ignore: cast_nullable_to_non_nullable
              as String,
      branchId: null == branchId
          ? _value.branchId
          : branchId // ignore: cast_nullable_to_non_nullable
              as String,
      company: null == company
          ? _value.company
          : company // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $RequiredFieldsCopyWith<$Res> get requiredBranchFields {
    return $RequiredFieldsCopyWith<$Res>(_value.requiredBranchFields, (value) {
      return _then(_value.copyWith(requiredBranchFields: value));
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $MemberDataCopyWith<$Res> get memberFields {
    return $MemberDataCopyWith<$Res>(_value.memberFields, (value) {
      return _then(_value.copyWith(memberFields: value));
    });
  }
}

/// @nodoc

class _$_InitialState extends _InitialState {
  const _$_InitialState(
      {required this.requiredBranchFields,
      required this.memberFields,
      required this.branchNo,
      required this.branchId,
      required this.company})
      : super._();

  @override
  final RequiredFields requiredBranchFields;
  @override
  final MemberData memberFields;
  @override
  final String branchNo;
  @override
  final String branchId;
  @override
  final String company;

  @override
  String toString() {
    return 'ExtendProfileState.initial(requiredBranchFields: $requiredBranchFields, memberFields: $memberFields, branchNo: $branchNo, branchId: $branchId, company: $company)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_InitialState &&
            (identical(other.requiredBranchFields, requiredBranchFields) ||
                other.requiredBranchFields == requiredBranchFields) &&
            (identical(other.memberFields, memberFields) ||
                other.memberFields == memberFields) &&
            (identical(other.branchNo, branchNo) ||
                other.branchNo == branchNo) &&
            (identical(other.branchId, branchId) ||
                other.branchId == branchId) &&
            (identical(other.company, company) || other.company == company));
  }

  @override
  int get hashCode => Object.hash(runtimeType, requiredBranchFields,
      memberFields, branchNo, branchId, company);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_InitialStateCopyWith<_$_InitialState> get copyWith =>
      __$$_InitialStateCopyWithImpl<_$_InitialState>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            RequiredFields requiredBranchFields,
            MemberData memberFields,
            String branchNo,
            String branchId,
            String company)
        initial,
    required TResult Function(
            RequiredFields requiredBranchFields,
            MemberData memberFields,
            String branchNo,
            String branchId,
            String company)
        identifiedProblem,
    required TResult Function(
            RequiredFields requiredBranchFields,
            MemberData memberFields,
            String branchNo,
            String branchId,
            String company)
        loading,
    required TResult Function() conflictResolved,
    required TResult Function(
            CustomError error,
            RequiredFields requiredBranchFields,
            MemberData memberFields,
            String branchNo,
            String branchId,
            String company)
        error,
  }) {
    return initial(
        requiredBranchFields, memberFields, branchNo, branchId, company);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            RequiredFields requiredBranchFields,
            MemberData memberFields,
            String branchNo,
            String branchId,
            String company)?
        initial,
    TResult? Function(
            RequiredFields requiredBranchFields,
            MemberData memberFields,
            String branchNo,
            String branchId,
            String company)?
        identifiedProblem,
    TResult? Function(
            RequiredFields requiredBranchFields,
            MemberData memberFields,
            String branchNo,
            String branchId,
            String company)?
        loading,
    TResult? Function()? conflictResolved,
    TResult? Function(
            CustomError error,
            RequiredFields requiredBranchFields,
            MemberData memberFields,
            String branchNo,
            String branchId,
            String company)?
        error,
  }) {
    return initial?.call(
        requiredBranchFields, memberFields, branchNo, branchId, company);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            RequiredFields requiredBranchFields,
            MemberData memberFields,
            String branchNo,
            String branchId,
            String company)?
        initial,
    TResult Function(
            RequiredFields requiredBranchFields,
            MemberData memberFields,
            String branchNo,
            String branchId,
            String company)?
        identifiedProblem,
    TResult Function(
            RequiredFields requiredBranchFields,
            MemberData memberFields,
            String branchNo,
            String branchId,
            String company)?
        loading,
    TResult Function()? conflictResolved,
    TResult Function(
            CustomError error,
            RequiredFields requiredBranchFields,
            MemberData memberFields,
            String branchNo,
            String branchId,
            String company)?
        error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(
          requiredBranchFields, memberFields, branchNo, branchId, company);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitialState value) initial,
    required TResult Function(_IdentifiedProblemState value) identifiedProblem,
    required TResult Function(_LoadingState value) loading,
    required TResult Function(_ConflictResolvedState value) conflictResolved,
    required TResult Function(_ErrorState value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InitialState value)? initial,
    TResult? Function(_IdentifiedProblemState value)? identifiedProblem,
    TResult? Function(_LoadingState value)? loading,
    TResult? Function(_ConflictResolvedState value)? conflictResolved,
    TResult? Function(_ErrorState value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitialState value)? initial,
    TResult Function(_IdentifiedProblemState value)? identifiedProblem,
    TResult Function(_LoadingState value)? loading,
    TResult Function(_ConflictResolvedState value)? conflictResolved,
    TResult Function(_ErrorState value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _InitialState extends ExtendProfileState {
  const factory _InitialState(
      {required final RequiredFields requiredBranchFields,
      required final MemberData memberFields,
      required final String branchNo,
      required final String branchId,
      required final String company}) = _$_InitialState;
  const _InitialState._() : super._();

  RequiredFields get requiredBranchFields;
  MemberData get memberFields;
  String get branchNo;
  String get branchId;
  String get company;
  @JsonKey(ignore: true)
  _$$_InitialStateCopyWith<_$_InitialState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_IdentifiedProblemStateCopyWith<$Res> {
  factory _$$_IdentifiedProblemStateCopyWith(_$_IdentifiedProblemState value,
          $Res Function(_$_IdentifiedProblemState) then) =
      __$$_IdentifiedProblemStateCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {RequiredFields requiredBranchFields,
      MemberData memberFields,
      String branchNo,
      String branchId,
      String company});

  $RequiredFieldsCopyWith<$Res> get requiredBranchFields;
  $MemberDataCopyWith<$Res> get memberFields;
}

/// @nodoc
class __$$_IdentifiedProblemStateCopyWithImpl<$Res>
    extends _$ExtendProfileStateCopyWithImpl<$Res, _$_IdentifiedProblemState>
    implements _$$_IdentifiedProblemStateCopyWith<$Res> {
  __$$_IdentifiedProblemStateCopyWithImpl(_$_IdentifiedProblemState _value,
      $Res Function(_$_IdentifiedProblemState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? requiredBranchFields = null,
    Object? memberFields = null,
    Object? branchNo = null,
    Object? branchId = null,
    Object? company = null,
  }) {
    return _then(_$_IdentifiedProblemState(
      requiredBranchFields: null == requiredBranchFields
          ? _value.requiredBranchFields
          : requiredBranchFields // ignore: cast_nullable_to_non_nullable
              as RequiredFields,
      memberFields: null == memberFields
          ? _value.memberFields
          : memberFields // ignore: cast_nullable_to_non_nullable
              as MemberData,
      branchNo: null == branchNo
          ? _value.branchNo
          : branchNo // ignore: cast_nullable_to_non_nullable
              as String,
      branchId: null == branchId
          ? _value.branchId
          : branchId // ignore: cast_nullable_to_non_nullable
              as String,
      company: null == company
          ? _value.company
          : company // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $RequiredFieldsCopyWith<$Res> get requiredBranchFields {
    return $RequiredFieldsCopyWith<$Res>(_value.requiredBranchFields, (value) {
      return _then(_value.copyWith(requiredBranchFields: value));
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $MemberDataCopyWith<$Res> get memberFields {
    return $MemberDataCopyWith<$Res>(_value.memberFields, (value) {
      return _then(_value.copyWith(memberFields: value));
    });
  }
}

/// @nodoc

class _$_IdentifiedProblemState extends _IdentifiedProblemState {
  const _$_IdentifiedProblemState(
      {required this.requiredBranchFields,
      required this.memberFields,
      required this.branchNo,
      required this.branchId,
      required this.company})
      : super._();

  @override
  final RequiredFields requiredBranchFields;
  @override
  final MemberData memberFields;
  @override
  final String branchNo;
  @override
  final String branchId;
  @override
  final String company;

  @override
  String toString() {
    return 'ExtendProfileState.identifiedProblem(requiredBranchFields: $requiredBranchFields, memberFields: $memberFields, branchNo: $branchNo, branchId: $branchId, company: $company)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_IdentifiedProblemState &&
            (identical(other.requiredBranchFields, requiredBranchFields) ||
                other.requiredBranchFields == requiredBranchFields) &&
            (identical(other.memberFields, memberFields) ||
                other.memberFields == memberFields) &&
            (identical(other.branchNo, branchNo) ||
                other.branchNo == branchNo) &&
            (identical(other.branchId, branchId) ||
                other.branchId == branchId) &&
            (identical(other.company, company) || other.company == company));
  }

  @override
  int get hashCode => Object.hash(runtimeType, requiredBranchFields,
      memberFields, branchNo, branchId, company);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_IdentifiedProblemStateCopyWith<_$_IdentifiedProblemState> get copyWith =>
      __$$_IdentifiedProblemStateCopyWithImpl<_$_IdentifiedProblemState>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            RequiredFields requiredBranchFields,
            MemberData memberFields,
            String branchNo,
            String branchId,
            String company)
        initial,
    required TResult Function(
            RequiredFields requiredBranchFields,
            MemberData memberFields,
            String branchNo,
            String branchId,
            String company)
        identifiedProblem,
    required TResult Function(
            RequiredFields requiredBranchFields,
            MemberData memberFields,
            String branchNo,
            String branchId,
            String company)
        loading,
    required TResult Function() conflictResolved,
    required TResult Function(
            CustomError error,
            RequiredFields requiredBranchFields,
            MemberData memberFields,
            String branchNo,
            String branchId,
            String company)
        error,
  }) {
    return identifiedProblem(
        requiredBranchFields, memberFields, branchNo, branchId, company);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            RequiredFields requiredBranchFields,
            MemberData memberFields,
            String branchNo,
            String branchId,
            String company)?
        initial,
    TResult? Function(
            RequiredFields requiredBranchFields,
            MemberData memberFields,
            String branchNo,
            String branchId,
            String company)?
        identifiedProblem,
    TResult? Function(
            RequiredFields requiredBranchFields,
            MemberData memberFields,
            String branchNo,
            String branchId,
            String company)?
        loading,
    TResult? Function()? conflictResolved,
    TResult? Function(
            CustomError error,
            RequiredFields requiredBranchFields,
            MemberData memberFields,
            String branchNo,
            String branchId,
            String company)?
        error,
  }) {
    return identifiedProblem?.call(
        requiredBranchFields, memberFields, branchNo, branchId, company);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            RequiredFields requiredBranchFields,
            MemberData memberFields,
            String branchNo,
            String branchId,
            String company)?
        initial,
    TResult Function(
            RequiredFields requiredBranchFields,
            MemberData memberFields,
            String branchNo,
            String branchId,
            String company)?
        identifiedProblem,
    TResult Function(
            RequiredFields requiredBranchFields,
            MemberData memberFields,
            String branchNo,
            String branchId,
            String company)?
        loading,
    TResult Function()? conflictResolved,
    TResult Function(
            CustomError error,
            RequiredFields requiredBranchFields,
            MemberData memberFields,
            String branchNo,
            String branchId,
            String company)?
        error,
    required TResult orElse(),
  }) {
    if (identifiedProblem != null) {
      return identifiedProblem(
          requiredBranchFields, memberFields, branchNo, branchId, company);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitialState value) initial,
    required TResult Function(_IdentifiedProblemState value) identifiedProblem,
    required TResult Function(_LoadingState value) loading,
    required TResult Function(_ConflictResolvedState value) conflictResolved,
    required TResult Function(_ErrorState value) error,
  }) {
    return identifiedProblem(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InitialState value)? initial,
    TResult? Function(_IdentifiedProblemState value)? identifiedProblem,
    TResult? Function(_LoadingState value)? loading,
    TResult? Function(_ConflictResolvedState value)? conflictResolved,
    TResult? Function(_ErrorState value)? error,
  }) {
    return identifiedProblem?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitialState value)? initial,
    TResult Function(_IdentifiedProblemState value)? identifiedProblem,
    TResult Function(_LoadingState value)? loading,
    TResult Function(_ConflictResolvedState value)? conflictResolved,
    TResult Function(_ErrorState value)? error,
    required TResult orElse(),
  }) {
    if (identifiedProblem != null) {
      return identifiedProblem(this);
    }
    return orElse();
  }
}

abstract class _IdentifiedProblemState extends ExtendProfileState {
  const factory _IdentifiedProblemState(
      {required final RequiredFields requiredBranchFields,
      required final MemberData memberFields,
      required final String branchNo,
      required final String branchId,
      required final String company}) = _$_IdentifiedProblemState;
  const _IdentifiedProblemState._() : super._();

  RequiredFields get requiredBranchFields;
  MemberData get memberFields;
  String get branchNo;
  String get branchId;
  String get company;
  @JsonKey(ignore: true)
  _$$_IdentifiedProblemStateCopyWith<_$_IdentifiedProblemState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_LoadingStateCopyWith<$Res> {
  factory _$$_LoadingStateCopyWith(
          _$_LoadingState value, $Res Function(_$_LoadingState) then) =
      __$$_LoadingStateCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {RequiredFields requiredBranchFields,
      MemberData memberFields,
      String branchNo,
      String branchId,
      String company});

  $RequiredFieldsCopyWith<$Res> get requiredBranchFields;
  $MemberDataCopyWith<$Res> get memberFields;
}

/// @nodoc
class __$$_LoadingStateCopyWithImpl<$Res>
    extends _$ExtendProfileStateCopyWithImpl<$Res, _$_LoadingState>
    implements _$$_LoadingStateCopyWith<$Res> {
  __$$_LoadingStateCopyWithImpl(
      _$_LoadingState _value, $Res Function(_$_LoadingState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? requiredBranchFields = null,
    Object? memberFields = null,
    Object? branchNo = null,
    Object? branchId = null,
    Object? company = null,
  }) {
    return _then(_$_LoadingState(
      requiredBranchFields: null == requiredBranchFields
          ? _value.requiredBranchFields
          : requiredBranchFields // ignore: cast_nullable_to_non_nullable
              as RequiredFields,
      memberFields: null == memberFields
          ? _value.memberFields
          : memberFields // ignore: cast_nullable_to_non_nullable
              as MemberData,
      branchNo: null == branchNo
          ? _value.branchNo
          : branchNo // ignore: cast_nullable_to_non_nullable
              as String,
      branchId: null == branchId
          ? _value.branchId
          : branchId // ignore: cast_nullable_to_non_nullable
              as String,
      company: null == company
          ? _value.company
          : company // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $RequiredFieldsCopyWith<$Res> get requiredBranchFields {
    return $RequiredFieldsCopyWith<$Res>(_value.requiredBranchFields, (value) {
      return _then(_value.copyWith(requiredBranchFields: value));
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $MemberDataCopyWith<$Res> get memberFields {
    return $MemberDataCopyWith<$Res>(_value.memberFields, (value) {
      return _then(_value.copyWith(memberFields: value));
    });
  }
}

/// @nodoc

class _$_LoadingState extends _LoadingState {
  const _$_LoadingState(
      {required this.requiredBranchFields,
      required this.memberFields,
      required this.branchNo,
      required this.branchId,
      required this.company})
      : super._();

  @override
  final RequiredFields requiredBranchFields;
  @override
  final MemberData memberFields;
  @override
  final String branchNo;
  @override
  final String branchId;
  @override
  final String company;

  @override
  String toString() {
    return 'ExtendProfileState.loading(requiredBranchFields: $requiredBranchFields, memberFields: $memberFields, branchNo: $branchNo, branchId: $branchId, company: $company)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LoadingState &&
            (identical(other.requiredBranchFields, requiredBranchFields) ||
                other.requiredBranchFields == requiredBranchFields) &&
            (identical(other.memberFields, memberFields) ||
                other.memberFields == memberFields) &&
            (identical(other.branchNo, branchNo) ||
                other.branchNo == branchNo) &&
            (identical(other.branchId, branchId) ||
                other.branchId == branchId) &&
            (identical(other.company, company) || other.company == company));
  }

  @override
  int get hashCode => Object.hash(runtimeType, requiredBranchFields,
      memberFields, branchNo, branchId, company);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LoadingStateCopyWith<_$_LoadingState> get copyWith =>
      __$$_LoadingStateCopyWithImpl<_$_LoadingState>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            RequiredFields requiredBranchFields,
            MemberData memberFields,
            String branchNo,
            String branchId,
            String company)
        initial,
    required TResult Function(
            RequiredFields requiredBranchFields,
            MemberData memberFields,
            String branchNo,
            String branchId,
            String company)
        identifiedProblem,
    required TResult Function(
            RequiredFields requiredBranchFields,
            MemberData memberFields,
            String branchNo,
            String branchId,
            String company)
        loading,
    required TResult Function() conflictResolved,
    required TResult Function(
            CustomError error,
            RequiredFields requiredBranchFields,
            MemberData memberFields,
            String branchNo,
            String branchId,
            String company)
        error,
  }) {
    return loading(
        requiredBranchFields, memberFields, branchNo, branchId, company);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            RequiredFields requiredBranchFields,
            MemberData memberFields,
            String branchNo,
            String branchId,
            String company)?
        initial,
    TResult? Function(
            RequiredFields requiredBranchFields,
            MemberData memberFields,
            String branchNo,
            String branchId,
            String company)?
        identifiedProblem,
    TResult? Function(
            RequiredFields requiredBranchFields,
            MemberData memberFields,
            String branchNo,
            String branchId,
            String company)?
        loading,
    TResult? Function()? conflictResolved,
    TResult? Function(
            CustomError error,
            RequiredFields requiredBranchFields,
            MemberData memberFields,
            String branchNo,
            String branchId,
            String company)?
        error,
  }) {
    return loading?.call(
        requiredBranchFields, memberFields, branchNo, branchId, company);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            RequiredFields requiredBranchFields,
            MemberData memberFields,
            String branchNo,
            String branchId,
            String company)?
        initial,
    TResult Function(
            RequiredFields requiredBranchFields,
            MemberData memberFields,
            String branchNo,
            String branchId,
            String company)?
        identifiedProblem,
    TResult Function(
            RequiredFields requiredBranchFields,
            MemberData memberFields,
            String branchNo,
            String branchId,
            String company)?
        loading,
    TResult Function()? conflictResolved,
    TResult Function(
            CustomError error,
            RequiredFields requiredBranchFields,
            MemberData memberFields,
            String branchNo,
            String branchId,
            String company)?
        error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(
          requiredBranchFields, memberFields, branchNo, branchId, company);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitialState value) initial,
    required TResult Function(_IdentifiedProblemState value) identifiedProblem,
    required TResult Function(_LoadingState value) loading,
    required TResult Function(_ConflictResolvedState value) conflictResolved,
    required TResult Function(_ErrorState value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InitialState value)? initial,
    TResult? Function(_IdentifiedProblemState value)? identifiedProblem,
    TResult? Function(_LoadingState value)? loading,
    TResult? Function(_ConflictResolvedState value)? conflictResolved,
    TResult? Function(_ErrorState value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitialState value)? initial,
    TResult Function(_IdentifiedProblemState value)? identifiedProblem,
    TResult Function(_LoadingState value)? loading,
    TResult Function(_ConflictResolvedState value)? conflictResolved,
    TResult Function(_ErrorState value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _LoadingState extends ExtendProfileState {
  const factory _LoadingState(
      {required final RequiredFields requiredBranchFields,
      required final MemberData memberFields,
      required final String branchNo,
      required final String branchId,
      required final String company}) = _$_LoadingState;
  const _LoadingState._() : super._();

  RequiredFields get requiredBranchFields;
  MemberData get memberFields;
  String get branchNo;
  String get branchId;
  String get company;
  @JsonKey(ignore: true)
  _$$_LoadingStateCopyWith<_$_LoadingState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_ConflictResolvedStateCopyWith<$Res> {
  factory _$$_ConflictResolvedStateCopyWith(_$_ConflictResolvedState value,
          $Res Function(_$_ConflictResolvedState) then) =
      __$$_ConflictResolvedStateCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_ConflictResolvedStateCopyWithImpl<$Res>
    extends _$ExtendProfileStateCopyWithImpl<$Res, _$_ConflictResolvedState>
    implements _$$_ConflictResolvedStateCopyWith<$Res> {
  __$$_ConflictResolvedStateCopyWithImpl(_$_ConflictResolvedState _value,
      $Res Function(_$_ConflictResolvedState) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_ConflictResolvedState extends _ConflictResolvedState {
  const _$_ConflictResolvedState() : super._();

  @override
  String toString() {
    return 'ExtendProfileState.conflictResolved()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_ConflictResolvedState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            RequiredFields requiredBranchFields,
            MemberData memberFields,
            String branchNo,
            String branchId,
            String company)
        initial,
    required TResult Function(
            RequiredFields requiredBranchFields,
            MemberData memberFields,
            String branchNo,
            String branchId,
            String company)
        identifiedProblem,
    required TResult Function(
            RequiredFields requiredBranchFields,
            MemberData memberFields,
            String branchNo,
            String branchId,
            String company)
        loading,
    required TResult Function() conflictResolved,
    required TResult Function(
            CustomError error,
            RequiredFields requiredBranchFields,
            MemberData memberFields,
            String branchNo,
            String branchId,
            String company)
        error,
  }) {
    return conflictResolved();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            RequiredFields requiredBranchFields,
            MemberData memberFields,
            String branchNo,
            String branchId,
            String company)?
        initial,
    TResult? Function(
            RequiredFields requiredBranchFields,
            MemberData memberFields,
            String branchNo,
            String branchId,
            String company)?
        identifiedProblem,
    TResult? Function(
            RequiredFields requiredBranchFields,
            MemberData memberFields,
            String branchNo,
            String branchId,
            String company)?
        loading,
    TResult? Function()? conflictResolved,
    TResult? Function(
            CustomError error,
            RequiredFields requiredBranchFields,
            MemberData memberFields,
            String branchNo,
            String branchId,
            String company)?
        error,
  }) {
    return conflictResolved?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            RequiredFields requiredBranchFields,
            MemberData memberFields,
            String branchNo,
            String branchId,
            String company)?
        initial,
    TResult Function(
            RequiredFields requiredBranchFields,
            MemberData memberFields,
            String branchNo,
            String branchId,
            String company)?
        identifiedProblem,
    TResult Function(
            RequiredFields requiredBranchFields,
            MemberData memberFields,
            String branchNo,
            String branchId,
            String company)?
        loading,
    TResult Function()? conflictResolved,
    TResult Function(
            CustomError error,
            RequiredFields requiredBranchFields,
            MemberData memberFields,
            String branchNo,
            String branchId,
            String company)?
        error,
    required TResult orElse(),
  }) {
    if (conflictResolved != null) {
      return conflictResolved();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitialState value) initial,
    required TResult Function(_IdentifiedProblemState value) identifiedProblem,
    required TResult Function(_LoadingState value) loading,
    required TResult Function(_ConflictResolvedState value) conflictResolved,
    required TResult Function(_ErrorState value) error,
  }) {
    return conflictResolved(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InitialState value)? initial,
    TResult? Function(_IdentifiedProblemState value)? identifiedProblem,
    TResult? Function(_LoadingState value)? loading,
    TResult? Function(_ConflictResolvedState value)? conflictResolved,
    TResult? Function(_ErrorState value)? error,
  }) {
    return conflictResolved?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitialState value)? initial,
    TResult Function(_IdentifiedProblemState value)? identifiedProblem,
    TResult Function(_LoadingState value)? loading,
    TResult Function(_ConflictResolvedState value)? conflictResolved,
    TResult Function(_ErrorState value)? error,
    required TResult orElse(),
  }) {
    if (conflictResolved != null) {
      return conflictResolved(this);
    }
    return orElse();
  }
}

abstract class _ConflictResolvedState extends ExtendProfileState {
  const factory _ConflictResolvedState() = _$_ConflictResolvedState;
  const _ConflictResolvedState._() : super._();
}

/// @nodoc
abstract class _$$_ErrorStateCopyWith<$Res> {
  factory _$$_ErrorStateCopyWith(
          _$_ErrorState value, $Res Function(_$_ErrorState) then) =
      __$$_ErrorStateCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {CustomError error,
      RequiredFields requiredBranchFields,
      MemberData memberFields,
      String branchNo,
      String branchId,
      String company});

  $RequiredFieldsCopyWith<$Res> get requiredBranchFields;
  $MemberDataCopyWith<$Res> get memberFields;
}

/// @nodoc
class __$$_ErrorStateCopyWithImpl<$Res>
    extends _$ExtendProfileStateCopyWithImpl<$Res, _$_ErrorState>
    implements _$$_ErrorStateCopyWith<$Res> {
  __$$_ErrorStateCopyWithImpl(
      _$_ErrorState _value, $Res Function(_$_ErrorState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
    Object? requiredBranchFields = null,
    Object? memberFields = null,
    Object? branchNo = null,
    Object? branchId = null,
    Object? company = null,
  }) {
    return _then(_$_ErrorState(
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as CustomError,
      requiredBranchFields: null == requiredBranchFields
          ? _value.requiredBranchFields
          : requiredBranchFields // ignore: cast_nullable_to_non_nullable
              as RequiredFields,
      memberFields: null == memberFields
          ? _value.memberFields
          : memberFields // ignore: cast_nullable_to_non_nullable
              as MemberData,
      branchNo: null == branchNo
          ? _value.branchNo
          : branchNo // ignore: cast_nullable_to_non_nullable
              as String,
      branchId: null == branchId
          ? _value.branchId
          : branchId // ignore: cast_nullable_to_non_nullable
              as String,
      company: null == company
          ? _value.company
          : company // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $RequiredFieldsCopyWith<$Res> get requiredBranchFields {
    return $RequiredFieldsCopyWith<$Res>(_value.requiredBranchFields, (value) {
      return _then(_value.copyWith(requiredBranchFields: value));
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $MemberDataCopyWith<$Res> get memberFields {
    return $MemberDataCopyWith<$Res>(_value.memberFields, (value) {
      return _then(_value.copyWith(memberFields: value));
    });
  }
}

/// @nodoc

class _$_ErrorState extends _ErrorState {
  const _$_ErrorState(
      {required this.error,
      required this.requiredBranchFields,
      required this.memberFields,
      required this.branchNo,
      required this.branchId,
      required this.company})
      : super._();

  @override
  final CustomError error;
  @override
  final RequiredFields requiredBranchFields;
  @override
  final MemberData memberFields;
  @override
  final String branchNo;
  @override
  final String branchId;
  @override
  final String company;

  @override
  String toString() {
    return 'ExtendProfileState.error(error: $error, requiredBranchFields: $requiredBranchFields, memberFields: $memberFields, branchNo: $branchNo, branchId: $branchId, company: $company)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ErrorState &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.requiredBranchFields, requiredBranchFields) ||
                other.requiredBranchFields == requiredBranchFields) &&
            (identical(other.memberFields, memberFields) ||
                other.memberFields == memberFields) &&
            (identical(other.branchNo, branchNo) ||
                other.branchNo == branchNo) &&
            (identical(other.branchId, branchId) ||
                other.branchId == branchId) &&
            (identical(other.company, company) || other.company == company));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error, requiredBranchFields,
      memberFields, branchNo, branchId, company);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ErrorStateCopyWith<_$_ErrorState> get copyWith =>
      __$$_ErrorStateCopyWithImpl<_$_ErrorState>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            RequiredFields requiredBranchFields,
            MemberData memberFields,
            String branchNo,
            String branchId,
            String company)
        initial,
    required TResult Function(
            RequiredFields requiredBranchFields,
            MemberData memberFields,
            String branchNo,
            String branchId,
            String company)
        identifiedProblem,
    required TResult Function(
            RequiredFields requiredBranchFields,
            MemberData memberFields,
            String branchNo,
            String branchId,
            String company)
        loading,
    required TResult Function() conflictResolved,
    required TResult Function(
            CustomError error,
            RequiredFields requiredBranchFields,
            MemberData memberFields,
            String branchNo,
            String branchId,
            String company)
        error,
  }) {
    return error(this.error, requiredBranchFields, memberFields, branchNo,
        branchId, company);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            RequiredFields requiredBranchFields,
            MemberData memberFields,
            String branchNo,
            String branchId,
            String company)?
        initial,
    TResult? Function(
            RequiredFields requiredBranchFields,
            MemberData memberFields,
            String branchNo,
            String branchId,
            String company)?
        identifiedProblem,
    TResult? Function(
            RequiredFields requiredBranchFields,
            MemberData memberFields,
            String branchNo,
            String branchId,
            String company)?
        loading,
    TResult? Function()? conflictResolved,
    TResult? Function(
            CustomError error,
            RequiredFields requiredBranchFields,
            MemberData memberFields,
            String branchNo,
            String branchId,
            String company)?
        error,
  }) {
    return error?.call(this.error, requiredBranchFields, memberFields, branchNo,
        branchId, company);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            RequiredFields requiredBranchFields,
            MemberData memberFields,
            String branchNo,
            String branchId,
            String company)?
        initial,
    TResult Function(
            RequiredFields requiredBranchFields,
            MemberData memberFields,
            String branchNo,
            String branchId,
            String company)?
        identifiedProblem,
    TResult Function(
            RequiredFields requiredBranchFields,
            MemberData memberFields,
            String branchNo,
            String branchId,
            String company)?
        loading,
    TResult Function()? conflictResolved,
    TResult Function(
            CustomError error,
            RequiredFields requiredBranchFields,
            MemberData memberFields,
            String branchNo,
            String branchId,
            String company)?
        error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this.error, requiredBranchFields, memberFields, branchNo,
          branchId, company);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitialState value) initial,
    required TResult Function(_IdentifiedProblemState value) identifiedProblem,
    required TResult Function(_LoadingState value) loading,
    required TResult Function(_ConflictResolvedState value) conflictResolved,
    required TResult Function(_ErrorState value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InitialState value)? initial,
    TResult? Function(_IdentifiedProblemState value)? identifiedProblem,
    TResult? Function(_LoadingState value)? loading,
    TResult? Function(_ConflictResolvedState value)? conflictResolved,
    TResult? Function(_ErrorState value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitialState value)? initial,
    TResult Function(_IdentifiedProblemState value)? identifiedProblem,
    TResult Function(_LoadingState value)? loading,
    TResult Function(_ConflictResolvedState value)? conflictResolved,
    TResult Function(_ErrorState value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _ErrorState extends ExtendProfileState {
  const factory _ErrorState(
      {required final CustomError error,
      required final RequiredFields requiredBranchFields,
      required final MemberData memberFields,
      required final String branchNo,
      required final String branchId,
      required final String company}) = _$_ErrorState;
  const _ErrorState._() : super._();

  CustomError get error;
  RequiredFields get requiredBranchFields;
  MemberData get memberFields;
  String get branchNo;
  String get branchId;
  String get company;
  @JsonKey(ignore: true)
  _$$_ErrorStateCopyWith<_$_ErrorState> get copyWith =>
      throw _privateConstructorUsedError;
}

// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'branch_registration_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$BranchRegistrationEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String data) receivedDataFromScanner,
    required TResult Function() confirmBranchTerms,
    required TResult Function() rejectBranchTerms,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String data)? receivedDataFromScanner,
    TResult? Function()? confirmBranchTerms,
    TResult? Function()? rejectBranchTerms,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String data)? receivedDataFromScanner,
    TResult Function()? confirmBranchTerms,
    TResult Function()? rejectBranchTerms,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ReceivedDataFromScannerEvent value)
        receivedDataFromScanner,
    required TResult Function(_ConfirmBranchTermsEvent value)
        confirmBranchTerms,
    required TResult Function(_RejectBranchTermsEvent value) rejectBranchTerms,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ReceivedDataFromScannerEvent value)?
        receivedDataFromScanner,
    TResult? Function(_ConfirmBranchTermsEvent value)? confirmBranchTerms,
    TResult? Function(_RejectBranchTermsEvent value)? rejectBranchTerms,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ReceivedDataFromScannerEvent value)?
        receivedDataFromScanner,
    TResult Function(_ConfirmBranchTermsEvent value)? confirmBranchTerms,
    TResult Function(_RejectBranchTermsEvent value)? rejectBranchTerms,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BranchRegistrationEventCopyWith<$Res> {
  factory $BranchRegistrationEventCopyWith(BranchRegistrationEvent value,
          $Res Function(BranchRegistrationEvent) then) =
      _$BranchRegistrationEventCopyWithImpl<$Res, BranchRegistrationEvent>;
}

/// @nodoc
class _$BranchRegistrationEventCopyWithImpl<$Res,
        $Val extends BranchRegistrationEvent>
    implements $BranchRegistrationEventCopyWith<$Res> {
  _$BranchRegistrationEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_ReceivedDataFromScannerEventCopyWith<$Res> {
  factory _$$_ReceivedDataFromScannerEventCopyWith(
          _$_ReceivedDataFromScannerEvent value,
          $Res Function(_$_ReceivedDataFromScannerEvent) then) =
      __$$_ReceivedDataFromScannerEventCopyWithImpl<$Res>;
  @useResult
  $Res call({String data});
}

/// @nodoc
class __$$_ReceivedDataFromScannerEventCopyWithImpl<$Res>
    extends _$BranchRegistrationEventCopyWithImpl<$Res,
        _$_ReceivedDataFromScannerEvent>
    implements _$$_ReceivedDataFromScannerEventCopyWith<$Res> {
  __$$_ReceivedDataFromScannerEventCopyWithImpl(
      _$_ReceivedDataFromScannerEvent _value,
      $Res Function(_$_ReceivedDataFromScannerEvent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_$_ReceivedDataFromScannerEvent(
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_ReceivedDataFromScannerEvent implements _ReceivedDataFromScannerEvent {
  const _$_ReceivedDataFromScannerEvent({required this.data});

  @override
  final String data;

  @override
  String toString() {
    return 'BranchRegistrationEvent.receivedDataFromScanner(data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ReceivedDataFromScannerEvent &&
            (identical(other.data, data) || other.data == data));
  }

  @override
  int get hashCode => Object.hash(runtimeType, data);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ReceivedDataFromScannerEventCopyWith<_$_ReceivedDataFromScannerEvent>
      get copyWith => __$$_ReceivedDataFromScannerEventCopyWithImpl<
          _$_ReceivedDataFromScannerEvent>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String data) receivedDataFromScanner,
    required TResult Function() confirmBranchTerms,
    required TResult Function() rejectBranchTerms,
  }) {
    return receivedDataFromScanner(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String data)? receivedDataFromScanner,
    TResult? Function()? confirmBranchTerms,
    TResult? Function()? rejectBranchTerms,
  }) {
    return receivedDataFromScanner?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String data)? receivedDataFromScanner,
    TResult Function()? confirmBranchTerms,
    TResult Function()? rejectBranchTerms,
    required TResult orElse(),
  }) {
    if (receivedDataFromScanner != null) {
      return receivedDataFromScanner(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ReceivedDataFromScannerEvent value)
        receivedDataFromScanner,
    required TResult Function(_ConfirmBranchTermsEvent value)
        confirmBranchTerms,
    required TResult Function(_RejectBranchTermsEvent value) rejectBranchTerms,
  }) {
    return receivedDataFromScanner(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ReceivedDataFromScannerEvent value)?
        receivedDataFromScanner,
    TResult? Function(_ConfirmBranchTermsEvent value)? confirmBranchTerms,
    TResult? Function(_RejectBranchTermsEvent value)? rejectBranchTerms,
  }) {
    return receivedDataFromScanner?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ReceivedDataFromScannerEvent value)?
        receivedDataFromScanner,
    TResult Function(_ConfirmBranchTermsEvent value)? confirmBranchTerms,
    TResult Function(_RejectBranchTermsEvent value)? rejectBranchTerms,
    required TResult orElse(),
  }) {
    if (receivedDataFromScanner != null) {
      return receivedDataFromScanner(this);
    }
    return orElse();
  }
}

abstract class _ReceivedDataFromScannerEvent
    implements BranchRegistrationEvent {
  const factory _ReceivedDataFromScannerEvent({required final String data}) =
      _$_ReceivedDataFromScannerEvent;

  String get data;
  @JsonKey(ignore: true)
  _$$_ReceivedDataFromScannerEventCopyWith<_$_ReceivedDataFromScannerEvent>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_ConfirmBranchTermsEventCopyWith<$Res> {
  factory _$$_ConfirmBranchTermsEventCopyWith(_$_ConfirmBranchTermsEvent value,
          $Res Function(_$_ConfirmBranchTermsEvent) then) =
      __$$_ConfirmBranchTermsEventCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_ConfirmBranchTermsEventCopyWithImpl<$Res>
    extends _$BranchRegistrationEventCopyWithImpl<$Res,
        _$_ConfirmBranchTermsEvent>
    implements _$$_ConfirmBranchTermsEventCopyWith<$Res> {
  __$$_ConfirmBranchTermsEventCopyWithImpl(_$_ConfirmBranchTermsEvent _value,
      $Res Function(_$_ConfirmBranchTermsEvent) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_ConfirmBranchTermsEvent implements _ConfirmBranchTermsEvent {
  const _$_ConfirmBranchTermsEvent();

  @override
  String toString() {
    return 'BranchRegistrationEvent.confirmBranchTerms()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ConfirmBranchTermsEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String data) receivedDataFromScanner,
    required TResult Function() confirmBranchTerms,
    required TResult Function() rejectBranchTerms,
  }) {
    return confirmBranchTerms();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String data)? receivedDataFromScanner,
    TResult? Function()? confirmBranchTerms,
    TResult? Function()? rejectBranchTerms,
  }) {
    return confirmBranchTerms?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String data)? receivedDataFromScanner,
    TResult Function()? confirmBranchTerms,
    TResult Function()? rejectBranchTerms,
    required TResult orElse(),
  }) {
    if (confirmBranchTerms != null) {
      return confirmBranchTerms();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ReceivedDataFromScannerEvent value)
        receivedDataFromScanner,
    required TResult Function(_ConfirmBranchTermsEvent value)
        confirmBranchTerms,
    required TResult Function(_RejectBranchTermsEvent value) rejectBranchTerms,
  }) {
    return confirmBranchTerms(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ReceivedDataFromScannerEvent value)?
        receivedDataFromScanner,
    TResult? Function(_ConfirmBranchTermsEvent value)? confirmBranchTerms,
    TResult? Function(_RejectBranchTermsEvent value)? rejectBranchTerms,
  }) {
    return confirmBranchTerms?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ReceivedDataFromScannerEvent value)?
        receivedDataFromScanner,
    TResult Function(_ConfirmBranchTermsEvent value)? confirmBranchTerms,
    TResult Function(_RejectBranchTermsEvent value)? rejectBranchTerms,
    required TResult orElse(),
  }) {
    if (confirmBranchTerms != null) {
      return confirmBranchTerms(this);
    }
    return orElse();
  }
}

abstract class _ConfirmBranchTermsEvent implements BranchRegistrationEvent {
  const factory _ConfirmBranchTermsEvent() = _$_ConfirmBranchTermsEvent;
}

/// @nodoc
abstract class _$$_RejectBranchTermsEventCopyWith<$Res> {
  factory _$$_RejectBranchTermsEventCopyWith(_$_RejectBranchTermsEvent value,
          $Res Function(_$_RejectBranchTermsEvent) then) =
      __$$_RejectBranchTermsEventCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_RejectBranchTermsEventCopyWithImpl<$Res>
    extends _$BranchRegistrationEventCopyWithImpl<$Res,
        _$_RejectBranchTermsEvent>
    implements _$$_RejectBranchTermsEventCopyWith<$Res> {
  __$$_RejectBranchTermsEventCopyWithImpl(_$_RejectBranchTermsEvent _value,
      $Res Function(_$_RejectBranchTermsEvent) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_RejectBranchTermsEvent implements _RejectBranchTermsEvent {
  const _$_RejectBranchTermsEvent();

  @override
  String toString() {
    return 'BranchRegistrationEvent.rejectBranchTerms()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RejectBranchTermsEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String data) receivedDataFromScanner,
    required TResult Function() confirmBranchTerms,
    required TResult Function() rejectBranchTerms,
  }) {
    return rejectBranchTerms();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String data)? receivedDataFromScanner,
    TResult? Function()? confirmBranchTerms,
    TResult? Function()? rejectBranchTerms,
  }) {
    return rejectBranchTerms?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String data)? receivedDataFromScanner,
    TResult Function()? confirmBranchTerms,
    TResult Function()? rejectBranchTerms,
    required TResult orElse(),
  }) {
    if (rejectBranchTerms != null) {
      return rejectBranchTerms();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ReceivedDataFromScannerEvent value)
        receivedDataFromScanner,
    required TResult Function(_ConfirmBranchTermsEvent value)
        confirmBranchTerms,
    required TResult Function(_RejectBranchTermsEvent value) rejectBranchTerms,
  }) {
    return rejectBranchTerms(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ReceivedDataFromScannerEvent value)?
        receivedDataFromScanner,
    TResult? Function(_ConfirmBranchTermsEvent value)? confirmBranchTerms,
    TResult? Function(_RejectBranchTermsEvent value)? rejectBranchTerms,
  }) {
    return rejectBranchTerms?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ReceivedDataFromScannerEvent value)?
        receivedDataFromScanner,
    TResult Function(_ConfirmBranchTermsEvent value)? confirmBranchTerms,
    TResult Function(_RejectBranchTermsEvent value)? rejectBranchTerms,
    required TResult orElse(),
  }) {
    if (rejectBranchTerms != null) {
      return rejectBranchTerms(this);
    }
    return orElse();
  }
}

abstract class _RejectBranchTermsEvent implements BranchRegistrationEvent {
  const factory _RejectBranchTermsEvent() = _$_RejectBranchTermsEvent;
}

/// @nodoc
mixin _$BranchRegistrationState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(CustomError error, BranchQrData? branchData)
        error,
    required TResult Function(BranchQrData? branchData, AppDocuments? documents)
        foundBranch,
    required TResult Function(
            BranchQrData branchData, RequiredFields requiredFields)
        added,
    required TResult Function() rejected,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(CustomError error, BranchQrData? branchData)? error,
    TResult? Function(BranchQrData? branchData, AppDocuments? documents)?
        foundBranch,
    TResult? Function(BranchQrData branchData, RequiredFields requiredFields)?
        added,
    TResult? Function()? rejected,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(CustomError error, BranchQrData? branchData)? error,
    TResult Function(BranchQrData? branchData, AppDocuments? documents)?
        foundBranch,
    TResult Function(BranchQrData branchData, RequiredFields requiredFields)?
        added,
    TResult Function()? rejected,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitialState value) initial,
    required TResult Function(_ErrorState value) error,
    required TResult Function(_FoundBranchState value) foundBranch,
    required TResult Function(_AddedState value) added,
    required TResult Function(_RejectedState value) rejected,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InitialState value)? initial,
    TResult? Function(_ErrorState value)? error,
    TResult? Function(_FoundBranchState value)? foundBranch,
    TResult? Function(_AddedState value)? added,
    TResult? Function(_RejectedState value)? rejected,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitialState value)? initial,
    TResult Function(_ErrorState value)? error,
    TResult Function(_FoundBranchState value)? foundBranch,
    TResult Function(_AddedState value)? added,
    TResult Function(_RejectedState value)? rejected,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BranchRegistrationStateCopyWith<$Res> {
  factory $BranchRegistrationStateCopyWith(BranchRegistrationState value,
          $Res Function(BranchRegistrationState) then) =
      _$BranchRegistrationStateCopyWithImpl<$Res, BranchRegistrationState>;
}

/// @nodoc
class _$BranchRegistrationStateCopyWithImpl<$Res,
        $Val extends BranchRegistrationState>
    implements $BranchRegistrationStateCopyWith<$Res> {
  _$BranchRegistrationStateCopyWithImpl(this._value, this._then);

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
}

/// @nodoc
class __$$_InitialStateCopyWithImpl<$Res>
    extends _$BranchRegistrationStateCopyWithImpl<$Res, _$_InitialState>
    implements _$$_InitialStateCopyWith<$Res> {
  __$$_InitialStateCopyWithImpl(
      _$_InitialState _value, $Res Function(_$_InitialState) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_InitialState implements _InitialState {
  const _$_InitialState();

  @override
  String toString() {
    return 'BranchRegistrationState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_InitialState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(CustomError error, BranchQrData? branchData)
        error,
    required TResult Function(BranchQrData? branchData, AppDocuments? documents)
        foundBranch,
    required TResult Function(
            BranchQrData branchData, RequiredFields requiredFields)
        added,
    required TResult Function() rejected,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(CustomError error, BranchQrData? branchData)? error,
    TResult? Function(BranchQrData? branchData, AppDocuments? documents)?
        foundBranch,
    TResult? Function(BranchQrData branchData, RequiredFields requiredFields)?
        added,
    TResult? Function()? rejected,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(CustomError error, BranchQrData? branchData)? error,
    TResult Function(BranchQrData? branchData, AppDocuments? documents)?
        foundBranch,
    TResult Function(BranchQrData branchData, RequiredFields requiredFields)?
        added,
    TResult Function()? rejected,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitialState value) initial,
    required TResult Function(_ErrorState value) error,
    required TResult Function(_FoundBranchState value) foundBranch,
    required TResult Function(_AddedState value) added,
    required TResult Function(_RejectedState value) rejected,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InitialState value)? initial,
    TResult? Function(_ErrorState value)? error,
    TResult? Function(_FoundBranchState value)? foundBranch,
    TResult? Function(_AddedState value)? added,
    TResult? Function(_RejectedState value)? rejected,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitialState value)? initial,
    TResult Function(_ErrorState value)? error,
    TResult Function(_FoundBranchState value)? foundBranch,
    TResult Function(_AddedState value)? added,
    TResult Function(_RejectedState value)? rejected,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _InitialState implements BranchRegistrationState {
  const factory _InitialState() = _$_InitialState;
}

/// @nodoc
abstract class _$$_ErrorStateCopyWith<$Res> {
  factory _$$_ErrorStateCopyWith(
          _$_ErrorState value, $Res Function(_$_ErrorState) then) =
      __$$_ErrorStateCopyWithImpl<$Res>;
  @useResult
  $Res call({CustomError error, BranchQrData? branchData});

  $BranchQrDataCopyWith<$Res>? get branchData;
}

/// @nodoc
class __$$_ErrorStateCopyWithImpl<$Res>
    extends _$BranchRegistrationStateCopyWithImpl<$Res, _$_ErrorState>
    implements _$$_ErrorStateCopyWith<$Res> {
  __$$_ErrorStateCopyWithImpl(
      _$_ErrorState _value, $Res Function(_$_ErrorState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
    Object? branchData = freezed,
  }) {
    return _then(_$_ErrorState(
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as CustomError,
      branchData: freezed == branchData
          ? _value.branchData
          : branchData // ignore: cast_nullable_to_non_nullable
              as BranchQrData?,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $BranchQrDataCopyWith<$Res>? get branchData {
    if (_value.branchData == null) {
      return null;
    }

    return $BranchQrDataCopyWith<$Res>(_value.branchData!, (value) {
      return _then(_value.copyWith(branchData: value));
    });
  }
}

/// @nodoc

class _$_ErrorState implements _ErrorState {
  const _$_ErrorState({required this.error, required this.branchData});

  @override
  final CustomError error;
  @override
  final BranchQrData? branchData;

  @override
  String toString() {
    return 'BranchRegistrationState.error(error: $error, branchData: $branchData)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ErrorState &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.branchData, branchData) ||
                other.branchData == branchData));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error, branchData);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ErrorStateCopyWith<_$_ErrorState> get copyWith =>
      __$$_ErrorStateCopyWithImpl<_$_ErrorState>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(CustomError error, BranchQrData? branchData)
        error,
    required TResult Function(BranchQrData? branchData, AppDocuments? documents)
        foundBranch,
    required TResult Function(
            BranchQrData branchData, RequiredFields requiredFields)
        added,
    required TResult Function() rejected,
  }) {
    return error(this.error, branchData);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(CustomError error, BranchQrData? branchData)? error,
    TResult? Function(BranchQrData? branchData, AppDocuments? documents)?
        foundBranch,
    TResult? Function(BranchQrData branchData, RequiredFields requiredFields)?
        added,
    TResult? Function()? rejected,
  }) {
    return error?.call(this.error, branchData);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(CustomError error, BranchQrData? branchData)? error,
    TResult Function(BranchQrData? branchData, AppDocuments? documents)?
        foundBranch,
    TResult Function(BranchQrData branchData, RequiredFields requiredFields)?
        added,
    TResult Function()? rejected,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this.error, branchData);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitialState value) initial,
    required TResult Function(_ErrorState value) error,
    required TResult Function(_FoundBranchState value) foundBranch,
    required TResult Function(_AddedState value) added,
    required TResult Function(_RejectedState value) rejected,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InitialState value)? initial,
    TResult? Function(_ErrorState value)? error,
    TResult? Function(_FoundBranchState value)? foundBranch,
    TResult? Function(_AddedState value)? added,
    TResult? Function(_RejectedState value)? rejected,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitialState value)? initial,
    TResult Function(_ErrorState value)? error,
    TResult Function(_FoundBranchState value)? foundBranch,
    TResult Function(_AddedState value)? added,
    TResult Function(_RejectedState value)? rejected,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _ErrorState implements BranchRegistrationState {
  const factory _ErrorState(
      {required final CustomError error,
      required final BranchQrData? branchData}) = _$_ErrorState;

  CustomError get error;
  BranchQrData? get branchData;
  @JsonKey(ignore: true)
  _$$_ErrorStateCopyWith<_$_ErrorState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_FoundBranchStateCopyWith<$Res> {
  factory _$$_FoundBranchStateCopyWith(
          _$_FoundBranchState value, $Res Function(_$_FoundBranchState) then) =
      __$$_FoundBranchStateCopyWithImpl<$Res>;
  @useResult
  $Res call({BranchQrData? branchData, AppDocuments? documents});

  $BranchQrDataCopyWith<$Res>? get branchData;
  $AppDocumentsCopyWith<$Res>? get documents;
}

/// @nodoc
class __$$_FoundBranchStateCopyWithImpl<$Res>
    extends _$BranchRegistrationStateCopyWithImpl<$Res, _$_FoundBranchState>
    implements _$$_FoundBranchStateCopyWith<$Res> {
  __$$_FoundBranchStateCopyWithImpl(
      _$_FoundBranchState _value, $Res Function(_$_FoundBranchState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? branchData = freezed,
    Object? documents = freezed,
  }) {
    return _then(_$_FoundBranchState(
      branchData: freezed == branchData
          ? _value.branchData
          : branchData // ignore: cast_nullable_to_non_nullable
              as BranchQrData?,
      documents: freezed == documents
          ? _value.documents
          : documents // ignore: cast_nullable_to_non_nullable
              as AppDocuments?,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $BranchQrDataCopyWith<$Res>? get branchData {
    if (_value.branchData == null) {
      return null;
    }

    return $BranchQrDataCopyWith<$Res>(_value.branchData!, (value) {
      return _then(_value.copyWith(branchData: value));
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $AppDocumentsCopyWith<$Res>? get documents {
    if (_value.documents == null) {
      return null;
    }

    return $AppDocumentsCopyWith<$Res>(_value.documents!, (value) {
      return _then(_value.copyWith(documents: value));
    });
  }
}

/// @nodoc

class _$_FoundBranchState implements _FoundBranchState {
  const _$_FoundBranchState(
      {required this.branchData, required this.documents});

  @override
  final BranchQrData? branchData;
  @override
  final AppDocuments? documents;

  @override
  String toString() {
    return 'BranchRegistrationState.foundBranch(branchData: $branchData, documents: $documents)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FoundBranchState &&
            (identical(other.branchData, branchData) ||
                other.branchData == branchData) &&
            (identical(other.documents, documents) ||
                other.documents == documents));
  }

  @override
  int get hashCode => Object.hash(runtimeType, branchData, documents);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FoundBranchStateCopyWith<_$_FoundBranchState> get copyWith =>
      __$$_FoundBranchStateCopyWithImpl<_$_FoundBranchState>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(CustomError error, BranchQrData? branchData)
        error,
    required TResult Function(BranchQrData? branchData, AppDocuments? documents)
        foundBranch,
    required TResult Function(
            BranchQrData branchData, RequiredFields requiredFields)
        added,
    required TResult Function() rejected,
  }) {
    return foundBranch(branchData, documents);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(CustomError error, BranchQrData? branchData)? error,
    TResult? Function(BranchQrData? branchData, AppDocuments? documents)?
        foundBranch,
    TResult? Function(BranchQrData branchData, RequiredFields requiredFields)?
        added,
    TResult? Function()? rejected,
  }) {
    return foundBranch?.call(branchData, documents);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(CustomError error, BranchQrData? branchData)? error,
    TResult Function(BranchQrData? branchData, AppDocuments? documents)?
        foundBranch,
    TResult Function(BranchQrData branchData, RequiredFields requiredFields)?
        added,
    TResult Function()? rejected,
    required TResult orElse(),
  }) {
    if (foundBranch != null) {
      return foundBranch(branchData, documents);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitialState value) initial,
    required TResult Function(_ErrorState value) error,
    required TResult Function(_FoundBranchState value) foundBranch,
    required TResult Function(_AddedState value) added,
    required TResult Function(_RejectedState value) rejected,
  }) {
    return foundBranch(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InitialState value)? initial,
    TResult? Function(_ErrorState value)? error,
    TResult? Function(_FoundBranchState value)? foundBranch,
    TResult? Function(_AddedState value)? added,
    TResult? Function(_RejectedState value)? rejected,
  }) {
    return foundBranch?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitialState value)? initial,
    TResult Function(_ErrorState value)? error,
    TResult Function(_FoundBranchState value)? foundBranch,
    TResult Function(_AddedState value)? added,
    TResult Function(_RejectedState value)? rejected,
    required TResult orElse(),
  }) {
    if (foundBranch != null) {
      return foundBranch(this);
    }
    return orElse();
  }
}

abstract class _FoundBranchState implements BranchRegistrationState {
  const factory _FoundBranchState(
      {required final BranchQrData? branchData,
      required final AppDocuments? documents}) = _$_FoundBranchState;

  BranchQrData? get branchData;
  AppDocuments? get documents;
  @JsonKey(ignore: true)
  _$$_FoundBranchStateCopyWith<_$_FoundBranchState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_AddedStateCopyWith<$Res> {
  factory _$$_AddedStateCopyWith(
          _$_AddedState value, $Res Function(_$_AddedState) then) =
      __$$_AddedStateCopyWithImpl<$Res>;
  @useResult
  $Res call({BranchQrData branchData, RequiredFields requiredFields});

  $BranchQrDataCopyWith<$Res> get branchData;
  $RequiredFieldsCopyWith<$Res> get requiredFields;
}

/// @nodoc
class __$$_AddedStateCopyWithImpl<$Res>
    extends _$BranchRegistrationStateCopyWithImpl<$Res, _$_AddedState>
    implements _$$_AddedStateCopyWith<$Res> {
  __$$_AddedStateCopyWithImpl(
      _$_AddedState _value, $Res Function(_$_AddedState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? branchData = null,
    Object? requiredFields = null,
  }) {
    return _then(_$_AddedState(
      branchData: null == branchData
          ? _value.branchData
          : branchData // ignore: cast_nullable_to_non_nullable
              as BranchQrData,
      requiredFields: null == requiredFields
          ? _value.requiredFields
          : requiredFields // ignore: cast_nullable_to_non_nullable
              as RequiredFields,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $BranchQrDataCopyWith<$Res> get branchData {
    return $BranchQrDataCopyWith<$Res>(_value.branchData, (value) {
      return _then(_value.copyWith(branchData: value));
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $RequiredFieldsCopyWith<$Res> get requiredFields {
    return $RequiredFieldsCopyWith<$Res>(_value.requiredFields, (value) {
      return _then(_value.copyWith(requiredFields: value));
    });
  }
}

/// @nodoc

class _$_AddedState implements _AddedState {
  const _$_AddedState({required this.branchData, required this.requiredFields});

  @override
  final BranchQrData branchData;
  @override
  final RequiredFields requiredFields;

  @override
  String toString() {
    return 'BranchRegistrationState.added(branchData: $branchData, requiredFields: $requiredFields)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AddedState &&
            (identical(other.branchData, branchData) ||
                other.branchData == branchData) &&
            (identical(other.requiredFields, requiredFields) ||
                other.requiredFields == requiredFields));
  }

  @override
  int get hashCode => Object.hash(runtimeType, branchData, requiredFields);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AddedStateCopyWith<_$_AddedState> get copyWith =>
      __$$_AddedStateCopyWithImpl<_$_AddedState>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(CustomError error, BranchQrData? branchData)
        error,
    required TResult Function(BranchQrData? branchData, AppDocuments? documents)
        foundBranch,
    required TResult Function(
            BranchQrData branchData, RequiredFields requiredFields)
        added,
    required TResult Function() rejected,
  }) {
    return added(branchData, requiredFields);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(CustomError error, BranchQrData? branchData)? error,
    TResult? Function(BranchQrData? branchData, AppDocuments? documents)?
        foundBranch,
    TResult? Function(BranchQrData branchData, RequiredFields requiredFields)?
        added,
    TResult? Function()? rejected,
  }) {
    return added?.call(branchData, requiredFields);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(CustomError error, BranchQrData? branchData)? error,
    TResult Function(BranchQrData? branchData, AppDocuments? documents)?
        foundBranch,
    TResult Function(BranchQrData branchData, RequiredFields requiredFields)?
        added,
    TResult Function()? rejected,
    required TResult orElse(),
  }) {
    if (added != null) {
      return added(branchData, requiredFields);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitialState value) initial,
    required TResult Function(_ErrorState value) error,
    required TResult Function(_FoundBranchState value) foundBranch,
    required TResult Function(_AddedState value) added,
    required TResult Function(_RejectedState value) rejected,
  }) {
    return added(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InitialState value)? initial,
    TResult? Function(_ErrorState value)? error,
    TResult? Function(_FoundBranchState value)? foundBranch,
    TResult? Function(_AddedState value)? added,
    TResult? Function(_RejectedState value)? rejected,
  }) {
    return added?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitialState value)? initial,
    TResult Function(_ErrorState value)? error,
    TResult Function(_FoundBranchState value)? foundBranch,
    TResult Function(_AddedState value)? added,
    TResult Function(_RejectedState value)? rejected,
    required TResult orElse(),
  }) {
    if (added != null) {
      return added(this);
    }
    return orElse();
  }
}

abstract class _AddedState implements BranchRegistrationState {
  const factory _AddedState(
      {required final BranchQrData branchData,
      required final RequiredFields requiredFields}) = _$_AddedState;

  BranchQrData get branchData;
  RequiredFields get requiredFields;
  @JsonKey(ignore: true)
  _$$_AddedStateCopyWith<_$_AddedState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_RejectedStateCopyWith<$Res> {
  factory _$$_RejectedStateCopyWith(
          _$_RejectedState value, $Res Function(_$_RejectedState) then) =
      __$$_RejectedStateCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_RejectedStateCopyWithImpl<$Res>
    extends _$BranchRegistrationStateCopyWithImpl<$Res, _$_RejectedState>
    implements _$$_RejectedStateCopyWith<$Res> {
  __$$_RejectedStateCopyWithImpl(
      _$_RejectedState _value, $Res Function(_$_RejectedState) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_RejectedState implements _RejectedState {
  const _$_RejectedState();

  @override
  String toString() {
    return 'BranchRegistrationState.rejected()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_RejectedState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(CustomError error, BranchQrData? branchData)
        error,
    required TResult Function(BranchQrData? branchData, AppDocuments? documents)
        foundBranch,
    required TResult Function(
            BranchQrData branchData, RequiredFields requiredFields)
        added,
    required TResult Function() rejected,
  }) {
    return rejected();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(CustomError error, BranchQrData? branchData)? error,
    TResult? Function(BranchQrData? branchData, AppDocuments? documents)?
        foundBranch,
    TResult? Function(BranchQrData branchData, RequiredFields requiredFields)?
        added,
    TResult? Function()? rejected,
  }) {
    return rejected?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(CustomError error, BranchQrData? branchData)? error,
    TResult Function(BranchQrData? branchData, AppDocuments? documents)?
        foundBranch,
    TResult Function(BranchQrData branchData, RequiredFields requiredFields)?
        added,
    TResult Function()? rejected,
    required TResult orElse(),
  }) {
    if (rejected != null) {
      return rejected();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitialState value) initial,
    required TResult Function(_ErrorState value) error,
    required TResult Function(_FoundBranchState value) foundBranch,
    required TResult Function(_AddedState value) added,
    required TResult Function(_RejectedState value) rejected,
  }) {
    return rejected(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InitialState value)? initial,
    TResult? Function(_ErrorState value)? error,
    TResult? Function(_FoundBranchState value)? foundBranch,
    TResult? Function(_AddedState value)? added,
    TResult? Function(_RejectedState value)? rejected,
  }) {
    return rejected?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitialState value)? initial,
    TResult Function(_ErrorState value)? error,
    TResult Function(_FoundBranchState value)? foundBranch,
    TResult Function(_AddedState value)? added,
    TResult Function(_RejectedState value)? rejected,
    required TResult orElse(),
  }) {
    if (rejected != null) {
      return rejected(this);
    }
    return orElse();
  }
}

abstract class _RejectedState implements BranchRegistrationState {
  const factory _RejectedState() = _$_RejectedState;
}

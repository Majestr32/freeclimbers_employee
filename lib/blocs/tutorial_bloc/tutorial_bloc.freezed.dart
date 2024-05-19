// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tutorial_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$TutorialEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() endHomeTutorial,
    required TResult Function() endMenuTutorial,
    required TResult Function() fetchTutorialState,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? endHomeTutorial,
    TResult? Function()? endMenuTutorial,
    TResult? Function()? fetchTutorialState,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? endHomeTutorial,
    TResult Function()? endMenuTutorial,
    TResult Function()? fetchTutorialState,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_EndHomeTutorialEvent value) endHomeTutorial,
    required TResult Function(_EndMenuTutorialEvent value) endMenuTutorial,
    required TResult Function(_FetchTutorialStateEvent value)
        fetchTutorialState,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_EndHomeTutorialEvent value)? endHomeTutorial,
    TResult? Function(_EndMenuTutorialEvent value)? endMenuTutorial,
    TResult? Function(_FetchTutorialStateEvent value)? fetchTutorialState,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_EndHomeTutorialEvent value)? endHomeTutorial,
    TResult Function(_EndMenuTutorialEvent value)? endMenuTutorial,
    TResult Function(_FetchTutorialStateEvent value)? fetchTutorialState,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TutorialEventCopyWith<$Res> {
  factory $TutorialEventCopyWith(
          TutorialEvent value, $Res Function(TutorialEvent) then) =
      _$TutorialEventCopyWithImpl<$Res, TutorialEvent>;
}

/// @nodoc
class _$TutorialEventCopyWithImpl<$Res, $Val extends TutorialEvent>
    implements $TutorialEventCopyWith<$Res> {
  _$TutorialEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_EndHomeTutorialEventCopyWith<$Res> {
  factory _$$_EndHomeTutorialEventCopyWith(_$_EndHomeTutorialEvent value,
          $Res Function(_$_EndHomeTutorialEvent) then) =
      __$$_EndHomeTutorialEventCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_EndHomeTutorialEventCopyWithImpl<$Res>
    extends _$TutorialEventCopyWithImpl<$Res, _$_EndHomeTutorialEvent>
    implements _$$_EndHomeTutorialEventCopyWith<$Res> {
  __$$_EndHomeTutorialEventCopyWithImpl(_$_EndHomeTutorialEvent _value,
      $Res Function(_$_EndHomeTutorialEvent) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_EndHomeTutorialEvent implements _EndHomeTutorialEvent {
  const _$_EndHomeTutorialEvent();

  @override
  String toString() {
    return 'TutorialEvent.endHomeTutorial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_EndHomeTutorialEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() endHomeTutorial,
    required TResult Function() endMenuTutorial,
    required TResult Function() fetchTutorialState,
  }) {
    return endHomeTutorial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? endHomeTutorial,
    TResult? Function()? endMenuTutorial,
    TResult? Function()? fetchTutorialState,
  }) {
    return endHomeTutorial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? endHomeTutorial,
    TResult Function()? endMenuTutorial,
    TResult Function()? fetchTutorialState,
    required TResult orElse(),
  }) {
    if (endHomeTutorial != null) {
      return endHomeTutorial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_EndHomeTutorialEvent value) endHomeTutorial,
    required TResult Function(_EndMenuTutorialEvent value) endMenuTutorial,
    required TResult Function(_FetchTutorialStateEvent value)
        fetchTutorialState,
  }) {
    return endHomeTutorial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_EndHomeTutorialEvent value)? endHomeTutorial,
    TResult? Function(_EndMenuTutorialEvent value)? endMenuTutorial,
    TResult? Function(_FetchTutorialStateEvent value)? fetchTutorialState,
  }) {
    return endHomeTutorial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_EndHomeTutorialEvent value)? endHomeTutorial,
    TResult Function(_EndMenuTutorialEvent value)? endMenuTutorial,
    TResult Function(_FetchTutorialStateEvent value)? fetchTutorialState,
    required TResult orElse(),
  }) {
    if (endHomeTutorial != null) {
      return endHomeTutorial(this);
    }
    return orElse();
  }
}

abstract class _EndHomeTutorialEvent implements TutorialEvent {
  const factory _EndHomeTutorialEvent() = _$_EndHomeTutorialEvent;
}

/// @nodoc
abstract class _$$_EndMenuTutorialEventCopyWith<$Res> {
  factory _$$_EndMenuTutorialEventCopyWith(_$_EndMenuTutorialEvent value,
          $Res Function(_$_EndMenuTutorialEvent) then) =
      __$$_EndMenuTutorialEventCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_EndMenuTutorialEventCopyWithImpl<$Res>
    extends _$TutorialEventCopyWithImpl<$Res, _$_EndMenuTutorialEvent>
    implements _$$_EndMenuTutorialEventCopyWith<$Res> {
  __$$_EndMenuTutorialEventCopyWithImpl(_$_EndMenuTutorialEvent _value,
      $Res Function(_$_EndMenuTutorialEvent) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_EndMenuTutorialEvent implements _EndMenuTutorialEvent {
  const _$_EndMenuTutorialEvent();

  @override
  String toString() {
    return 'TutorialEvent.endMenuTutorial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_EndMenuTutorialEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() endHomeTutorial,
    required TResult Function() endMenuTutorial,
    required TResult Function() fetchTutorialState,
  }) {
    return endMenuTutorial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? endHomeTutorial,
    TResult? Function()? endMenuTutorial,
    TResult? Function()? fetchTutorialState,
  }) {
    return endMenuTutorial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? endHomeTutorial,
    TResult Function()? endMenuTutorial,
    TResult Function()? fetchTutorialState,
    required TResult orElse(),
  }) {
    if (endMenuTutorial != null) {
      return endMenuTutorial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_EndHomeTutorialEvent value) endHomeTutorial,
    required TResult Function(_EndMenuTutorialEvent value) endMenuTutorial,
    required TResult Function(_FetchTutorialStateEvent value)
        fetchTutorialState,
  }) {
    return endMenuTutorial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_EndHomeTutorialEvent value)? endHomeTutorial,
    TResult? Function(_EndMenuTutorialEvent value)? endMenuTutorial,
    TResult? Function(_FetchTutorialStateEvent value)? fetchTutorialState,
  }) {
    return endMenuTutorial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_EndHomeTutorialEvent value)? endHomeTutorial,
    TResult Function(_EndMenuTutorialEvent value)? endMenuTutorial,
    TResult Function(_FetchTutorialStateEvent value)? fetchTutorialState,
    required TResult orElse(),
  }) {
    if (endMenuTutorial != null) {
      return endMenuTutorial(this);
    }
    return orElse();
  }
}

abstract class _EndMenuTutorialEvent implements TutorialEvent {
  const factory _EndMenuTutorialEvent() = _$_EndMenuTutorialEvent;
}

/// @nodoc
abstract class _$$_FetchTutorialStateEventCopyWith<$Res> {
  factory _$$_FetchTutorialStateEventCopyWith(_$_FetchTutorialStateEvent value,
          $Res Function(_$_FetchTutorialStateEvent) then) =
      __$$_FetchTutorialStateEventCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_FetchTutorialStateEventCopyWithImpl<$Res>
    extends _$TutorialEventCopyWithImpl<$Res, _$_FetchTutorialStateEvent>
    implements _$$_FetchTutorialStateEventCopyWith<$Res> {
  __$$_FetchTutorialStateEventCopyWithImpl(_$_FetchTutorialStateEvent _value,
      $Res Function(_$_FetchTutorialStateEvent) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_FetchTutorialStateEvent implements _FetchTutorialStateEvent {
  const _$_FetchTutorialStateEvent();

  @override
  String toString() {
    return 'TutorialEvent.fetchTutorialState()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FetchTutorialStateEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() endHomeTutorial,
    required TResult Function() endMenuTutorial,
    required TResult Function() fetchTutorialState,
  }) {
    return fetchTutorialState();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? endHomeTutorial,
    TResult? Function()? endMenuTutorial,
    TResult? Function()? fetchTutorialState,
  }) {
    return fetchTutorialState?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? endHomeTutorial,
    TResult Function()? endMenuTutorial,
    TResult Function()? fetchTutorialState,
    required TResult orElse(),
  }) {
    if (fetchTutorialState != null) {
      return fetchTutorialState();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_EndHomeTutorialEvent value) endHomeTutorial,
    required TResult Function(_EndMenuTutorialEvent value) endMenuTutorial,
    required TResult Function(_FetchTutorialStateEvent value)
        fetchTutorialState,
  }) {
    return fetchTutorialState(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_EndHomeTutorialEvent value)? endHomeTutorial,
    TResult? Function(_EndMenuTutorialEvent value)? endMenuTutorial,
    TResult? Function(_FetchTutorialStateEvent value)? fetchTutorialState,
  }) {
    return fetchTutorialState?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_EndHomeTutorialEvent value)? endHomeTutorial,
    TResult Function(_EndMenuTutorialEvent value)? endMenuTutorial,
    TResult Function(_FetchTutorialStateEvent value)? fetchTutorialState,
    required TResult orElse(),
  }) {
    if (fetchTutorialState != null) {
      return fetchTutorialState(this);
    }
    return orElse();
  }
}

abstract class _FetchTutorialStateEvent implements TutorialEvent {
  const factory _FetchTutorialStateEvent() = _$_FetchTutorialStateEvent;
}

/// @nodoc
mixin _$TutorialState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(
            bool isHomeTutorialEnded, bool isMenuTutorialEnded)
        initialized,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(bool isHomeTutorialEnded, bool isMenuTutorialEnded)?
        initialized,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(bool isHomeTutorialEnded, bool isMenuTutorialEnded)?
        initialized,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitialState value) initial,
    required TResult Function(_InitializedState value) initialized,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InitialState value)? initial,
    TResult? Function(_InitializedState value)? initialized,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitialState value)? initial,
    TResult Function(_InitializedState value)? initialized,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TutorialStateCopyWith<$Res> {
  factory $TutorialStateCopyWith(
          TutorialState value, $Res Function(TutorialState) then) =
      _$TutorialStateCopyWithImpl<$Res, TutorialState>;
}

/// @nodoc
class _$TutorialStateCopyWithImpl<$Res, $Val extends TutorialState>
    implements $TutorialStateCopyWith<$Res> {
  _$TutorialStateCopyWithImpl(this._value, this._then);

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
    extends _$TutorialStateCopyWithImpl<$Res, _$_InitialState>
    implements _$$_InitialStateCopyWith<$Res> {
  __$$_InitialStateCopyWithImpl(
      _$_InitialState _value, $Res Function(_$_InitialState) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_InitialState extends _InitialState {
  const _$_InitialState() : super._();

  @override
  String toString() {
    return 'TutorialState.initial()';
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
    required TResult Function(
            bool isHomeTutorialEnded, bool isMenuTutorialEnded)
        initialized,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(bool isHomeTutorialEnded, bool isMenuTutorialEnded)?
        initialized,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(bool isHomeTutorialEnded, bool isMenuTutorialEnded)?
        initialized,
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
    required TResult Function(_InitializedState value) initialized,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InitialState value)? initial,
    TResult? Function(_InitializedState value)? initialized,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitialState value)? initial,
    TResult Function(_InitializedState value)? initialized,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _InitialState extends TutorialState {
  const factory _InitialState() = _$_InitialState;
  const _InitialState._() : super._();
}

/// @nodoc
abstract class _$$_InitializedStateCopyWith<$Res> {
  factory _$$_InitializedStateCopyWith(
          _$_InitializedState value, $Res Function(_$_InitializedState) then) =
      __$$_InitializedStateCopyWithImpl<$Res>;
  @useResult
  $Res call({bool isHomeTutorialEnded, bool isMenuTutorialEnded});
}

/// @nodoc
class __$$_InitializedStateCopyWithImpl<$Res>
    extends _$TutorialStateCopyWithImpl<$Res, _$_InitializedState>
    implements _$$_InitializedStateCopyWith<$Res> {
  __$$_InitializedStateCopyWithImpl(
      _$_InitializedState _value, $Res Function(_$_InitializedState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isHomeTutorialEnded = null,
    Object? isMenuTutorialEnded = null,
  }) {
    return _then(_$_InitializedState(
      isHomeTutorialEnded: null == isHomeTutorialEnded
          ? _value.isHomeTutorialEnded
          : isHomeTutorialEnded // ignore: cast_nullable_to_non_nullable
              as bool,
      isMenuTutorialEnded: null == isMenuTutorialEnded
          ? _value.isMenuTutorialEnded
          : isMenuTutorialEnded // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_InitializedState extends _InitializedState {
  const _$_InitializedState(
      {required this.isHomeTutorialEnded, required this.isMenuTutorialEnded})
      : super._();

  @override
  final bool isHomeTutorialEnded;
  @override
  final bool isMenuTutorialEnded;

  @override
  String toString() {
    return 'TutorialState.initialized(isHomeTutorialEnded: $isHomeTutorialEnded, isMenuTutorialEnded: $isMenuTutorialEnded)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_InitializedState &&
            (identical(other.isHomeTutorialEnded, isHomeTutorialEnded) ||
                other.isHomeTutorialEnded == isHomeTutorialEnded) &&
            (identical(other.isMenuTutorialEnded, isMenuTutorialEnded) ||
                other.isMenuTutorialEnded == isMenuTutorialEnded));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, isHomeTutorialEnded, isMenuTutorialEnded);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_InitializedStateCopyWith<_$_InitializedState> get copyWith =>
      __$$_InitializedStateCopyWithImpl<_$_InitializedState>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(
            bool isHomeTutorialEnded, bool isMenuTutorialEnded)
        initialized,
  }) {
    return initialized(isHomeTutorialEnded, isMenuTutorialEnded);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(bool isHomeTutorialEnded, bool isMenuTutorialEnded)?
        initialized,
  }) {
    return initialized?.call(isHomeTutorialEnded, isMenuTutorialEnded);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(bool isHomeTutorialEnded, bool isMenuTutorialEnded)?
        initialized,
    required TResult orElse(),
  }) {
    if (initialized != null) {
      return initialized(isHomeTutorialEnded, isMenuTutorialEnded);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitialState value) initial,
    required TResult Function(_InitializedState value) initialized,
  }) {
    return initialized(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InitialState value)? initial,
    TResult? Function(_InitializedState value)? initialized,
  }) {
    return initialized?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitialState value)? initial,
    TResult Function(_InitializedState value)? initialized,
    required TResult orElse(),
  }) {
    if (initialized != null) {
      return initialized(this);
    }
    return orElse();
  }
}

abstract class _InitializedState extends TutorialState {
  const factory _InitializedState(
      {required final bool isHomeTutorialEnded,
      required final bool isMenuTutorialEnded}) = _$_InitializedState;
  const _InitializedState._() : super._();

  bool get isHomeTutorialEnded;
  bool get isMenuTutorialEnded;
  @JsonKey(ignore: true)
  _$$_InitializedStateCopyWith<_$_InitializedState> get copyWith =>
      throw _privateConstructorUsedError;
}

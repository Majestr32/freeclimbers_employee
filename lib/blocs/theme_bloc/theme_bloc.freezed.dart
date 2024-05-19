// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'theme_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ThemeEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchTheme,
    required TResult Function() toggleTheme,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetchTheme,
    TResult? Function()? toggleTheme,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchTheme,
    TResult Function()? toggleTheme,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchThemeEvent value) fetchTheme,
    required TResult Function(_ToggleThemeEvent value) toggleTheme,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FetchThemeEvent value)? fetchTheme,
    TResult? Function(_ToggleThemeEvent value)? toggleTheme,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchThemeEvent value)? fetchTheme,
    TResult Function(_ToggleThemeEvent value)? toggleTheme,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ThemeEventCopyWith<$Res> {
  factory $ThemeEventCopyWith(
          ThemeEvent value, $Res Function(ThemeEvent) then) =
      _$ThemeEventCopyWithImpl<$Res, ThemeEvent>;
}

/// @nodoc
class _$ThemeEventCopyWithImpl<$Res, $Val extends ThemeEvent>
    implements $ThemeEventCopyWith<$Res> {
  _$ThemeEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_FetchThemeEventCopyWith<$Res> {
  factory _$$_FetchThemeEventCopyWith(
          _$_FetchThemeEvent value, $Res Function(_$_FetchThemeEvent) then) =
      __$$_FetchThemeEventCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_FetchThemeEventCopyWithImpl<$Res>
    extends _$ThemeEventCopyWithImpl<$Res, _$_FetchThemeEvent>
    implements _$$_FetchThemeEventCopyWith<$Res> {
  __$$_FetchThemeEventCopyWithImpl(
      _$_FetchThemeEvent _value, $Res Function(_$_FetchThemeEvent) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_FetchThemeEvent implements _FetchThemeEvent {
  const _$_FetchThemeEvent();

  @override
  String toString() {
    return 'ThemeEvent.fetchTheme()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_FetchThemeEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchTheme,
    required TResult Function() toggleTheme,
  }) {
    return fetchTheme();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetchTheme,
    TResult? Function()? toggleTheme,
  }) {
    return fetchTheme?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchTheme,
    TResult Function()? toggleTheme,
    required TResult orElse(),
  }) {
    if (fetchTheme != null) {
      return fetchTheme();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchThemeEvent value) fetchTheme,
    required TResult Function(_ToggleThemeEvent value) toggleTheme,
  }) {
    return fetchTheme(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FetchThemeEvent value)? fetchTheme,
    TResult? Function(_ToggleThemeEvent value)? toggleTheme,
  }) {
    return fetchTheme?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchThemeEvent value)? fetchTheme,
    TResult Function(_ToggleThemeEvent value)? toggleTheme,
    required TResult orElse(),
  }) {
    if (fetchTheme != null) {
      return fetchTheme(this);
    }
    return orElse();
  }
}

abstract class _FetchThemeEvent implements ThemeEvent {
  const factory _FetchThemeEvent() = _$_FetchThemeEvent;
}

/// @nodoc
abstract class _$$_ToggleThemeEventCopyWith<$Res> {
  factory _$$_ToggleThemeEventCopyWith(
          _$_ToggleThemeEvent value, $Res Function(_$_ToggleThemeEvent) then) =
      __$$_ToggleThemeEventCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_ToggleThemeEventCopyWithImpl<$Res>
    extends _$ThemeEventCopyWithImpl<$Res, _$_ToggleThemeEvent>
    implements _$$_ToggleThemeEventCopyWith<$Res> {
  __$$_ToggleThemeEventCopyWithImpl(
      _$_ToggleThemeEvent _value, $Res Function(_$_ToggleThemeEvent) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_ToggleThemeEvent implements _ToggleThemeEvent {
  const _$_ToggleThemeEvent();

  @override
  String toString() {
    return 'ThemeEvent.toggleTheme()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_ToggleThemeEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchTheme,
    required TResult Function() toggleTheme,
  }) {
    return toggleTheme();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetchTheme,
    TResult? Function()? toggleTheme,
  }) {
    return toggleTheme?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchTheme,
    TResult Function()? toggleTheme,
    required TResult orElse(),
  }) {
    if (toggleTheme != null) {
      return toggleTheme();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchThemeEvent value) fetchTheme,
    required TResult Function(_ToggleThemeEvent value) toggleTheme,
  }) {
    return toggleTheme(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FetchThemeEvent value)? fetchTheme,
    TResult? Function(_ToggleThemeEvent value)? toggleTheme,
  }) {
    return toggleTheme?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchThemeEvent value)? fetchTheme,
    TResult Function(_ToggleThemeEvent value)? toggleTheme,
    required TResult orElse(),
  }) {
    if (toggleTheme != null) {
      return toggleTheme(this);
    }
    return orElse();
  }
}

abstract class _ToggleThemeEvent implements ThemeEvent {
  const factory _ToggleThemeEvent() = _$_ToggleThemeEvent;
}

/// @nodoc
mixin _$ThemeState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(bool isNightTheme) initialized,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(bool isNightTheme)? initialized,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(bool isNightTheme)? initialized,
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
abstract class $ThemeStateCopyWith<$Res> {
  factory $ThemeStateCopyWith(
          ThemeState value, $Res Function(ThemeState) then) =
      _$ThemeStateCopyWithImpl<$Res, ThemeState>;
}

/// @nodoc
class _$ThemeStateCopyWithImpl<$Res, $Val extends ThemeState>
    implements $ThemeStateCopyWith<$Res> {
  _$ThemeStateCopyWithImpl(this._value, this._then);

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
    extends _$ThemeStateCopyWithImpl<$Res, _$_InitialState>
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
    return 'ThemeState.initial()';
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
    required TResult Function(bool isNightTheme) initialized,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(bool isNightTheme)? initialized,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(bool isNightTheme)? initialized,
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

abstract class _InitialState extends ThemeState {
  const factory _InitialState() = _$_InitialState;
  const _InitialState._() : super._();
}

/// @nodoc
abstract class _$$_InitializedStateCopyWith<$Res> {
  factory _$$_InitializedStateCopyWith(
          _$_InitializedState value, $Res Function(_$_InitializedState) then) =
      __$$_InitializedStateCopyWithImpl<$Res>;
  @useResult
  $Res call({bool isNightTheme});
}

/// @nodoc
class __$$_InitializedStateCopyWithImpl<$Res>
    extends _$ThemeStateCopyWithImpl<$Res, _$_InitializedState>
    implements _$$_InitializedStateCopyWith<$Res> {
  __$$_InitializedStateCopyWithImpl(
      _$_InitializedState _value, $Res Function(_$_InitializedState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isNightTheme = null,
  }) {
    return _then(_$_InitializedState(
      isNightTheme: null == isNightTheme
          ? _value.isNightTheme
          : isNightTheme // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_InitializedState extends _InitializedState {
  const _$_InitializedState({required this.isNightTheme}) : super._();

  @override
  final bool isNightTheme;

  @override
  String toString() {
    return 'ThemeState.initialized(isNightTheme: $isNightTheme)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_InitializedState &&
            (identical(other.isNightTheme, isNightTheme) ||
                other.isNightTheme == isNightTheme));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isNightTheme);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_InitializedStateCopyWith<_$_InitializedState> get copyWith =>
      __$$_InitializedStateCopyWithImpl<_$_InitializedState>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(bool isNightTheme) initialized,
  }) {
    return initialized(isNightTheme);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(bool isNightTheme)? initialized,
  }) {
    return initialized?.call(isNightTheme);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(bool isNightTheme)? initialized,
    required TResult orElse(),
  }) {
    if (initialized != null) {
      return initialized(isNightTheme);
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

abstract class _InitializedState extends ThemeState {
  const factory _InitializedState({required final bool isNightTheme}) =
      _$_InitializedState;
  const _InitializedState._() : super._();

  bool get isNightTheme;
  @JsonKey(ignore: true)
  _$$_InitializedStateCopyWith<_$_InitializedState> get copyWith =>
      throw _privateConstructorUsedError;
}

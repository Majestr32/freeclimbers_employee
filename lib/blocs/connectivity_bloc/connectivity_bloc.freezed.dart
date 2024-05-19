// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'connectivity_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ConnectivityEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() showTimeout,
    required TResult Function() connect,
    required TResult Function() disconnect,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? showTimeout,
    TResult? Function()? connect,
    TResult? Function()? disconnect,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? showTimeout,
    TResult Function()? connect,
    TResult Function()? disconnect,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ShowTimeoutEvent value) showTimeout,
    required TResult Function(_ConnectEvent value) connect,
    required TResult Function(_DisconnectEvent value) disconnect,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ShowTimeoutEvent value)? showTimeout,
    TResult? Function(_ConnectEvent value)? connect,
    TResult? Function(_DisconnectEvent value)? disconnect,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ShowTimeoutEvent value)? showTimeout,
    TResult Function(_ConnectEvent value)? connect,
    TResult Function(_DisconnectEvent value)? disconnect,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConnectivityEventCopyWith<$Res> {
  factory $ConnectivityEventCopyWith(
          ConnectivityEvent value, $Res Function(ConnectivityEvent) then) =
      _$ConnectivityEventCopyWithImpl<$Res, ConnectivityEvent>;
}

/// @nodoc
class _$ConnectivityEventCopyWithImpl<$Res, $Val extends ConnectivityEvent>
    implements $ConnectivityEventCopyWith<$Res> {
  _$ConnectivityEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_ShowTimeoutEventCopyWith<$Res> {
  factory _$$_ShowTimeoutEventCopyWith(
          _$_ShowTimeoutEvent value, $Res Function(_$_ShowTimeoutEvent) then) =
      __$$_ShowTimeoutEventCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_ShowTimeoutEventCopyWithImpl<$Res>
    extends _$ConnectivityEventCopyWithImpl<$Res, _$_ShowTimeoutEvent>
    implements _$$_ShowTimeoutEventCopyWith<$Res> {
  __$$_ShowTimeoutEventCopyWithImpl(
      _$_ShowTimeoutEvent _value, $Res Function(_$_ShowTimeoutEvent) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_ShowTimeoutEvent implements _ShowTimeoutEvent {
  const _$_ShowTimeoutEvent();

  @override
  String toString() {
    return 'ConnectivityEvent.showTimeout()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_ShowTimeoutEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() showTimeout,
    required TResult Function() connect,
    required TResult Function() disconnect,
  }) {
    return showTimeout();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? showTimeout,
    TResult? Function()? connect,
    TResult? Function()? disconnect,
  }) {
    return showTimeout?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? showTimeout,
    TResult Function()? connect,
    TResult Function()? disconnect,
    required TResult orElse(),
  }) {
    if (showTimeout != null) {
      return showTimeout();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ShowTimeoutEvent value) showTimeout,
    required TResult Function(_ConnectEvent value) connect,
    required TResult Function(_DisconnectEvent value) disconnect,
  }) {
    return showTimeout(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ShowTimeoutEvent value)? showTimeout,
    TResult? Function(_ConnectEvent value)? connect,
    TResult? Function(_DisconnectEvent value)? disconnect,
  }) {
    return showTimeout?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ShowTimeoutEvent value)? showTimeout,
    TResult Function(_ConnectEvent value)? connect,
    TResult Function(_DisconnectEvent value)? disconnect,
    required TResult orElse(),
  }) {
    if (showTimeout != null) {
      return showTimeout(this);
    }
    return orElse();
  }
}

abstract class _ShowTimeoutEvent implements ConnectivityEvent {
  const factory _ShowTimeoutEvent() = _$_ShowTimeoutEvent;
}

/// @nodoc
abstract class _$$_ConnectEventCopyWith<$Res> {
  factory _$$_ConnectEventCopyWith(
          _$_ConnectEvent value, $Res Function(_$_ConnectEvent) then) =
      __$$_ConnectEventCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_ConnectEventCopyWithImpl<$Res>
    extends _$ConnectivityEventCopyWithImpl<$Res, _$_ConnectEvent>
    implements _$$_ConnectEventCopyWith<$Res> {
  __$$_ConnectEventCopyWithImpl(
      _$_ConnectEvent _value, $Res Function(_$_ConnectEvent) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_ConnectEvent implements _ConnectEvent {
  const _$_ConnectEvent();

  @override
  String toString() {
    return 'ConnectivityEvent.connect()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_ConnectEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() showTimeout,
    required TResult Function() connect,
    required TResult Function() disconnect,
  }) {
    return connect();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? showTimeout,
    TResult? Function()? connect,
    TResult? Function()? disconnect,
  }) {
    return connect?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? showTimeout,
    TResult Function()? connect,
    TResult Function()? disconnect,
    required TResult orElse(),
  }) {
    if (connect != null) {
      return connect();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ShowTimeoutEvent value) showTimeout,
    required TResult Function(_ConnectEvent value) connect,
    required TResult Function(_DisconnectEvent value) disconnect,
  }) {
    return connect(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ShowTimeoutEvent value)? showTimeout,
    TResult? Function(_ConnectEvent value)? connect,
    TResult? Function(_DisconnectEvent value)? disconnect,
  }) {
    return connect?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ShowTimeoutEvent value)? showTimeout,
    TResult Function(_ConnectEvent value)? connect,
    TResult Function(_DisconnectEvent value)? disconnect,
    required TResult orElse(),
  }) {
    if (connect != null) {
      return connect(this);
    }
    return orElse();
  }
}

abstract class _ConnectEvent implements ConnectivityEvent {
  const factory _ConnectEvent() = _$_ConnectEvent;
}

/// @nodoc
abstract class _$$_DisconnectEventCopyWith<$Res> {
  factory _$$_DisconnectEventCopyWith(
          _$_DisconnectEvent value, $Res Function(_$_DisconnectEvent) then) =
      __$$_DisconnectEventCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_DisconnectEventCopyWithImpl<$Res>
    extends _$ConnectivityEventCopyWithImpl<$Res, _$_DisconnectEvent>
    implements _$$_DisconnectEventCopyWith<$Res> {
  __$$_DisconnectEventCopyWithImpl(
      _$_DisconnectEvent _value, $Res Function(_$_DisconnectEvent) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_DisconnectEvent implements _DisconnectEvent {
  const _$_DisconnectEvent();

  @override
  String toString() {
    return 'ConnectivityEvent.disconnect()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_DisconnectEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() showTimeout,
    required TResult Function() connect,
    required TResult Function() disconnect,
  }) {
    return disconnect();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? showTimeout,
    TResult? Function()? connect,
    TResult? Function()? disconnect,
  }) {
    return disconnect?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? showTimeout,
    TResult Function()? connect,
    TResult Function()? disconnect,
    required TResult orElse(),
  }) {
    if (disconnect != null) {
      return disconnect();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ShowTimeoutEvent value) showTimeout,
    required TResult Function(_ConnectEvent value) connect,
    required TResult Function(_DisconnectEvent value) disconnect,
  }) {
    return disconnect(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ShowTimeoutEvent value)? showTimeout,
    TResult? Function(_ConnectEvent value)? connect,
    TResult? Function(_DisconnectEvent value)? disconnect,
  }) {
    return disconnect?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ShowTimeoutEvent value)? showTimeout,
    TResult Function(_ConnectEvent value)? connect,
    TResult Function(_DisconnectEvent value)? disconnect,
    required TResult orElse(),
  }) {
    if (disconnect != null) {
      return disconnect(this);
    }
    return orElse();
  }
}

abstract class _DisconnectEvent implements ConnectivityEvent {
  const factory _DisconnectEvent() = _$_DisconnectEvent;
}

/// @nodoc
mixin _$ConnectivityState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() active,
    required TResult Function() lostConnectivity,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? active,
    TResult? Function()? lostConnectivity,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? active,
    TResult Function()? lostConnectivity,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitialState value) initial,
    required TResult Function(_ActiveState value) active,
    required TResult Function(_LostConnectivityState value) lostConnectivity,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InitialState value)? initial,
    TResult? Function(_ActiveState value)? active,
    TResult? Function(_LostConnectivityState value)? lostConnectivity,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitialState value)? initial,
    TResult Function(_ActiveState value)? active,
    TResult Function(_LostConnectivityState value)? lostConnectivity,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConnectivityStateCopyWith<$Res> {
  factory $ConnectivityStateCopyWith(
          ConnectivityState value, $Res Function(ConnectivityState) then) =
      _$ConnectivityStateCopyWithImpl<$Res, ConnectivityState>;
}

/// @nodoc
class _$ConnectivityStateCopyWithImpl<$Res, $Val extends ConnectivityState>
    implements $ConnectivityStateCopyWith<$Res> {
  _$ConnectivityStateCopyWithImpl(this._value, this._then);

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
    extends _$ConnectivityStateCopyWithImpl<$Res, _$_InitialState>
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
    return 'ConnectivityState.initial()';
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
    required TResult Function() active,
    required TResult Function() lostConnectivity,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? active,
    TResult? Function()? lostConnectivity,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? active,
    TResult Function()? lostConnectivity,
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
    required TResult Function(_ActiveState value) active,
    required TResult Function(_LostConnectivityState value) lostConnectivity,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InitialState value)? initial,
    TResult? Function(_ActiveState value)? active,
    TResult? Function(_LostConnectivityState value)? lostConnectivity,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitialState value)? initial,
    TResult Function(_ActiveState value)? active,
    TResult Function(_LostConnectivityState value)? lostConnectivity,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _InitialState implements ConnectivityState {
  const factory _InitialState() = _$_InitialState;
}

/// @nodoc
abstract class _$$_ActiveStateCopyWith<$Res> {
  factory _$$_ActiveStateCopyWith(
          _$_ActiveState value, $Res Function(_$_ActiveState) then) =
      __$$_ActiveStateCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_ActiveStateCopyWithImpl<$Res>
    extends _$ConnectivityStateCopyWithImpl<$Res, _$_ActiveState>
    implements _$$_ActiveStateCopyWith<$Res> {
  __$$_ActiveStateCopyWithImpl(
      _$_ActiveState _value, $Res Function(_$_ActiveState) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_ActiveState implements _ActiveState {
  const _$_ActiveState();

  @override
  String toString() {
    return 'ConnectivityState.active()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_ActiveState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() active,
    required TResult Function() lostConnectivity,
  }) {
    return active();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? active,
    TResult? Function()? lostConnectivity,
  }) {
    return active?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? active,
    TResult Function()? lostConnectivity,
    required TResult orElse(),
  }) {
    if (active != null) {
      return active();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitialState value) initial,
    required TResult Function(_ActiveState value) active,
    required TResult Function(_LostConnectivityState value) lostConnectivity,
  }) {
    return active(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InitialState value)? initial,
    TResult? Function(_ActiveState value)? active,
    TResult? Function(_LostConnectivityState value)? lostConnectivity,
  }) {
    return active?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitialState value)? initial,
    TResult Function(_ActiveState value)? active,
    TResult Function(_LostConnectivityState value)? lostConnectivity,
    required TResult orElse(),
  }) {
    if (active != null) {
      return active(this);
    }
    return orElse();
  }
}

abstract class _ActiveState implements ConnectivityState {
  const factory _ActiveState() = _$_ActiveState;
}

/// @nodoc
abstract class _$$_LostConnectivityStateCopyWith<$Res> {
  factory _$$_LostConnectivityStateCopyWith(_$_LostConnectivityState value,
          $Res Function(_$_LostConnectivityState) then) =
      __$$_LostConnectivityStateCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_LostConnectivityStateCopyWithImpl<$Res>
    extends _$ConnectivityStateCopyWithImpl<$Res, _$_LostConnectivityState>
    implements _$$_LostConnectivityStateCopyWith<$Res> {
  __$$_LostConnectivityStateCopyWithImpl(_$_LostConnectivityState _value,
      $Res Function(_$_LostConnectivityState) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_LostConnectivityState implements _LostConnectivityState {
  const _$_LostConnectivityState();

  @override
  String toString() {
    return 'ConnectivityState.lostConnectivity()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_LostConnectivityState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() active,
    required TResult Function() lostConnectivity,
  }) {
    return lostConnectivity();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? active,
    TResult? Function()? lostConnectivity,
  }) {
    return lostConnectivity?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? active,
    TResult Function()? lostConnectivity,
    required TResult orElse(),
  }) {
    if (lostConnectivity != null) {
      return lostConnectivity();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitialState value) initial,
    required TResult Function(_ActiveState value) active,
    required TResult Function(_LostConnectivityState value) lostConnectivity,
  }) {
    return lostConnectivity(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InitialState value)? initial,
    TResult? Function(_ActiveState value)? active,
    TResult? Function(_LostConnectivityState value)? lostConnectivity,
  }) {
    return lostConnectivity?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitialState value)? initial,
    TResult Function(_ActiveState value)? active,
    TResult Function(_LostConnectivityState value)? lostConnectivity,
    required TResult orElse(),
  }) {
    if (lostConnectivity != null) {
      return lostConnectivity(this);
    }
    return orElse();
  }
}

abstract class _LostConnectivityState implements ConnectivityState {
  const factory _LostConnectivityState() = _$_LostConnectivityState;
}

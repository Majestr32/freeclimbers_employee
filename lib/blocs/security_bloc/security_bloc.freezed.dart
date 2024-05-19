// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'security_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SecurityEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool firstLaunch) fetchAvailableSecurities,
    required TResult Function() authWithSetMethod,
    required TResult Function() togglePushMessages,
    required TResult Function(LockTimeout timeout) setTimeout,
    required TResult Function() discardAuthentication,
    required TResult Function() toggleLoginWithFaceId,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool firstLaunch)? fetchAvailableSecurities,
    TResult? Function()? authWithSetMethod,
    TResult? Function()? togglePushMessages,
    TResult? Function(LockTimeout timeout)? setTimeout,
    TResult? Function()? discardAuthentication,
    TResult? Function()? toggleLoginWithFaceId,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool firstLaunch)? fetchAvailableSecurities,
    TResult Function()? authWithSetMethod,
    TResult Function()? togglePushMessages,
    TResult Function(LockTimeout timeout)? setTimeout,
    TResult Function()? discardAuthentication,
    TResult Function()? toggleLoginWithFaceId,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchAvailableSecuritiesEvent value)
        fetchAvailableSecurities,
    required TResult Function(_AuthWithSetMethodEvent value) authWithSetMethod,
    required TResult Function(_TogglePushMessagesEvent value)
        togglePushMessages,
    required TResult Function(_SetTimeoutEvent value) setTimeout,
    required TResult Function(_DiscardAuthenticationEvent value)
        discardAuthentication,
    required TResult Function(_ToggleLoginWithFaceIdEvent value)
        toggleLoginWithFaceId,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FetchAvailableSecuritiesEvent value)?
        fetchAvailableSecurities,
    TResult? Function(_AuthWithSetMethodEvent value)? authWithSetMethod,
    TResult? Function(_TogglePushMessagesEvent value)? togglePushMessages,
    TResult? Function(_SetTimeoutEvent value)? setTimeout,
    TResult? Function(_DiscardAuthenticationEvent value)? discardAuthentication,
    TResult? Function(_ToggleLoginWithFaceIdEvent value)? toggleLoginWithFaceId,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchAvailableSecuritiesEvent value)?
        fetchAvailableSecurities,
    TResult Function(_AuthWithSetMethodEvent value)? authWithSetMethod,
    TResult Function(_TogglePushMessagesEvent value)? togglePushMessages,
    TResult Function(_SetTimeoutEvent value)? setTimeout,
    TResult Function(_DiscardAuthenticationEvent value)? discardAuthentication,
    TResult Function(_ToggleLoginWithFaceIdEvent value)? toggleLoginWithFaceId,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SecurityEventCopyWith<$Res> {
  factory $SecurityEventCopyWith(
          SecurityEvent value, $Res Function(SecurityEvent) then) =
      _$SecurityEventCopyWithImpl<$Res, SecurityEvent>;
}

/// @nodoc
class _$SecurityEventCopyWithImpl<$Res, $Val extends SecurityEvent>
    implements $SecurityEventCopyWith<$Res> {
  _$SecurityEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_FetchAvailableSecuritiesEventCopyWith<$Res> {
  factory _$$_FetchAvailableSecuritiesEventCopyWith(
          _$_FetchAvailableSecuritiesEvent value,
          $Res Function(_$_FetchAvailableSecuritiesEvent) then) =
      __$$_FetchAvailableSecuritiesEventCopyWithImpl<$Res>;
  @useResult
  $Res call({bool firstLaunch});
}

/// @nodoc
class __$$_FetchAvailableSecuritiesEventCopyWithImpl<$Res>
    extends _$SecurityEventCopyWithImpl<$Res, _$_FetchAvailableSecuritiesEvent>
    implements _$$_FetchAvailableSecuritiesEventCopyWith<$Res> {
  __$$_FetchAvailableSecuritiesEventCopyWithImpl(
      _$_FetchAvailableSecuritiesEvent _value,
      $Res Function(_$_FetchAvailableSecuritiesEvent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? firstLaunch = null,
  }) {
    return _then(_$_FetchAvailableSecuritiesEvent(
      firstLaunch: null == firstLaunch
          ? _value.firstLaunch
          : firstLaunch // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_FetchAvailableSecuritiesEvent
    implements _FetchAvailableSecuritiesEvent {
  const _$_FetchAvailableSecuritiesEvent({required this.firstLaunch});

  @override
  final bool firstLaunch;

  @override
  String toString() {
    return 'SecurityEvent.fetchAvailableSecurities(firstLaunch: $firstLaunch)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FetchAvailableSecuritiesEvent &&
            (identical(other.firstLaunch, firstLaunch) ||
                other.firstLaunch == firstLaunch));
  }

  @override
  int get hashCode => Object.hash(runtimeType, firstLaunch);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FetchAvailableSecuritiesEventCopyWith<_$_FetchAvailableSecuritiesEvent>
      get copyWith => __$$_FetchAvailableSecuritiesEventCopyWithImpl<
          _$_FetchAvailableSecuritiesEvent>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool firstLaunch) fetchAvailableSecurities,
    required TResult Function() authWithSetMethod,
    required TResult Function() togglePushMessages,
    required TResult Function(LockTimeout timeout) setTimeout,
    required TResult Function() discardAuthentication,
    required TResult Function() toggleLoginWithFaceId,
  }) {
    return fetchAvailableSecurities(firstLaunch);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool firstLaunch)? fetchAvailableSecurities,
    TResult? Function()? authWithSetMethod,
    TResult? Function()? togglePushMessages,
    TResult? Function(LockTimeout timeout)? setTimeout,
    TResult? Function()? discardAuthentication,
    TResult? Function()? toggleLoginWithFaceId,
  }) {
    return fetchAvailableSecurities?.call(firstLaunch);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool firstLaunch)? fetchAvailableSecurities,
    TResult Function()? authWithSetMethod,
    TResult Function()? togglePushMessages,
    TResult Function(LockTimeout timeout)? setTimeout,
    TResult Function()? discardAuthentication,
    TResult Function()? toggleLoginWithFaceId,
    required TResult orElse(),
  }) {
    if (fetchAvailableSecurities != null) {
      return fetchAvailableSecurities(firstLaunch);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchAvailableSecuritiesEvent value)
        fetchAvailableSecurities,
    required TResult Function(_AuthWithSetMethodEvent value) authWithSetMethod,
    required TResult Function(_TogglePushMessagesEvent value)
        togglePushMessages,
    required TResult Function(_SetTimeoutEvent value) setTimeout,
    required TResult Function(_DiscardAuthenticationEvent value)
        discardAuthentication,
    required TResult Function(_ToggleLoginWithFaceIdEvent value)
        toggleLoginWithFaceId,
  }) {
    return fetchAvailableSecurities(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FetchAvailableSecuritiesEvent value)?
        fetchAvailableSecurities,
    TResult? Function(_AuthWithSetMethodEvent value)? authWithSetMethod,
    TResult? Function(_TogglePushMessagesEvent value)? togglePushMessages,
    TResult? Function(_SetTimeoutEvent value)? setTimeout,
    TResult? Function(_DiscardAuthenticationEvent value)? discardAuthentication,
    TResult? Function(_ToggleLoginWithFaceIdEvent value)? toggleLoginWithFaceId,
  }) {
    return fetchAvailableSecurities?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchAvailableSecuritiesEvent value)?
        fetchAvailableSecurities,
    TResult Function(_AuthWithSetMethodEvent value)? authWithSetMethod,
    TResult Function(_TogglePushMessagesEvent value)? togglePushMessages,
    TResult Function(_SetTimeoutEvent value)? setTimeout,
    TResult Function(_DiscardAuthenticationEvent value)? discardAuthentication,
    TResult Function(_ToggleLoginWithFaceIdEvent value)? toggleLoginWithFaceId,
    required TResult orElse(),
  }) {
    if (fetchAvailableSecurities != null) {
      return fetchAvailableSecurities(this);
    }
    return orElse();
  }
}

abstract class _FetchAvailableSecuritiesEvent implements SecurityEvent {
  const factory _FetchAvailableSecuritiesEvent(
      {required final bool firstLaunch}) = _$_FetchAvailableSecuritiesEvent;

  bool get firstLaunch;
  @JsonKey(ignore: true)
  _$$_FetchAvailableSecuritiesEventCopyWith<_$_FetchAvailableSecuritiesEvent>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_AuthWithSetMethodEventCopyWith<$Res> {
  factory _$$_AuthWithSetMethodEventCopyWith(_$_AuthWithSetMethodEvent value,
          $Res Function(_$_AuthWithSetMethodEvent) then) =
      __$$_AuthWithSetMethodEventCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_AuthWithSetMethodEventCopyWithImpl<$Res>
    extends _$SecurityEventCopyWithImpl<$Res, _$_AuthWithSetMethodEvent>
    implements _$$_AuthWithSetMethodEventCopyWith<$Res> {
  __$$_AuthWithSetMethodEventCopyWithImpl(_$_AuthWithSetMethodEvent _value,
      $Res Function(_$_AuthWithSetMethodEvent) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_AuthWithSetMethodEvent implements _AuthWithSetMethodEvent {
  const _$_AuthWithSetMethodEvent();

  @override
  String toString() {
    return 'SecurityEvent.authWithSetMethod()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AuthWithSetMethodEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool firstLaunch) fetchAvailableSecurities,
    required TResult Function() authWithSetMethod,
    required TResult Function() togglePushMessages,
    required TResult Function(LockTimeout timeout) setTimeout,
    required TResult Function() discardAuthentication,
    required TResult Function() toggleLoginWithFaceId,
  }) {
    return authWithSetMethod();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool firstLaunch)? fetchAvailableSecurities,
    TResult? Function()? authWithSetMethod,
    TResult? Function()? togglePushMessages,
    TResult? Function(LockTimeout timeout)? setTimeout,
    TResult? Function()? discardAuthentication,
    TResult? Function()? toggleLoginWithFaceId,
  }) {
    return authWithSetMethod?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool firstLaunch)? fetchAvailableSecurities,
    TResult Function()? authWithSetMethod,
    TResult Function()? togglePushMessages,
    TResult Function(LockTimeout timeout)? setTimeout,
    TResult Function()? discardAuthentication,
    TResult Function()? toggleLoginWithFaceId,
    required TResult orElse(),
  }) {
    if (authWithSetMethod != null) {
      return authWithSetMethod();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchAvailableSecuritiesEvent value)
        fetchAvailableSecurities,
    required TResult Function(_AuthWithSetMethodEvent value) authWithSetMethod,
    required TResult Function(_TogglePushMessagesEvent value)
        togglePushMessages,
    required TResult Function(_SetTimeoutEvent value) setTimeout,
    required TResult Function(_DiscardAuthenticationEvent value)
        discardAuthentication,
    required TResult Function(_ToggleLoginWithFaceIdEvent value)
        toggleLoginWithFaceId,
  }) {
    return authWithSetMethod(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FetchAvailableSecuritiesEvent value)?
        fetchAvailableSecurities,
    TResult? Function(_AuthWithSetMethodEvent value)? authWithSetMethod,
    TResult? Function(_TogglePushMessagesEvent value)? togglePushMessages,
    TResult? Function(_SetTimeoutEvent value)? setTimeout,
    TResult? Function(_DiscardAuthenticationEvent value)? discardAuthentication,
    TResult? Function(_ToggleLoginWithFaceIdEvent value)? toggleLoginWithFaceId,
  }) {
    return authWithSetMethod?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchAvailableSecuritiesEvent value)?
        fetchAvailableSecurities,
    TResult Function(_AuthWithSetMethodEvent value)? authWithSetMethod,
    TResult Function(_TogglePushMessagesEvent value)? togglePushMessages,
    TResult Function(_SetTimeoutEvent value)? setTimeout,
    TResult Function(_DiscardAuthenticationEvent value)? discardAuthentication,
    TResult Function(_ToggleLoginWithFaceIdEvent value)? toggleLoginWithFaceId,
    required TResult orElse(),
  }) {
    if (authWithSetMethod != null) {
      return authWithSetMethod(this);
    }
    return orElse();
  }
}

abstract class _AuthWithSetMethodEvent implements SecurityEvent {
  const factory _AuthWithSetMethodEvent() = _$_AuthWithSetMethodEvent;
}

/// @nodoc
abstract class _$$_TogglePushMessagesEventCopyWith<$Res> {
  factory _$$_TogglePushMessagesEventCopyWith(_$_TogglePushMessagesEvent value,
          $Res Function(_$_TogglePushMessagesEvent) then) =
      __$$_TogglePushMessagesEventCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_TogglePushMessagesEventCopyWithImpl<$Res>
    extends _$SecurityEventCopyWithImpl<$Res, _$_TogglePushMessagesEvent>
    implements _$$_TogglePushMessagesEventCopyWith<$Res> {
  __$$_TogglePushMessagesEventCopyWithImpl(_$_TogglePushMessagesEvent _value,
      $Res Function(_$_TogglePushMessagesEvent) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_TogglePushMessagesEvent implements _TogglePushMessagesEvent {
  const _$_TogglePushMessagesEvent();

  @override
  String toString() {
    return 'SecurityEvent.togglePushMessages()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TogglePushMessagesEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool firstLaunch) fetchAvailableSecurities,
    required TResult Function() authWithSetMethod,
    required TResult Function() togglePushMessages,
    required TResult Function(LockTimeout timeout) setTimeout,
    required TResult Function() discardAuthentication,
    required TResult Function() toggleLoginWithFaceId,
  }) {
    return togglePushMessages();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool firstLaunch)? fetchAvailableSecurities,
    TResult? Function()? authWithSetMethod,
    TResult? Function()? togglePushMessages,
    TResult? Function(LockTimeout timeout)? setTimeout,
    TResult? Function()? discardAuthentication,
    TResult? Function()? toggleLoginWithFaceId,
  }) {
    return togglePushMessages?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool firstLaunch)? fetchAvailableSecurities,
    TResult Function()? authWithSetMethod,
    TResult Function()? togglePushMessages,
    TResult Function(LockTimeout timeout)? setTimeout,
    TResult Function()? discardAuthentication,
    TResult Function()? toggleLoginWithFaceId,
    required TResult orElse(),
  }) {
    if (togglePushMessages != null) {
      return togglePushMessages();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchAvailableSecuritiesEvent value)
        fetchAvailableSecurities,
    required TResult Function(_AuthWithSetMethodEvent value) authWithSetMethod,
    required TResult Function(_TogglePushMessagesEvent value)
        togglePushMessages,
    required TResult Function(_SetTimeoutEvent value) setTimeout,
    required TResult Function(_DiscardAuthenticationEvent value)
        discardAuthentication,
    required TResult Function(_ToggleLoginWithFaceIdEvent value)
        toggleLoginWithFaceId,
  }) {
    return togglePushMessages(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FetchAvailableSecuritiesEvent value)?
        fetchAvailableSecurities,
    TResult? Function(_AuthWithSetMethodEvent value)? authWithSetMethod,
    TResult? Function(_TogglePushMessagesEvent value)? togglePushMessages,
    TResult? Function(_SetTimeoutEvent value)? setTimeout,
    TResult? Function(_DiscardAuthenticationEvent value)? discardAuthentication,
    TResult? Function(_ToggleLoginWithFaceIdEvent value)? toggleLoginWithFaceId,
  }) {
    return togglePushMessages?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchAvailableSecuritiesEvent value)?
        fetchAvailableSecurities,
    TResult Function(_AuthWithSetMethodEvent value)? authWithSetMethod,
    TResult Function(_TogglePushMessagesEvent value)? togglePushMessages,
    TResult Function(_SetTimeoutEvent value)? setTimeout,
    TResult Function(_DiscardAuthenticationEvent value)? discardAuthentication,
    TResult Function(_ToggleLoginWithFaceIdEvent value)? toggleLoginWithFaceId,
    required TResult orElse(),
  }) {
    if (togglePushMessages != null) {
      return togglePushMessages(this);
    }
    return orElse();
  }
}

abstract class _TogglePushMessagesEvent implements SecurityEvent {
  const factory _TogglePushMessagesEvent() = _$_TogglePushMessagesEvent;
}

/// @nodoc
abstract class _$$_SetTimeoutEventCopyWith<$Res> {
  factory _$$_SetTimeoutEventCopyWith(
          _$_SetTimeoutEvent value, $Res Function(_$_SetTimeoutEvent) then) =
      __$$_SetTimeoutEventCopyWithImpl<$Res>;
  @useResult
  $Res call({LockTimeout timeout});
}

/// @nodoc
class __$$_SetTimeoutEventCopyWithImpl<$Res>
    extends _$SecurityEventCopyWithImpl<$Res, _$_SetTimeoutEvent>
    implements _$$_SetTimeoutEventCopyWith<$Res> {
  __$$_SetTimeoutEventCopyWithImpl(
      _$_SetTimeoutEvent _value, $Res Function(_$_SetTimeoutEvent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? timeout = null,
  }) {
    return _then(_$_SetTimeoutEvent(
      timeout: null == timeout
          ? _value.timeout
          : timeout // ignore: cast_nullable_to_non_nullable
              as LockTimeout,
    ));
  }
}

/// @nodoc

class _$_SetTimeoutEvent implements _SetTimeoutEvent {
  const _$_SetTimeoutEvent({required this.timeout});

  @override
  final LockTimeout timeout;

  @override
  String toString() {
    return 'SecurityEvent.setTimeout(timeout: $timeout)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SetTimeoutEvent &&
            (identical(other.timeout, timeout) || other.timeout == timeout));
  }

  @override
  int get hashCode => Object.hash(runtimeType, timeout);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SetTimeoutEventCopyWith<_$_SetTimeoutEvent> get copyWith =>
      __$$_SetTimeoutEventCopyWithImpl<_$_SetTimeoutEvent>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool firstLaunch) fetchAvailableSecurities,
    required TResult Function() authWithSetMethod,
    required TResult Function() togglePushMessages,
    required TResult Function(LockTimeout timeout) setTimeout,
    required TResult Function() discardAuthentication,
    required TResult Function() toggleLoginWithFaceId,
  }) {
    return setTimeout(timeout);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool firstLaunch)? fetchAvailableSecurities,
    TResult? Function()? authWithSetMethod,
    TResult? Function()? togglePushMessages,
    TResult? Function(LockTimeout timeout)? setTimeout,
    TResult? Function()? discardAuthentication,
    TResult? Function()? toggleLoginWithFaceId,
  }) {
    return setTimeout?.call(timeout);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool firstLaunch)? fetchAvailableSecurities,
    TResult Function()? authWithSetMethod,
    TResult Function()? togglePushMessages,
    TResult Function(LockTimeout timeout)? setTimeout,
    TResult Function()? discardAuthentication,
    TResult Function()? toggleLoginWithFaceId,
    required TResult orElse(),
  }) {
    if (setTimeout != null) {
      return setTimeout(timeout);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchAvailableSecuritiesEvent value)
        fetchAvailableSecurities,
    required TResult Function(_AuthWithSetMethodEvent value) authWithSetMethod,
    required TResult Function(_TogglePushMessagesEvent value)
        togglePushMessages,
    required TResult Function(_SetTimeoutEvent value) setTimeout,
    required TResult Function(_DiscardAuthenticationEvent value)
        discardAuthentication,
    required TResult Function(_ToggleLoginWithFaceIdEvent value)
        toggleLoginWithFaceId,
  }) {
    return setTimeout(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FetchAvailableSecuritiesEvent value)?
        fetchAvailableSecurities,
    TResult? Function(_AuthWithSetMethodEvent value)? authWithSetMethod,
    TResult? Function(_TogglePushMessagesEvent value)? togglePushMessages,
    TResult? Function(_SetTimeoutEvent value)? setTimeout,
    TResult? Function(_DiscardAuthenticationEvent value)? discardAuthentication,
    TResult? Function(_ToggleLoginWithFaceIdEvent value)? toggleLoginWithFaceId,
  }) {
    return setTimeout?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchAvailableSecuritiesEvent value)?
        fetchAvailableSecurities,
    TResult Function(_AuthWithSetMethodEvent value)? authWithSetMethod,
    TResult Function(_TogglePushMessagesEvent value)? togglePushMessages,
    TResult Function(_SetTimeoutEvent value)? setTimeout,
    TResult Function(_DiscardAuthenticationEvent value)? discardAuthentication,
    TResult Function(_ToggleLoginWithFaceIdEvent value)? toggleLoginWithFaceId,
    required TResult orElse(),
  }) {
    if (setTimeout != null) {
      return setTimeout(this);
    }
    return orElse();
  }
}

abstract class _SetTimeoutEvent implements SecurityEvent {
  const factory _SetTimeoutEvent({required final LockTimeout timeout}) =
      _$_SetTimeoutEvent;

  LockTimeout get timeout;
  @JsonKey(ignore: true)
  _$$_SetTimeoutEventCopyWith<_$_SetTimeoutEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_DiscardAuthenticationEventCopyWith<$Res> {
  factory _$$_DiscardAuthenticationEventCopyWith(
          _$_DiscardAuthenticationEvent value,
          $Res Function(_$_DiscardAuthenticationEvent) then) =
      __$$_DiscardAuthenticationEventCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_DiscardAuthenticationEventCopyWithImpl<$Res>
    extends _$SecurityEventCopyWithImpl<$Res, _$_DiscardAuthenticationEvent>
    implements _$$_DiscardAuthenticationEventCopyWith<$Res> {
  __$$_DiscardAuthenticationEventCopyWithImpl(
      _$_DiscardAuthenticationEvent _value,
      $Res Function(_$_DiscardAuthenticationEvent) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_DiscardAuthenticationEvent implements _DiscardAuthenticationEvent {
  const _$_DiscardAuthenticationEvent();

  @override
  String toString() {
    return 'SecurityEvent.discardAuthentication()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DiscardAuthenticationEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool firstLaunch) fetchAvailableSecurities,
    required TResult Function() authWithSetMethod,
    required TResult Function() togglePushMessages,
    required TResult Function(LockTimeout timeout) setTimeout,
    required TResult Function() discardAuthentication,
    required TResult Function() toggleLoginWithFaceId,
  }) {
    return discardAuthentication();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool firstLaunch)? fetchAvailableSecurities,
    TResult? Function()? authWithSetMethod,
    TResult? Function()? togglePushMessages,
    TResult? Function(LockTimeout timeout)? setTimeout,
    TResult? Function()? discardAuthentication,
    TResult? Function()? toggleLoginWithFaceId,
  }) {
    return discardAuthentication?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool firstLaunch)? fetchAvailableSecurities,
    TResult Function()? authWithSetMethod,
    TResult Function()? togglePushMessages,
    TResult Function(LockTimeout timeout)? setTimeout,
    TResult Function()? discardAuthentication,
    TResult Function()? toggleLoginWithFaceId,
    required TResult orElse(),
  }) {
    if (discardAuthentication != null) {
      return discardAuthentication();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchAvailableSecuritiesEvent value)
        fetchAvailableSecurities,
    required TResult Function(_AuthWithSetMethodEvent value) authWithSetMethod,
    required TResult Function(_TogglePushMessagesEvent value)
        togglePushMessages,
    required TResult Function(_SetTimeoutEvent value) setTimeout,
    required TResult Function(_DiscardAuthenticationEvent value)
        discardAuthentication,
    required TResult Function(_ToggleLoginWithFaceIdEvent value)
        toggleLoginWithFaceId,
  }) {
    return discardAuthentication(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FetchAvailableSecuritiesEvent value)?
        fetchAvailableSecurities,
    TResult? Function(_AuthWithSetMethodEvent value)? authWithSetMethod,
    TResult? Function(_TogglePushMessagesEvent value)? togglePushMessages,
    TResult? Function(_SetTimeoutEvent value)? setTimeout,
    TResult? Function(_DiscardAuthenticationEvent value)? discardAuthentication,
    TResult? Function(_ToggleLoginWithFaceIdEvent value)? toggleLoginWithFaceId,
  }) {
    return discardAuthentication?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchAvailableSecuritiesEvent value)?
        fetchAvailableSecurities,
    TResult Function(_AuthWithSetMethodEvent value)? authWithSetMethod,
    TResult Function(_TogglePushMessagesEvent value)? togglePushMessages,
    TResult Function(_SetTimeoutEvent value)? setTimeout,
    TResult Function(_DiscardAuthenticationEvent value)? discardAuthentication,
    TResult Function(_ToggleLoginWithFaceIdEvent value)? toggleLoginWithFaceId,
    required TResult orElse(),
  }) {
    if (discardAuthentication != null) {
      return discardAuthentication(this);
    }
    return orElse();
  }
}

abstract class _DiscardAuthenticationEvent implements SecurityEvent {
  const factory _DiscardAuthenticationEvent() = _$_DiscardAuthenticationEvent;
}

/// @nodoc
abstract class _$$_ToggleLoginWithFaceIdEventCopyWith<$Res> {
  factory _$$_ToggleLoginWithFaceIdEventCopyWith(
          _$_ToggleLoginWithFaceIdEvent value,
          $Res Function(_$_ToggleLoginWithFaceIdEvent) then) =
      __$$_ToggleLoginWithFaceIdEventCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_ToggleLoginWithFaceIdEventCopyWithImpl<$Res>
    extends _$SecurityEventCopyWithImpl<$Res, _$_ToggleLoginWithFaceIdEvent>
    implements _$$_ToggleLoginWithFaceIdEventCopyWith<$Res> {
  __$$_ToggleLoginWithFaceIdEventCopyWithImpl(
      _$_ToggleLoginWithFaceIdEvent _value,
      $Res Function(_$_ToggleLoginWithFaceIdEvent) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_ToggleLoginWithFaceIdEvent implements _ToggleLoginWithFaceIdEvent {
  const _$_ToggleLoginWithFaceIdEvent();

  @override
  String toString() {
    return 'SecurityEvent.toggleLoginWithFaceId()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ToggleLoginWithFaceIdEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool firstLaunch) fetchAvailableSecurities,
    required TResult Function() authWithSetMethod,
    required TResult Function() togglePushMessages,
    required TResult Function(LockTimeout timeout) setTimeout,
    required TResult Function() discardAuthentication,
    required TResult Function() toggleLoginWithFaceId,
  }) {
    return toggleLoginWithFaceId();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool firstLaunch)? fetchAvailableSecurities,
    TResult? Function()? authWithSetMethod,
    TResult? Function()? togglePushMessages,
    TResult? Function(LockTimeout timeout)? setTimeout,
    TResult? Function()? discardAuthentication,
    TResult? Function()? toggleLoginWithFaceId,
  }) {
    return toggleLoginWithFaceId?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool firstLaunch)? fetchAvailableSecurities,
    TResult Function()? authWithSetMethod,
    TResult Function()? togglePushMessages,
    TResult Function(LockTimeout timeout)? setTimeout,
    TResult Function()? discardAuthentication,
    TResult Function()? toggleLoginWithFaceId,
    required TResult orElse(),
  }) {
    if (toggleLoginWithFaceId != null) {
      return toggleLoginWithFaceId();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchAvailableSecuritiesEvent value)
        fetchAvailableSecurities,
    required TResult Function(_AuthWithSetMethodEvent value) authWithSetMethod,
    required TResult Function(_TogglePushMessagesEvent value)
        togglePushMessages,
    required TResult Function(_SetTimeoutEvent value) setTimeout,
    required TResult Function(_DiscardAuthenticationEvent value)
        discardAuthentication,
    required TResult Function(_ToggleLoginWithFaceIdEvent value)
        toggleLoginWithFaceId,
  }) {
    return toggleLoginWithFaceId(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FetchAvailableSecuritiesEvent value)?
        fetchAvailableSecurities,
    TResult? Function(_AuthWithSetMethodEvent value)? authWithSetMethod,
    TResult? Function(_TogglePushMessagesEvent value)? togglePushMessages,
    TResult? Function(_SetTimeoutEvent value)? setTimeout,
    TResult? Function(_DiscardAuthenticationEvent value)? discardAuthentication,
    TResult? Function(_ToggleLoginWithFaceIdEvent value)? toggleLoginWithFaceId,
  }) {
    return toggleLoginWithFaceId?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchAvailableSecuritiesEvent value)?
        fetchAvailableSecurities,
    TResult Function(_AuthWithSetMethodEvent value)? authWithSetMethod,
    TResult Function(_TogglePushMessagesEvent value)? togglePushMessages,
    TResult Function(_SetTimeoutEvent value)? setTimeout,
    TResult Function(_DiscardAuthenticationEvent value)? discardAuthentication,
    TResult Function(_ToggleLoginWithFaceIdEvent value)? toggleLoginWithFaceId,
    required TResult orElse(),
  }) {
    if (toggleLoginWithFaceId != null) {
      return toggleLoginWithFaceId(this);
    }
    return orElse();
  }
}

abstract class _ToggleLoginWithFaceIdEvent implements SecurityEvent {
  const factory _ToggleLoginWithFaceIdEvent() = _$_ToggleLoginWithFaceIdEvent;
}

/// @nodoc
mixin _$SecurityState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(bool loginWithFaceId, LockTimeout timeout,
            bool pushMessages, bool isLocked, BiometricType biometricType)
        initialized,
    required TResult Function(bool loginWithFaceId, LockTimeout timeout,
            bool pushMessages, BiometricType biometricType)
        enabledBiometrics,
    required TResult Function(bool loginWithFaceId, LockTimeout timeout,
            bool pushMessages, BiometricType biometricType)
        passed,
    required TResult Function(bool loginWithFaceId, LockTimeout timeout,
            bool pushMessages, BiometricType biometricType)
        failed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(bool loginWithFaceId, LockTimeout timeout,
            bool pushMessages, bool isLocked, BiometricType biometricType)?
        initialized,
    TResult? Function(bool loginWithFaceId, LockTimeout timeout,
            bool pushMessages, BiometricType biometricType)?
        enabledBiometrics,
    TResult? Function(bool loginWithFaceId, LockTimeout timeout,
            bool pushMessages, BiometricType biometricType)?
        passed,
    TResult? Function(bool loginWithFaceId, LockTimeout timeout,
            bool pushMessages, BiometricType biometricType)?
        failed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(bool loginWithFaceId, LockTimeout timeout,
            bool pushMessages, bool isLocked, BiometricType biometricType)?
        initialized,
    TResult Function(bool loginWithFaceId, LockTimeout timeout,
            bool pushMessages, BiometricType biometricType)?
        enabledBiometrics,
    TResult Function(bool loginWithFaceId, LockTimeout timeout,
            bool pushMessages, BiometricType biometricType)?
        passed,
    TResult Function(bool loginWithFaceId, LockTimeout timeout,
            bool pushMessages, BiometricType biometricType)?
        failed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitialState value) initial,
    required TResult Function(_InitializedState value) initialized,
    required TResult Function(_EnabledBiometricsState value) enabledBiometrics,
    required TResult Function(_PassedState value) passed,
    required TResult Function(_FailedState value) failed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InitialState value)? initial,
    TResult? Function(_InitializedState value)? initialized,
    TResult? Function(_EnabledBiometricsState value)? enabledBiometrics,
    TResult? Function(_PassedState value)? passed,
    TResult? Function(_FailedState value)? failed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitialState value)? initial,
    TResult Function(_InitializedState value)? initialized,
    TResult Function(_EnabledBiometricsState value)? enabledBiometrics,
    TResult Function(_PassedState value)? passed,
    TResult Function(_FailedState value)? failed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SecurityStateCopyWith<$Res> {
  factory $SecurityStateCopyWith(
          SecurityState value, $Res Function(SecurityState) then) =
      _$SecurityStateCopyWithImpl<$Res, SecurityState>;
}

/// @nodoc
class _$SecurityStateCopyWithImpl<$Res, $Val extends SecurityState>
    implements $SecurityStateCopyWith<$Res> {
  _$SecurityStateCopyWithImpl(this._value, this._then);

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
    extends _$SecurityStateCopyWithImpl<$Res, _$_InitialState>
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
    return 'SecurityState.initial()';
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
    required TResult Function(bool loginWithFaceId, LockTimeout timeout,
            bool pushMessages, bool isLocked, BiometricType biometricType)
        initialized,
    required TResult Function(bool loginWithFaceId, LockTimeout timeout,
            bool pushMessages, BiometricType biometricType)
        enabledBiometrics,
    required TResult Function(bool loginWithFaceId, LockTimeout timeout,
            bool pushMessages, BiometricType biometricType)
        passed,
    required TResult Function(bool loginWithFaceId, LockTimeout timeout,
            bool pushMessages, BiometricType biometricType)
        failed,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(bool loginWithFaceId, LockTimeout timeout,
            bool pushMessages, bool isLocked, BiometricType biometricType)?
        initialized,
    TResult? Function(bool loginWithFaceId, LockTimeout timeout,
            bool pushMessages, BiometricType biometricType)?
        enabledBiometrics,
    TResult? Function(bool loginWithFaceId, LockTimeout timeout,
            bool pushMessages, BiometricType biometricType)?
        passed,
    TResult? Function(bool loginWithFaceId, LockTimeout timeout,
            bool pushMessages, BiometricType biometricType)?
        failed,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(bool loginWithFaceId, LockTimeout timeout,
            bool pushMessages, bool isLocked, BiometricType biometricType)?
        initialized,
    TResult Function(bool loginWithFaceId, LockTimeout timeout,
            bool pushMessages, BiometricType biometricType)?
        enabledBiometrics,
    TResult Function(bool loginWithFaceId, LockTimeout timeout,
            bool pushMessages, BiometricType biometricType)?
        passed,
    TResult Function(bool loginWithFaceId, LockTimeout timeout,
            bool pushMessages, BiometricType biometricType)?
        failed,
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
    required TResult Function(_EnabledBiometricsState value) enabledBiometrics,
    required TResult Function(_PassedState value) passed,
    required TResult Function(_FailedState value) failed,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InitialState value)? initial,
    TResult? Function(_InitializedState value)? initialized,
    TResult? Function(_EnabledBiometricsState value)? enabledBiometrics,
    TResult? Function(_PassedState value)? passed,
    TResult? Function(_FailedState value)? failed,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitialState value)? initial,
    TResult Function(_InitializedState value)? initialized,
    TResult Function(_EnabledBiometricsState value)? enabledBiometrics,
    TResult Function(_PassedState value)? passed,
    TResult Function(_FailedState value)? failed,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _InitialState extends SecurityState {
  const factory _InitialState() = _$_InitialState;
  const _InitialState._() : super._();
}

/// @nodoc
abstract class _$$_InitializedStateCopyWith<$Res> {
  factory _$$_InitializedStateCopyWith(
          _$_InitializedState value, $Res Function(_$_InitializedState) then) =
      __$$_InitializedStateCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {bool loginWithFaceId,
      LockTimeout timeout,
      bool pushMessages,
      bool isLocked,
      BiometricType biometricType});
}

/// @nodoc
class __$$_InitializedStateCopyWithImpl<$Res>
    extends _$SecurityStateCopyWithImpl<$Res, _$_InitializedState>
    implements _$$_InitializedStateCopyWith<$Res> {
  __$$_InitializedStateCopyWithImpl(
      _$_InitializedState _value, $Res Function(_$_InitializedState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loginWithFaceId = null,
    Object? timeout = null,
    Object? pushMessages = null,
    Object? isLocked = null,
    Object? biometricType = null,
  }) {
    return _then(_$_InitializedState(
      loginWithFaceId: null == loginWithFaceId
          ? _value.loginWithFaceId
          : loginWithFaceId // ignore: cast_nullable_to_non_nullable
              as bool,
      timeout: null == timeout
          ? _value.timeout
          : timeout // ignore: cast_nullable_to_non_nullable
              as LockTimeout,
      pushMessages: null == pushMessages
          ? _value.pushMessages
          : pushMessages // ignore: cast_nullable_to_non_nullable
              as bool,
      isLocked: null == isLocked
          ? _value.isLocked
          : isLocked // ignore: cast_nullable_to_non_nullable
              as bool,
      biometricType: null == biometricType
          ? _value.biometricType
          : biometricType // ignore: cast_nullable_to_non_nullable
              as BiometricType,
    ));
  }
}

/// @nodoc

class _$_InitializedState extends _InitializedState {
  const _$_InitializedState(
      {required this.loginWithFaceId,
      required this.timeout,
      required this.pushMessages,
      this.isLocked = false,
      required this.biometricType})
      : super._();

  @override
  final bool loginWithFaceId;
  @override
  final LockTimeout timeout;
  @override
  final bool pushMessages;
  @override
  @JsonKey()
  final bool isLocked;
  @override
  final BiometricType biometricType;

  @override
  String toString() {
    return 'SecurityState.initialized(loginWithFaceId: $loginWithFaceId, timeout: $timeout, pushMessages: $pushMessages, isLocked: $isLocked, biometricType: $biometricType)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_InitializedState &&
            (identical(other.loginWithFaceId, loginWithFaceId) ||
                other.loginWithFaceId == loginWithFaceId) &&
            (identical(other.timeout, timeout) || other.timeout == timeout) &&
            (identical(other.pushMessages, pushMessages) ||
                other.pushMessages == pushMessages) &&
            (identical(other.isLocked, isLocked) ||
                other.isLocked == isLocked) &&
            (identical(other.biometricType, biometricType) ||
                other.biometricType == biometricType));
  }

  @override
  int get hashCode => Object.hash(runtimeType, loginWithFaceId, timeout,
      pushMessages, isLocked, biometricType);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_InitializedStateCopyWith<_$_InitializedState> get copyWith =>
      __$$_InitializedStateCopyWithImpl<_$_InitializedState>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(bool loginWithFaceId, LockTimeout timeout,
            bool pushMessages, bool isLocked, BiometricType biometricType)
        initialized,
    required TResult Function(bool loginWithFaceId, LockTimeout timeout,
            bool pushMessages, BiometricType biometricType)
        enabledBiometrics,
    required TResult Function(bool loginWithFaceId, LockTimeout timeout,
            bool pushMessages, BiometricType biometricType)
        passed,
    required TResult Function(bool loginWithFaceId, LockTimeout timeout,
            bool pushMessages, BiometricType biometricType)
        failed,
  }) {
    return initialized(
        loginWithFaceId, timeout, pushMessages, isLocked, biometricType);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(bool loginWithFaceId, LockTimeout timeout,
            bool pushMessages, bool isLocked, BiometricType biometricType)?
        initialized,
    TResult? Function(bool loginWithFaceId, LockTimeout timeout,
            bool pushMessages, BiometricType biometricType)?
        enabledBiometrics,
    TResult? Function(bool loginWithFaceId, LockTimeout timeout,
            bool pushMessages, BiometricType biometricType)?
        passed,
    TResult? Function(bool loginWithFaceId, LockTimeout timeout,
            bool pushMessages, BiometricType biometricType)?
        failed,
  }) {
    return initialized?.call(
        loginWithFaceId, timeout, pushMessages, isLocked, biometricType);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(bool loginWithFaceId, LockTimeout timeout,
            bool pushMessages, bool isLocked, BiometricType biometricType)?
        initialized,
    TResult Function(bool loginWithFaceId, LockTimeout timeout,
            bool pushMessages, BiometricType biometricType)?
        enabledBiometrics,
    TResult Function(bool loginWithFaceId, LockTimeout timeout,
            bool pushMessages, BiometricType biometricType)?
        passed,
    TResult Function(bool loginWithFaceId, LockTimeout timeout,
            bool pushMessages, BiometricType biometricType)?
        failed,
    required TResult orElse(),
  }) {
    if (initialized != null) {
      return initialized(
          loginWithFaceId, timeout, pushMessages, isLocked, biometricType);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitialState value) initial,
    required TResult Function(_InitializedState value) initialized,
    required TResult Function(_EnabledBiometricsState value) enabledBiometrics,
    required TResult Function(_PassedState value) passed,
    required TResult Function(_FailedState value) failed,
  }) {
    return initialized(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InitialState value)? initial,
    TResult? Function(_InitializedState value)? initialized,
    TResult? Function(_EnabledBiometricsState value)? enabledBiometrics,
    TResult? Function(_PassedState value)? passed,
    TResult? Function(_FailedState value)? failed,
  }) {
    return initialized?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitialState value)? initial,
    TResult Function(_InitializedState value)? initialized,
    TResult Function(_EnabledBiometricsState value)? enabledBiometrics,
    TResult Function(_PassedState value)? passed,
    TResult Function(_FailedState value)? failed,
    required TResult orElse(),
  }) {
    if (initialized != null) {
      return initialized(this);
    }
    return orElse();
  }
}

abstract class _InitializedState extends SecurityState {
  const factory _InitializedState(
      {required final bool loginWithFaceId,
      required final LockTimeout timeout,
      required final bool pushMessages,
      final bool isLocked,
      required final BiometricType biometricType}) = _$_InitializedState;
  const _InitializedState._() : super._();

  bool get loginWithFaceId;
  LockTimeout get timeout;
  bool get pushMessages;
  bool get isLocked;
  BiometricType get biometricType;
  @JsonKey(ignore: true)
  _$$_InitializedStateCopyWith<_$_InitializedState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_EnabledBiometricsStateCopyWith<$Res> {
  factory _$$_EnabledBiometricsStateCopyWith(_$_EnabledBiometricsState value,
          $Res Function(_$_EnabledBiometricsState) then) =
      __$$_EnabledBiometricsStateCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {bool loginWithFaceId,
      LockTimeout timeout,
      bool pushMessages,
      BiometricType biometricType});
}

/// @nodoc
class __$$_EnabledBiometricsStateCopyWithImpl<$Res>
    extends _$SecurityStateCopyWithImpl<$Res, _$_EnabledBiometricsState>
    implements _$$_EnabledBiometricsStateCopyWith<$Res> {
  __$$_EnabledBiometricsStateCopyWithImpl(_$_EnabledBiometricsState _value,
      $Res Function(_$_EnabledBiometricsState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loginWithFaceId = null,
    Object? timeout = null,
    Object? pushMessages = null,
    Object? biometricType = null,
  }) {
    return _then(_$_EnabledBiometricsState(
      loginWithFaceId: null == loginWithFaceId
          ? _value.loginWithFaceId
          : loginWithFaceId // ignore: cast_nullable_to_non_nullable
              as bool,
      timeout: null == timeout
          ? _value.timeout
          : timeout // ignore: cast_nullable_to_non_nullable
              as LockTimeout,
      pushMessages: null == pushMessages
          ? _value.pushMessages
          : pushMessages // ignore: cast_nullable_to_non_nullable
              as bool,
      biometricType: null == biometricType
          ? _value.biometricType
          : biometricType // ignore: cast_nullable_to_non_nullable
              as BiometricType,
    ));
  }
}

/// @nodoc

class _$_EnabledBiometricsState extends _EnabledBiometricsState {
  const _$_EnabledBiometricsState(
      {required this.loginWithFaceId,
      required this.timeout,
      required this.pushMessages,
      required this.biometricType})
      : super._();

  @override
  final bool loginWithFaceId;
  @override
  final LockTimeout timeout;
  @override
  final bool pushMessages;
  @override
  final BiometricType biometricType;

  @override
  String toString() {
    return 'SecurityState.enabledBiometrics(loginWithFaceId: $loginWithFaceId, timeout: $timeout, pushMessages: $pushMessages, biometricType: $biometricType)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_EnabledBiometricsState &&
            (identical(other.loginWithFaceId, loginWithFaceId) ||
                other.loginWithFaceId == loginWithFaceId) &&
            (identical(other.timeout, timeout) || other.timeout == timeout) &&
            (identical(other.pushMessages, pushMessages) ||
                other.pushMessages == pushMessages) &&
            (identical(other.biometricType, biometricType) ||
                other.biometricType == biometricType));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, loginWithFaceId, timeout, pushMessages, biometricType);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_EnabledBiometricsStateCopyWith<_$_EnabledBiometricsState> get copyWith =>
      __$$_EnabledBiometricsStateCopyWithImpl<_$_EnabledBiometricsState>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(bool loginWithFaceId, LockTimeout timeout,
            bool pushMessages, bool isLocked, BiometricType biometricType)
        initialized,
    required TResult Function(bool loginWithFaceId, LockTimeout timeout,
            bool pushMessages, BiometricType biometricType)
        enabledBiometrics,
    required TResult Function(bool loginWithFaceId, LockTimeout timeout,
            bool pushMessages, BiometricType biometricType)
        passed,
    required TResult Function(bool loginWithFaceId, LockTimeout timeout,
            bool pushMessages, BiometricType biometricType)
        failed,
  }) {
    return enabledBiometrics(
        loginWithFaceId, timeout, pushMessages, biometricType);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(bool loginWithFaceId, LockTimeout timeout,
            bool pushMessages, bool isLocked, BiometricType biometricType)?
        initialized,
    TResult? Function(bool loginWithFaceId, LockTimeout timeout,
            bool pushMessages, BiometricType biometricType)?
        enabledBiometrics,
    TResult? Function(bool loginWithFaceId, LockTimeout timeout,
            bool pushMessages, BiometricType biometricType)?
        passed,
    TResult? Function(bool loginWithFaceId, LockTimeout timeout,
            bool pushMessages, BiometricType biometricType)?
        failed,
  }) {
    return enabledBiometrics?.call(
        loginWithFaceId, timeout, pushMessages, biometricType);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(bool loginWithFaceId, LockTimeout timeout,
            bool pushMessages, bool isLocked, BiometricType biometricType)?
        initialized,
    TResult Function(bool loginWithFaceId, LockTimeout timeout,
            bool pushMessages, BiometricType biometricType)?
        enabledBiometrics,
    TResult Function(bool loginWithFaceId, LockTimeout timeout,
            bool pushMessages, BiometricType biometricType)?
        passed,
    TResult Function(bool loginWithFaceId, LockTimeout timeout,
            bool pushMessages, BiometricType biometricType)?
        failed,
    required TResult orElse(),
  }) {
    if (enabledBiometrics != null) {
      return enabledBiometrics(
          loginWithFaceId, timeout, pushMessages, biometricType);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitialState value) initial,
    required TResult Function(_InitializedState value) initialized,
    required TResult Function(_EnabledBiometricsState value) enabledBiometrics,
    required TResult Function(_PassedState value) passed,
    required TResult Function(_FailedState value) failed,
  }) {
    return enabledBiometrics(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InitialState value)? initial,
    TResult? Function(_InitializedState value)? initialized,
    TResult? Function(_EnabledBiometricsState value)? enabledBiometrics,
    TResult? Function(_PassedState value)? passed,
    TResult? Function(_FailedState value)? failed,
  }) {
    return enabledBiometrics?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitialState value)? initial,
    TResult Function(_InitializedState value)? initialized,
    TResult Function(_EnabledBiometricsState value)? enabledBiometrics,
    TResult Function(_PassedState value)? passed,
    TResult Function(_FailedState value)? failed,
    required TResult orElse(),
  }) {
    if (enabledBiometrics != null) {
      return enabledBiometrics(this);
    }
    return orElse();
  }
}

abstract class _EnabledBiometricsState extends SecurityState {
  const factory _EnabledBiometricsState(
      {required final bool loginWithFaceId,
      required final LockTimeout timeout,
      required final bool pushMessages,
      required final BiometricType biometricType}) = _$_EnabledBiometricsState;
  const _EnabledBiometricsState._() : super._();

  bool get loginWithFaceId;
  LockTimeout get timeout;
  bool get pushMessages;
  BiometricType get biometricType;
  @JsonKey(ignore: true)
  _$$_EnabledBiometricsStateCopyWith<_$_EnabledBiometricsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_PassedStateCopyWith<$Res> {
  factory _$$_PassedStateCopyWith(
          _$_PassedState value, $Res Function(_$_PassedState) then) =
      __$$_PassedStateCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {bool loginWithFaceId,
      LockTimeout timeout,
      bool pushMessages,
      BiometricType biometricType});
}

/// @nodoc
class __$$_PassedStateCopyWithImpl<$Res>
    extends _$SecurityStateCopyWithImpl<$Res, _$_PassedState>
    implements _$$_PassedStateCopyWith<$Res> {
  __$$_PassedStateCopyWithImpl(
      _$_PassedState _value, $Res Function(_$_PassedState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loginWithFaceId = null,
    Object? timeout = null,
    Object? pushMessages = null,
    Object? biometricType = null,
  }) {
    return _then(_$_PassedState(
      loginWithFaceId: null == loginWithFaceId
          ? _value.loginWithFaceId
          : loginWithFaceId // ignore: cast_nullable_to_non_nullable
              as bool,
      timeout: null == timeout
          ? _value.timeout
          : timeout // ignore: cast_nullable_to_non_nullable
              as LockTimeout,
      pushMessages: null == pushMessages
          ? _value.pushMessages
          : pushMessages // ignore: cast_nullable_to_non_nullable
              as bool,
      biometricType: null == biometricType
          ? _value.biometricType
          : biometricType // ignore: cast_nullable_to_non_nullable
              as BiometricType,
    ));
  }
}

/// @nodoc

class _$_PassedState extends _PassedState {
  const _$_PassedState(
      {required this.loginWithFaceId,
      required this.timeout,
      required this.pushMessages,
      required this.biometricType})
      : super._();

  @override
  final bool loginWithFaceId;
  @override
  final LockTimeout timeout;
  @override
  final bool pushMessages;
  @override
  final BiometricType biometricType;

  @override
  String toString() {
    return 'SecurityState.passed(loginWithFaceId: $loginWithFaceId, timeout: $timeout, pushMessages: $pushMessages, biometricType: $biometricType)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PassedState &&
            (identical(other.loginWithFaceId, loginWithFaceId) ||
                other.loginWithFaceId == loginWithFaceId) &&
            (identical(other.timeout, timeout) || other.timeout == timeout) &&
            (identical(other.pushMessages, pushMessages) ||
                other.pushMessages == pushMessages) &&
            (identical(other.biometricType, biometricType) ||
                other.biometricType == biometricType));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, loginWithFaceId, timeout, pushMessages, biometricType);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PassedStateCopyWith<_$_PassedState> get copyWith =>
      __$$_PassedStateCopyWithImpl<_$_PassedState>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(bool loginWithFaceId, LockTimeout timeout,
            bool pushMessages, bool isLocked, BiometricType biometricType)
        initialized,
    required TResult Function(bool loginWithFaceId, LockTimeout timeout,
            bool pushMessages, BiometricType biometricType)
        enabledBiometrics,
    required TResult Function(bool loginWithFaceId, LockTimeout timeout,
            bool pushMessages, BiometricType biometricType)
        passed,
    required TResult Function(bool loginWithFaceId, LockTimeout timeout,
            bool pushMessages, BiometricType biometricType)
        failed,
  }) {
    return passed(loginWithFaceId, timeout, pushMessages, biometricType);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(bool loginWithFaceId, LockTimeout timeout,
            bool pushMessages, bool isLocked, BiometricType biometricType)?
        initialized,
    TResult? Function(bool loginWithFaceId, LockTimeout timeout,
            bool pushMessages, BiometricType biometricType)?
        enabledBiometrics,
    TResult? Function(bool loginWithFaceId, LockTimeout timeout,
            bool pushMessages, BiometricType biometricType)?
        passed,
    TResult? Function(bool loginWithFaceId, LockTimeout timeout,
            bool pushMessages, BiometricType biometricType)?
        failed,
  }) {
    return passed?.call(loginWithFaceId, timeout, pushMessages, biometricType);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(bool loginWithFaceId, LockTimeout timeout,
            bool pushMessages, bool isLocked, BiometricType biometricType)?
        initialized,
    TResult Function(bool loginWithFaceId, LockTimeout timeout,
            bool pushMessages, BiometricType biometricType)?
        enabledBiometrics,
    TResult Function(bool loginWithFaceId, LockTimeout timeout,
            bool pushMessages, BiometricType biometricType)?
        passed,
    TResult Function(bool loginWithFaceId, LockTimeout timeout,
            bool pushMessages, BiometricType biometricType)?
        failed,
    required TResult orElse(),
  }) {
    if (passed != null) {
      return passed(loginWithFaceId, timeout, pushMessages, biometricType);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitialState value) initial,
    required TResult Function(_InitializedState value) initialized,
    required TResult Function(_EnabledBiometricsState value) enabledBiometrics,
    required TResult Function(_PassedState value) passed,
    required TResult Function(_FailedState value) failed,
  }) {
    return passed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InitialState value)? initial,
    TResult? Function(_InitializedState value)? initialized,
    TResult? Function(_EnabledBiometricsState value)? enabledBiometrics,
    TResult? Function(_PassedState value)? passed,
    TResult? Function(_FailedState value)? failed,
  }) {
    return passed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitialState value)? initial,
    TResult Function(_InitializedState value)? initialized,
    TResult Function(_EnabledBiometricsState value)? enabledBiometrics,
    TResult Function(_PassedState value)? passed,
    TResult Function(_FailedState value)? failed,
    required TResult orElse(),
  }) {
    if (passed != null) {
      return passed(this);
    }
    return orElse();
  }
}

abstract class _PassedState extends SecurityState {
  const factory _PassedState(
      {required final bool loginWithFaceId,
      required final LockTimeout timeout,
      required final bool pushMessages,
      required final BiometricType biometricType}) = _$_PassedState;
  const _PassedState._() : super._();

  bool get loginWithFaceId;
  LockTimeout get timeout;
  bool get pushMessages;
  BiometricType get biometricType;
  @JsonKey(ignore: true)
  _$$_PassedStateCopyWith<_$_PassedState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_FailedStateCopyWith<$Res> {
  factory _$$_FailedStateCopyWith(
          _$_FailedState value, $Res Function(_$_FailedState) then) =
      __$$_FailedStateCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {bool loginWithFaceId,
      LockTimeout timeout,
      bool pushMessages,
      BiometricType biometricType});
}

/// @nodoc
class __$$_FailedStateCopyWithImpl<$Res>
    extends _$SecurityStateCopyWithImpl<$Res, _$_FailedState>
    implements _$$_FailedStateCopyWith<$Res> {
  __$$_FailedStateCopyWithImpl(
      _$_FailedState _value, $Res Function(_$_FailedState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loginWithFaceId = null,
    Object? timeout = null,
    Object? pushMessages = null,
    Object? biometricType = null,
  }) {
    return _then(_$_FailedState(
      loginWithFaceId: null == loginWithFaceId
          ? _value.loginWithFaceId
          : loginWithFaceId // ignore: cast_nullable_to_non_nullable
              as bool,
      timeout: null == timeout
          ? _value.timeout
          : timeout // ignore: cast_nullable_to_non_nullable
              as LockTimeout,
      pushMessages: null == pushMessages
          ? _value.pushMessages
          : pushMessages // ignore: cast_nullable_to_non_nullable
              as bool,
      biometricType: null == biometricType
          ? _value.biometricType
          : biometricType // ignore: cast_nullable_to_non_nullable
              as BiometricType,
    ));
  }
}

/// @nodoc

class _$_FailedState extends _FailedState {
  const _$_FailedState(
      {required this.loginWithFaceId,
      required this.timeout,
      required this.pushMessages,
      required this.biometricType})
      : super._();

  @override
  final bool loginWithFaceId;
  @override
  final LockTimeout timeout;
  @override
  final bool pushMessages;
  @override
  final BiometricType biometricType;

  @override
  String toString() {
    return 'SecurityState.failed(loginWithFaceId: $loginWithFaceId, timeout: $timeout, pushMessages: $pushMessages, biometricType: $biometricType)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FailedState &&
            (identical(other.loginWithFaceId, loginWithFaceId) ||
                other.loginWithFaceId == loginWithFaceId) &&
            (identical(other.timeout, timeout) || other.timeout == timeout) &&
            (identical(other.pushMessages, pushMessages) ||
                other.pushMessages == pushMessages) &&
            (identical(other.biometricType, biometricType) ||
                other.biometricType == biometricType));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, loginWithFaceId, timeout, pushMessages, biometricType);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FailedStateCopyWith<_$_FailedState> get copyWith =>
      __$$_FailedStateCopyWithImpl<_$_FailedState>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(bool loginWithFaceId, LockTimeout timeout,
            bool pushMessages, bool isLocked, BiometricType biometricType)
        initialized,
    required TResult Function(bool loginWithFaceId, LockTimeout timeout,
            bool pushMessages, BiometricType biometricType)
        enabledBiometrics,
    required TResult Function(bool loginWithFaceId, LockTimeout timeout,
            bool pushMessages, BiometricType biometricType)
        passed,
    required TResult Function(bool loginWithFaceId, LockTimeout timeout,
            bool pushMessages, BiometricType biometricType)
        failed,
  }) {
    return failed(loginWithFaceId, timeout, pushMessages, biometricType);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(bool loginWithFaceId, LockTimeout timeout,
            bool pushMessages, bool isLocked, BiometricType biometricType)?
        initialized,
    TResult? Function(bool loginWithFaceId, LockTimeout timeout,
            bool pushMessages, BiometricType biometricType)?
        enabledBiometrics,
    TResult? Function(bool loginWithFaceId, LockTimeout timeout,
            bool pushMessages, BiometricType biometricType)?
        passed,
    TResult? Function(bool loginWithFaceId, LockTimeout timeout,
            bool pushMessages, BiometricType biometricType)?
        failed,
  }) {
    return failed?.call(loginWithFaceId, timeout, pushMessages, biometricType);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(bool loginWithFaceId, LockTimeout timeout,
            bool pushMessages, bool isLocked, BiometricType biometricType)?
        initialized,
    TResult Function(bool loginWithFaceId, LockTimeout timeout,
            bool pushMessages, BiometricType biometricType)?
        enabledBiometrics,
    TResult Function(bool loginWithFaceId, LockTimeout timeout,
            bool pushMessages, BiometricType biometricType)?
        passed,
    TResult Function(bool loginWithFaceId, LockTimeout timeout,
            bool pushMessages, BiometricType biometricType)?
        failed,
    required TResult orElse(),
  }) {
    if (failed != null) {
      return failed(loginWithFaceId, timeout, pushMessages, biometricType);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitialState value) initial,
    required TResult Function(_InitializedState value) initialized,
    required TResult Function(_EnabledBiometricsState value) enabledBiometrics,
    required TResult Function(_PassedState value) passed,
    required TResult Function(_FailedState value) failed,
  }) {
    return failed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InitialState value)? initial,
    TResult? Function(_InitializedState value)? initialized,
    TResult? Function(_EnabledBiometricsState value)? enabledBiometrics,
    TResult? Function(_PassedState value)? passed,
    TResult? Function(_FailedState value)? failed,
  }) {
    return failed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitialState value)? initial,
    TResult Function(_InitializedState value)? initialized,
    TResult Function(_EnabledBiometricsState value)? enabledBiometrics,
    TResult Function(_PassedState value)? passed,
    TResult Function(_FailedState value)? failed,
    required TResult orElse(),
  }) {
    if (failed != null) {
      return failed(this);
    }
    return orElse();
  }
}

abstract class _FailedState extends SecurityState {
  const factory _FailedState(
      {required final bool loginWithFaceId,
      required final LockTimeout timeout,
      required final bool pushMessages,
      required final BiometricType biometricType}) = _$_FailedState;
  const _FailedState._() : super._();

  bool get loginWithFaceId;
  LockTimeout get timeout;
  bool get pushMessages;
  BiometricType get biometricType;
  @JsonKey(ignore: true)
  _$$_FailedStateCopyWith<_$_FailedState> get copyWith =>
      throw _privateConstructorUsedError;
}

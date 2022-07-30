// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'app_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AppEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(Languages language) changeLanguage,
    required TResult Function() onConnected,
    required TResult Function() onDisConnected,
    required TResult Function(String payload) onNotification,
    required TResult Function(String error) onNotificationError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(Languages language)? changeLanguage,
    TResult Function()? onConnected,
    TResult Function()? onDisConnected,
    TResult Function(String payload)? onNotification,
    TResult Function(String error)? onNotificationError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(Languages language)? changeLanguage,
    TResult Function()? onConnected,
    TResult Function()? onDisConnected,
    TResult Function(String payload)? onNotification,
    TResult Function(String error)? onNotificationError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_ChangeLanguage value) changeLanguage,
    required TResult Function(_OnConnected value) onConnected,
    required TResult Function(_OnDisConnected value) onDisConnected,
    required TResult Function(_OnNotification value) onNotification,
    required TResult Function(_OnNotificationError value) onNotificationError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_ChangeLanguage value)? changeLanguage,
    TResult Function(_OnConnected value)? onConnected,
    TResult Function(_OnDisConnected value)? onDisConnected,
    TResult Function(_OnNotification value)? onNotification,
    TResult Function(_OnNotificationError value)? onNotificationError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_ChangeLanguage value)? changeLanguage,
    TResult Function(_OnConnected value)? onConnected,
    TResult Function(_OnDisConnected value)? onDisConnected,
    TResult Function(_OnNotification value)? onNotification,
    TResult Function(_OnNotificationError value)? onNotificationError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppEventCopyWith<$Res> {
  factory $AppEventCopyWith(AppEvent value, $Res Function(AppEvent) then) =
      _$AppEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$AppEventCopyWithImpl<$Res> implements $AppEventCopyWith<$Res> {
  _$AppEventCopyWithImpl(this._value, this._then);

  final AppEvent _value;
  // ignore: unused_field
  final $Res Function(AppEvent) _then;
}

/// @nodoc
abstract class _$$_StartedCopyWith<$Res> {
  factory _$$_StartedCopyWith(
          _$_Started value, $Res Function(_$_Started) then) =
      __$$_StartedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_StartedCopyWithImpl<$Res> extends _$AppEventCopyWithImpl<$Res>
    implements _$$_StartedCopyWith<$Res> {
  __$$_StartedCopyWithImpl(_$_Started _value, $Res Function(_$_Started) _then)
      : super(_value, (v) => _then(v as _$_Started));

  @override
  _$_Started get _value => super._value as _$_Started;
}

/// @nodoc

class _$_Started with DiagnosticableTreeMixin implements _Started {
  const _$_Started();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AppEvent.started()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'AppEvent.started'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Started);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(Languages language) changeLanguage,
    required TResult Function() onConnected,
    required TResult Function() onDisConnected,
    required TResult Function(String payload) onNotification,
    required TResult Function(String error) onNotificationError,
  }) {
    return started();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(Languages language)? changeLanguage,
    TResult Function()? onConnected,
    TResult Function()? onDisConnected,
    TResult Function(String payload)? onNotification,
    TResult Function(String error)? onNotificationError,
  }) {
    return started?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(Languages language)? changeLanguage,
    TResult Function()? onConnected,
    TResult Function()? onDisConnected,
    TResult Function(String payload)? onNotification,
    TResult Function(String error)? onNotificationError,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_ChangeLanguage value) changeLanguage,
    required TResult Function(_OnConnected value) onConnected,
    required TResult Function(_OnDisConnected value) onDisConnected,
    required TResult Function(_OnNotification value) onNotification,
    required TResult Function(_OnNotificationError value) onNotificationError,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_ChangeLanguage value)? changeLanguage,
    TResult Function(_OnConnected value)? onConnected,
    TResult Function(_OnDisConnected value)? onDisConnected,
    TResult Function(_OnNotification value)? onNotification,
    TResult Function(_OnNotificationError value)? onNotificationError,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_ChangeLanguage value)? changeLanguage,
    TResult Function(_OnConnected value)? onConnected,
    TResult Function(_OnDisConnected value)? onDisConnected,
    TResult Function(_OnNotification value)? onNotification,
    TResult Function(_OnNotificationError value)? onNotificationError,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class _Started implements AppEvent {
  const factory _Started() = _$_Started;
}

/// @nodoc
abstract class _$$_ChangeLanguageCopyWith<$Res> {
  factory _$$_ChangeLanguageCopyWith(
          _$_ChangeLanguage value, $Res Function(_$_ChangeLanguage) then) =
      __$$_ChangeLanguageCopyWithImpl<$Res>;
  $Res call({Languages language});
}

/// @nodoc
class __$$_ChangeLanguageCopyWithImpl<$Res> extends _$AppEventCopyWithImpl<$Res>
    implements _$$_ChangeLanguageCopyWith<$Res> {
  __$$_ChangeLanguageCopyWithImpl(
      _$_ChangeLanguage _value, $Res Function(_$_ChangeLanguage) _then)
      : super(_value, (v) => _then(v as _$_ChangeLanguage));

  @override
  _$_ChangeLanguage get _value => super._value as _$_ChangeLanguage;

  @override
  $Res call({
    Object? language = freezed,
  }) {
    return _then(_$_ChangeLanguage(
      language == freezed
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as Languages,
    ));
  }
}

/// @nodoc

class _$_ChangeLanguage
    with DiagnosticableTreeMixin
    implements _ChangeLanguage {
  const _$_ChangeLanguage(this.language);

  @override
  final Languages language;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AppEvent.changeLanguage(language: $language)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AppEvent.changeLanguage'))
      ..add(DiagnosticsProperty('language', language));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ChangeLanguage &&
            const DeepCollectionEquality().equals(other.language, language));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(language));

  @JsonKey(ignore: true)
  @override
  _$$_ChangeLanguageCopyWith<_$_ChangeLanguage> get copyWith =>
      __$$_ChangeLanguageCopyWithImpl<_$_ChangeLanguage>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(Languages language) changeLanguage,
    required TResult Function() onConnected,
    required TResult Function() onDisConnected,
    required TResult Function(String payload) onNotification,
    required TResult Function(String error) onNotificationError,
  }) {
    return changeLanguage(language);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(Languages language)? changeLanguage,
    TResult Function()? onConnected,
    TResult Function()? onDisConnected,
    TResult Function(String payload)? onNotification,
    TResult Function(String error)? onNotificationError,
  }) {
    return changeLanguage?.call(language);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(Languages language)? changeLanguage,
    TResult Function()? onConnected,
    TResult Function()? onDisConnected,
    TResult Function(String payload)? onNotification,
    TResult Function(String error)? onNotificationError,
    required TResult orElse(),
  }) {
    if (changeLanguage != null) {
      return changeLanguage(language);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_ChangeLanguage value) changeLanguage,
    required TResult Function(_OnConnected value) onConnected,
    required TResult Function(_OnDisConnected value) onDisConnected,
    required TResult Function(_OnNotification value) onNotification,
    required TResult Function(_OnNotificationError value) onNotificationError,
  }) {
    return changeLanguage(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_ChangeLanguage value)? changeLanguage,
    TResult Function(_OnConnected value)? onConnected,
    TResult Function(_OnDisConnected value)? onDisConnected,
    TResult Function(_OnNotification value)? onNotification,
    TResult Function(_OnNotificationError value)? onNotificationError,
  }) {
    return changeLanguage?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_ChangeLanguage value)? changeLanguage,
    TResult Function(_OnConnected value)? onConnected,
    TResult Function(_OnDisConnected value)? onDisConnected,
    TResult Function(_OnNotification value)? onNotification,
    TResult Function(_OnNotificationError value)? onNotificationError,
    required TResult orElse(),
  }) {
    if (changeLanguage != null) {
      return changeLanguage(this);
    }
    return orElse();
  }
}

abstract class _ChangeLanguage implements AppEvent {
  const factory _ChangeLanguage(final Languages language) = _$_ChangeLanguage;

  Languages get language => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$$_ChangeLanguageCopyWith<_$_ChangeLanguage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_OnConnectedCopyWith<$Res> {
  factory _$$_OnConnectedCopyWith(
          _$_OnConnected value, $Res Function(_$_OnConnected) then) =
      __$$_OnConnectedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_OnConnectedCopyWithImpl<$Res> extends _$AppEventCopyWithImpl<$Res>
    implements _$$_OnConnectedCopyWith<$Res> {
  __$$_OnConnectedCopyWithImpl(
      _$_OnConnected _value, $Res Function(_$_OnConnected) _then)
      : super(_value, (v) => _then(v as _$_OnConnected));

  @override
  _$_OnConnected get _value => super._value as _$_OnConnected;
}

/// @nodoc

class _$_OnConnected with DiagnosticableTreeMixin implements _OnConnected {
  const _$_OnConnected();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AppEvent.onConnected()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'AppEvent.onConnected'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_OnConnected);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(Languages language) changeLanguage,
    required TResult Function() onConnected,
    required TResult Function() onDisConnected,
    required TResult Function(String payload) onNotification,
    required TResult Function(String error) onNotificationError,
  }) {
    return onConnected();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(Languages language)? changeLanguage,
    TResult Function()? onConnected,
    TResult Function()? onDisConnected,
    TResult Function(String payload)? onNotification,
    TResult Function(String error)? onNotificationError,
  }) {
    return onConnected?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(Languages language)? changeLanguage,
    TResult Function()? onConnected,
    TResult Function()? onDisConnected,
    TResult Function(String payload)? onNotification,
    TResult Function(String error)? onNotificationError,
    required TResult orElse(),
  }) {
    if (onConnected != null) {
      return onConnected();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_ChangeLanguage value) changeLanguage,
    required TResult Function(_OnConnected value) onConnected,
    required TResult Function(_OnDisConnected value) onDisConnected,
    required TResult Function(_OnNotification value) onNotification,
    required TResult Function(_OnNotificationError value) onNotificationError,
  }) {
    return onConnected(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_ChangeLanguage value)? changeLanguage,
    TResult Function(_OnConnected value)? onConnected,
    TResult Function(_OnDisConnected value)? onDisConnected,
    TResult Function(_OnNotification value)? onNotification,
    TResult Function(_OnNotificationError value)? onNotificationError,
  }) {
    return onConnected?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_ChangeLanguage value)? changeLanguage,
    TResult Function(_OnConnected value)? onConnected,
    TResult Function(_OnDisConnected value)? onDisConnected,
    TResult Function(_OnNotification value)? onNotification,
    TResult Function(_OnNotificationError value)? onNotificationError,
    required TResult orElse(),
  }) {
    if (onConnected != null) {
      return onConnected(this);
    }
    return orElse();
  }
}

abstract class _OnConnected implements AppEvent {
  const factory _OnConnected() = _$_OnConnected;
}

/// @nodoc
abstract class _$$_OnDisConnectedCopyWith<$Res> {
  factory _$$_OnDisConnectedCopyWith(
          _$_OnDisConnected value, $Res Function(_$_OnDisConnected) then) =
      __$$_OnDisConnectedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_OnDisConnectedCopyWithImpl<$Res> extends _$AppEventCopyWithImpl<$Res>
    implements _$$_OnDisConnectedCopyWith<$Res> {
  __$$_OnDisConnectedCopyWithImpl(
      _$_OnDisConnected _value, $Res Function(_$_OnDisConnected) _then)
      : super(_value, (v) => _then(v as _$_OnDisConnected));

  @override
  _$_OnDisConnected get _value => super._value as _$_OnDisConnected;
}

/// @nodoc

class _$_OnDisConnected
    with DiagnosticableTreeMixin
    implements _OnDisConnected {
  const _$_OnDisConnected();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AppEvent.onDisConnected()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'AppEvent.onDisConnected'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_OnDisConnected);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(Languages language) changeLanguage,
    required TResult Function() onConnected,
    required TResult Function() onDisConnected,
    required TResult Function(String payload) onNotification,
    required TResult Function(String error) onNotificationError,
  }) {
    return onDisConnected();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(Languages language)? changeLanguage,
    TResult Function()? onConnected,
    TResult Function()? onDisConnected,
    TResult Function(String payload)? onNotification,
    TResult Function(String error)? onNotificationError,
  }) {
    return onDisConnected?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(Languages language)? changeLanguage,
    TResult Function()? onConnected,
    TResult Function()? onDisConnected,
    TResult Function(String payload)? onNotification,
    TResult Function(String error)? onNotificationError,
    required TResult orElse(),
  }) {
    if (onDisConnected != null) {
      return onDisConnected();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_ChangeLanguage value) changeLanguage,
    required TResult Function(_OnConnected value) onConnected,
    required TResult Function(_OnDisConnected value) onDisConnected,
    required TResult Function(_OnNotification value) onNotification,
    required TResult Function(_OnNotificationError value) onNotificationError,
  }) {
    return onDisConnected(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_ChangeLanguage value)? changeLanguage,
    TResult Function(_OnConnected value)? onConnected,
    TResult Function(_OnDisConnected value)? onDisConnected,
    TResult Function(_OnNotification value)? onNotification,
    TResult Function(_OnNotificationError value)? onNotificationError,
  }) {
    return onDisConnected?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_ChangeLanguage value)? changeLanguage,
    TResult Function(_OnConnected value)? onConnected,
    TResult Function(_OnDisConnected value)? onDisConnected,
    TResult Function(_OnNotification value)? onNotification,
    TResult Function(_OnNotificationError value)? onNotificationError,
    required TResult orElse(),
  }) {
    if (onDisConnected != null) {
      return onDisConnected(this);
    }
    return orElse();
  }
}

abstract class _OnDisConnected implements AppEvent {
  const factory _OnDisConnected() = _$_OnDisConnected;
}

/// @nodoc
abstract class _$$_OnNotificationCopyWith<$Res> {
  factory _$$_OnNotificationCopyWith(
          _$_OnNotification value, $Res Function(_$_OnNotification) then) =
      __$$_OnNotificationCopyWithImpl<$Res>;
  $Res call({String payload});
}

/// @nodoc
class __$$_OnNotificationCopyWithImpl<$Res> extends _$AppEventCopyWithImpl<$Res>
    implements _$$_OnNotificationCopyWith<$Res> {
  __$$_OnNotificationCopyWithImpl(
      _$_OnNotification _value, $Res Function(_$_OnNotification) _then)
      : super(_value, (v) => _then(v as _$_OnNotification));

  @override
  _$_OnNotification get _value => super._value as _$_OnNotification;

  @override
  $Res call({
    Object? payload = freezed,
  }) {
    return _then(_$_OnNotification(
      payload == freezed
          ? _value.payload
          : payload // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_OnNotification
    with DiagnosticableTreeMixin
    implements _OnNotification {
  const _$_OnNotification(this.payload);

  @override
  final String payload;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AppEvent.onNotification(payload: $payload)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AppEvent.onNotification'))
      ..add(DiagnosticsProperty('payload', payload));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_OnNotification &&
            const DeepCollectionEquality().equals(other.payload, payload));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(payload));

  @JsonKey(ignore: true)
  @override
  _$$_OnNotificationCopyWith<_$_OnNotification> get copyWith =>
      __$$_OnNotificationCopyWithImpl<_$_OnNotification>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(Languages language) changeLanguage,
    required TResult Function() onConnected,
    required TResult Function() onDisConnected,
    required TResult Function(String payload) onNotification,
    required TResult Function(String error) onNotificationError,
  }) {
    return onNotification(payload);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(Languages language)? changeLanguage,
    TResult Function()? onConnected,
    TResult Function()? onDisConnected,
    TResult Function(String payload)? onNotification,
    TResult Function(String error)? onNotificationError,
  }) {
    return onNotification?.call(payload);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(Languages language)? changeLanguage,
    TResult Function()? onConnected,
    TResult Function()? onDisConnected,
    TResult Function(String payload)? onNotification,
    TResult Function(String error)? onNotificationError,
    required TResult orElse(),
  }) {
    if (onNotification != null) {
      return onNotification(payload);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_ChangeLanguage value) changeLanguage,
    required TResult Function(_OnConnected value) onConnected,
    required TResult Function(_OnDisConnected value) onDisConnected,
    required TResult Function(_OnNotification value) onNotification,
    required TResult Function(_OnNotificationError value) onNotificationError,
  }) {
    return onNotification(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_ChangeLanguage value)? changeLanguage,
    TResult Function(_OnConnected value)? onConnected,
    TResult Function(_OnDisConnected value)? onDisConnected,
    TResult Function(_OnNotification value)? onNotification,
    TResult Function(_OnNotificationError value)? onNotificationError,
  }) {
    return onNotification?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_ChangeLanguage value)? changeLanguage,
    TResult Function(_OnConnected value)? onConnected,
    TResult Function(_OnDisConnected value)? onDisConnected,
    TResult Function(_OnNotification value)? onNotification,
    TResult Function(_OnNotificationError value)? onNotificationError,
    required TResult orElse(),
  }) {
    if (onNotification != null) {
      return onNotification(this);
    }
    return orElse();
  }
}

abstract class _OnNotification implements AppEvent {
  const factory _OnNotification(final String payload) = _$_OnNotification;

  String get payload => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$$_OnNotificationCopyWith<_$_OnNotification> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_OnNotificationErrorCopyWith<$Res> {
  factory _$$_OnNotificationErrorCopyWith(_$_OnNotificationError value,
          $Res Function(_$_OnNotificationError) then) =
      __$$_OnNotificationErrorCopyWithImpl<$Res>;
  $Res call({String error});
}

/// @nodoc
class __$$_OnNotificationErrorCopyWithImpl<$Res>
    extends _$AppEventCopyWithImpl<$Res>
    implements _$$_OnNotificationErrorCopyWith<$Res> {
  __$$_OnNotificationErrorCopyWithImpl(_$_OnNotificationError _value,
      $Res Function(_$_OnNotificationError) _then)
      : super(_value, (v) => _then(v as _$_OnNotificationError));

  @override
  _$_OnNotificationError get _value => super._value as _$_OnNotificationError;

  @override
  $Res call({
    Object? error = freezed,
  }) {
    return _then(_$_OnNotificationError(
      error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_OnNotificationError
    with DiagnosticableTreeMixin
    implements _OnNotificationError {
  const _$_OnNotificationError(this.error);

  @override
  final String error;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AppEvent.onNotificationError(error: $error)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AppEvent.onNotificationError'))
      ..add(DiagnosticsProperty('error', error));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_OnNotificationError &&
            const DeepCollectionEquality().equals(other.error, error));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(error));

  @JsonKey(ignore: true)
  @override
  _$$_OnNotificationErrorCopyWith<_$_OnNotificationError> get copyWith =>
      __$$_OnNotificationErrorCopyWithImpl<_$_OnNotificationError>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(Languages language) changeLanguage,
    required TResult Function() onConnected,
    required TResult Function() onDisConnected,
    required TResult Function(String payload) onNotification,
    required TResult Function(String error) onNotificationError,
  }) {
    return onNotificationError(error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(Languages language)? changeLanguage,
    TResult Function()? onConnected,
    TResult Function()? onDisConnected,
    TResult Function(String payload)? onNotification,
    TResult Function(String error)? onNotificationError,
  }) {
    return onNotificationError?.call(error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(Languages language)? changeLanguage,
    TResult Function()? onConnected,
    TResult Function()? onDisConnected,
    TResult Function(String payload)? onNotification,
    TResult Function(String error)? onNotificationError,
    required TResult orElse(),
  }) {
    if (onNotificationError != null) {
      return onNotificationError(error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_ChangeLanguage value) changeLanguage,
    required TResult Function(_OnConnected value) onConnected,
    required TResult Function(_OnDisConnected value) onDisConnected,
    required TResult Function(_OnNotification value) onNotification,
    required TResult Function(_OnNotificationError value) onNotificationError,
  }) {
    return onNotificationError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_ChangeLanguage value)? changeLanguage,
    TResult Function(_OnConnected value)? onConnected,
    TResult Function(_OnDisConnected value)? onDisConnected,
    TResult Function(_OnNotification value)? onNotification,
    TResult Function(_OnNotificationError value)? onNotificationError,
  }) {
    return onNotificationError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_ChangeLanguage value)? changeLanguage,
    TResult Function(_OnConnected value)? onConnected,
    TResult Function(_OnDisConnected value)? onDisConnected,
    TResult Function(_OnNotification value)? onNotification,
    TResult Function(_OnNotificationError value)? onNotificationError,
    required TResult orElse(),
  }) {
    if (onNotificationError != null) {
      return onNotificationError(this);
    }
    return orElse();
  }
}

abstract class _OnNotificationError implements AppEvent {
  const factory _OnNotificationError(final String error) =
      _$_OnNotificationError;

  String get error => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$$_OnNotificationErrorCopyWith<_$_OnNotificationError> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$AppState {
  Languages? get language => throw _privateConstructorUsedError;
  dynamic get theme => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AppStateCopyWith<AppState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppStateCopyWith<$Res> {
  factory $AppStateCopyWith(AppState value, $Res Function(AppState) then) =
      _$AppStateCopyWithImpl<$Res>;
  $Res call({Languages? language, dynamic theme});
}

/// @nodoc
class _$AppStateCopyWithImpl<$Res> implements $AppStateCopyWith<$Res> {
  _$AppStateCopyWithImpl(this._value, this._then);

  final AppState _value;
  // ignore: unused_field
  final $Res Function(AppState) _then;

  @override
  $Res call({
    Object? language = freezed,
    Object? theme = freezed,
  }) {
    return _then(_value.copyWith(
      language: language == freezed
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as Languages?,
      theme: theme == freezed
          ? _value.theme
          : theme // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc
abstract class _$$_InitialCopyWith<$Res> implements $AppStateCopyWith<$Res> {
  factory _$$_InitialCopyWith(
          _$_Initial value, $Res Function(_$_Initial) then) =
      __$$_InitialCopyWithImpl<$Res>;
  @override
  $Res call({Languages? language, dynamic theme});
}

/// @nodoc
class __$$_InitialCopyWithImpl<$Res> extends _$AppStateCopyWithImpl<$Res>
    implements _$$_InitialCopyWith<$Res> {
  __$$_InitialCopyWithImpl(_$_Initial _value, $Res Function(_$_Initial) _then)
      : super(_value, (v) => _then(v as _$_Initial));

  @override
  _$_Initial get _value => super._value as _$_Initial;

  @override
  $Res call({
    Object? language = freezed,
    Object? theme = freezed,
  }) {
    return _then(_$_Initial(
      language: language == freezed
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as Languages?,
      theme: theme == freezed ? _value.theme : theme,
    ));
  }
}

/// @nodoc

class _$_Initial with DiagnosticableTreeMixin implements _Initial {
  const _$_Initial({this.language = null, this.theme = Theme});

  @override
  @JsonKey()
  final Languages? language;
  @override
  @JsonKey()
  final dynamic theme;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AppState(language: $language, theme: $theme)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AppState'))
      ..add(DiagnosticsProperty('language', language))
      ..add(DiagnosticsProperty('theme', theme));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Initial &&
            const DeepCollectionEquality().equals(other.language, language) &&
            const DeepCollectionEquality().equals(other.theme, theme));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(language),
      const DeepCollectionEquality().hash(theme));

  @JsonKey(ignore: true)
  @override
  _$$_InitialCopyWith<_$_Initial> get copyWith =>
      __$$_InitialCopyWithImpl<_$_Initial>(this, _$identity);
}

abstract class _Initial implements AppState {
  const factory _Initial({final Languages? language, final dynamic theme}) =
      _$_Initial;

  @override
  Languages? get language => throw _privateConstructorUsedError;
  @override
  dynamic get theme => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_InitialCopyWith<_$_Initial> get copyWith =>
      throw _privateConstructorUsedError;
}

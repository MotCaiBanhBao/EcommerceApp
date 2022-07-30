// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'otp_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$OtpEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String hash) started,
    required TResult Function(String otp) verifyOTP,
    required TResult Function(String hash) resendOTP,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String hash)? started,
    TResult Function(String otp)? verifyOTP,
    TResult Function(String hash)? resendOTP,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String hash)? started,
    TResult Function(String otp)? verifyOTP,
    TResult Function(String hash)? resendOTP,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_VerifyOTP value) verifyOTP,
    required TResult Function(_ResendOTP value) resendOTP,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_VerifyOTP value)? verifyOTP,
    TResult Function(_ResendOTP value)? resendOTP,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_VerifyOTP value)? verifyOTP,
    TResult Function(_ResendOTP value)? resendOTP,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OtpEventCopyWith<$Res> {
  factory $OtpEventCopyWith(OtpEvent value, $Res Function(OtpEvent) then) =
      _$OtpEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$OtpEventCopyWithImpl<$Res> implements $OtpEventCopyWith<$Res> {
  _$OtpEventCopyWithImpl(this._value, this._then);

  final OtpEvent _value;
  // ignore: unused_field
  final $Res Function(OtpEvent) _then;
}

/// @nodoc
abstract class _$$_StartedCopyWith<$Res> {
  factory _$$_StartedCopyWith(
          _$_Started value, $Res Function(_$_Started) then) =
      __$$_StartedCopyWithImpl<$Res>;
  $Res call({String hash});
}

/// @nodoc
class __$$_StartedCopyWithImpl<$Res> extends _$OtpEventCopyWithImpl<$Res>
    implements _$$_StartedCopyWith<$Res> {
  __$$_StartedCopyWithImpl(_$_Started _value, $Res Function(_$_Started) _then)
      : super(_value, (v) => _then(v as _$_Started));

  @override
  _$_Started get _value => super._value as _$_Started;

  @override
  $Res call({
    Object? hash = freezed,
  }) {
    return _then(_$_Started(
      hash == freezed
          ? _value.hash
          : hash // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_Started with DiagnosticableTreeMixin implements _Started {
  const _$_Started(this.hash);

  @override
  final String hash;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'OtpEvent.started(hash: $hash)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'OtpEvent.started'))
      ..add(DiagnosticsProperty('hash', hash));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Started &&
            const DeepCollectionEquality().equals(other.hash, hash));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(hash));

  @JsonKey(ignore: true)
  @override
  _$$_StartedCopyWith<_$_Started> get copyWith =>
      __$$_StartedCopyWithImpl<_$_Started>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String hash) started,
    required TResult Function(String otp) verifyOTP,
    required TResult Function(String hash) resendOTP,
  }) {
    return started(hash);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String hash)? started,
    TResult Function(String otp)? verifyOTP,
    TResult Function(String hash)? resendOTP,
  }) {
    return started?.call(hash);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String hash)? started,
    TResult Function(String otp)? verifyOTP,
    TResult Function(String hash)? resendOTP,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(hash);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_VerifyOTP value) verifyOTP,
    required TResult Function(_ResendOTP value) resendOTP,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_VerifyOTP value)? verifyOTP,
    TResult Function(_ResendOTP value)? resendOTP,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_VerifyOTP value)? verifyOTP,
    TResult Function(_ResendOTP value)? resendOTP,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class _Started implements OtpEvent {
  const factory _Started(final String hash) = _$_Started;

  String get hash => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$$_StartedCopyWith<_$_Started> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_VerifyOTPCopyWith<$Res> {
  factory _$$_VerifyOTPCopyWith(
          _$_VerifyOTP value, $Res Function(_$_VerifyOTP) then) =
      __$$_VerifyOTPCopyWithImpl<$Res>;
  $Res call({String otp});
}

/// @nodoc
class __$$_VerifyOTPCopyWithImpl<$Res> extends _$OtpEventCopyWithImpl<$Res>
    implements _$$_VerifyOTPCopyWith<$Res> {
  __$$_VerifyOTPCopyWithImpl(
      _$_VerifyOTP _value, $Res Function(_$_VerifyOTP) _then)
      : super(_value, (v) => _then(v as _$_VerifyOTP));

  @override
  _$_VerifyOTP get _value => super._value as _$_VerifyOTP;

  @override
  $Res call({
    Object? otp = freezed,
  }) {
    return _then(_$_VerifyOTP(
      otp == freezed
          ? _value.otp
          : otp // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_VerifyOTP with DiagnosticableTreeMixin implements _VerifyOTP {
  const _$_VerifyOTP(this.otp);

  @override
  final String otp;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'OtpEvent.verifyOTP(otp: $otp)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'OtpEvent.verifyOTP'))
      ..add(DiagnosticsProperty('otp', otp));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_VerifyOTP &&
            const DeepCollectionEquality().equals(other.otp, otp));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(otp));

  @JsonKey(ignore: true)
  @override
  _$$_VerifyOTPCopyWith<_$_VerifyOTP> get copyWith =>
      __$$_VerifyOTPCopyWithImpl<_$_VerifyOTP>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String hash) started,
    required TResult Function(String otp) verifyOTP,
    required TResult Function(String hash) resendOTP,
  }) {
    return verifyOTP(otp);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String hash)? started,
    TResult Function(String otp)? verifyOTP,
    TResult Function(String hash)? resendOTP,
  }) {
    return verifyOTP?.call(otp);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String hash)? started,
    TResult Function(String otp)? verifyOTP,
    TResult Function(String hash)? resendOTP,
    required TResult orElse(),
  }) {
    if (verifyOTP != null) {
      return verifyOTP(otp);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_VerifyOTP value) verifyOTP,
    required TResult Function(_ResendOTP value) resendOTP,
  }) {
    return verifyOTP(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_VerifyOTP value)? verifyOTP,
    TResult Function(_ResendOTP value)? resendOTP,
  }) {
    return verifyOTP?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_VerifyOTP value)? verifyOTP,
    TResult Function(_ResendOTP value)? resendOTP,
    required TResult orElse(),
  }) {
    if (verifyOTP != null) {
      return verifyOTP(this);
    }
    return orElse();
  }
}

abstract class _VerifyOTP implements OtpEvent {
  const factory _VerifyOTP(final String otp) = _$_VerifyOTP;

  String get otp => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$$_VerifyOTPCopyWith<_$_VerifyOTP> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_ResendOTPCopyWith<$Res> {
  factory _$$_ResendOTPCopyWith(
          _$_ResendOTP value, $Res Function(_$_ResendOTP) then) =
      __$$_ResendOTPCopyWithImpl<$Res>;
  $Res call({String hash});
}

/// @nodoc
class __$$_ResendOTPCopyWithImpl<$Res> extends _$OtpEventCopyWithImpl<$Res>
    implements _$$_ResendOTPCopyWith<$Res> {
  __$$_ResendOTPCopyWithImpl(
      _$_ResendOTP _value, $Res Function(_$_ResendOTP) _then)
      : super(_value, (v) => _then(v as _$_ResendOTP));

  @override
  _$_ResendOTP get _value => super._value as _$_ResendOTP;

  @override
  $Res call({
    Object? hash = freezed,
  }) {
    return _then(_$_ResendOTP(
      hash == freezed
          ? _value.hash
          : hash // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_ResendOTP with DiagnosticableTreeMixin implements _ResendOTP {
  const _$_ResendOTP(this.hash);

  @override
  final String hash;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'OtpEvent.resendOTP(hash: $hash)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'OtpEvent.resendOTP'))
      ..add(DiagnosticsProperty('hash', hash));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ResendOTP &&
            const DeepCollectionEquality().equals(other.hash, hash));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(hash));

  @JsonKey(ignore: true)
  @override
  _$$_ResendOTPCopyWith<_$_ResendOTP> get copyWith =>
      __$$_ResendOTPCopyWithImpl<_$_ResendOTP>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String hash) started,
    required TResult Function(String otp) verifyOTP,
    required TResult Function(String hash) resendOTP,
  }) {
    return resendOTP(hash);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String hash)? started,
    TResult Function(String otp)? verifyOTP,
    TResult Function(String hash)? resendOTP,
  }) {
    return resendOTP?.call(hash);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String hash)? started,
    TResult Function(String otp)? verifyOTP,
    TResult Function(String hash)? resendOTP,
    required TResult orElse(),
  }) {
    if (resendOTP != null) {
      return resendOTP(hash);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_VerifyOTP value) verifyOTP,
    required TResult Function(_ResendOTP value) resendOTP,
  }) {
    return resendOTP(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_VerifyOTP value)? verifyOTP,
    TResult Function(_ResendOTP value)? resendOTP,
  }) {
    return resendOTP?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_VerifyOTP value)? verifyOTP,
    TResult Function(_ResendOTP value)? resendOTP,
    required TResult orElse(),
  }) {
    if (resendOTP != null) {
      return resendOTP(this);
    }
    return orElse();
  }
}

abstract class _ResendOTP implements OtpEvent {
  const factory _ResendOTP(final String hash) = _$_ResendOTP;

  String get hash => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$$_ResendOTPCopyWith<_$_ResendOTP> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$OtpState {
  dynamic get response => throw _privateConstructorUsedError;
  dynamic get isLoading => throw _privateConstructorUsedError;
  dynamic get isSuccess => throw _privateConstructorUsedError;
  dynamic get status => throw _privateConstructorUsedError;
  String get otp => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $OtpStateCopyWith<OtpState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OtpStateCopyWith<$Res> {
  factory $OtpStateCopyWith(OtpState value, $Res Function(OtpState) then) =
      _$OtpStateCopyWithImpl<$Res>;
  $Res call(
      {dynamic response,
      dynamic isLoading,
      dynamic isSuccess,
      dynamic status,
      String otp});
}

/// @nodoc
class _$OtpStateCopyWithImpl<$Res> implements $OtpStateCopyWith<$Res> {
  _$OtpStateCopyWithImpl(this._value, this._then);

  final OtpState _value;
  // ignore: unused_field
  final $Res Function(OtpState) _then;

  @override
  $Res call({
    Object? response = freezed,
    Object? isLoading = freezed,
    Object? isSuccess = freezed,
    Object? status = freezed,
    Object? otp = freezed,
  }) {
    return _then(_value.copyWith(
      response: response == freezed
          ? _value.response
          : response // ignore: cast_nullable_to_non_nullable
              as dynamic,
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as dynamic,
      isSuccess: isSuccess == freezed
          ? _value.isSuccess
          : isSuccess // ignore: cast_nullable_to_non_nullable
              as dynamic,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as dynamic,
      otp: otp == freezed
          ? _value.otp
          : otp // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_InitialCopyWith<$Res> implements $OtpStateCopyWith<$Res> {
  factory _$$_InitialCopyWith(
          _$_Initial value, $Res Function(_$_Initial) then) =
      __$$_InitialCopyWithImpl<$Res>;
  @override
  $Res call(
      {dynamic response,
      dynamic isLoading,
      dynamic isSuccess,
      dynamic status,
      String otp});
}

/// @nodoc
class __$$_InitialCopyWithImpl<$Res> extends _$OtpStateCopyWithImpl<$Res>
    implements _$$_InitialCopyWith<$Res> {
  __$$_InitialCopyWithImpl(_$_Initial _value, $Res Function(_$_Initial) _then)
      : super(_value, (v) => _then(v as _$_Initial));

  @override
  _$_Initial get _value => super._value as _$_Initial;

  @override
  $Res call({
    Object? response = freezed,
    Object? isLoading = freezed,
    Object? isSuccess = freezed,
    Object? status = freezed,
    Object? otp = freezed,
  }) {
    return _then(_$_Initial(
      response: response == freezed ? _value.response : response,
      isLoading: isLoading == freezed ? _value.isLoading : isLoading,
      isSuccess: isSuccess == freezed ? _value.isSuccess : isSuccess,
      status: status == freezed ? _value.status : status,
      otp: otp == freezed
          ? _value.otp
          : otp // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_Initial with DiagnosticableTreeMixin implements _Initial {
  const _$_Initial(
      {this.response = '',
      this.isLoading = false,
      this.isSuccess = false,
      this.status = OtpStatus.initial,
      this.otp = ''});

  @override
  @JsonKey()
  final dynamic response;
  @override
  @JsonKey()
  final dynamic isLoading;
  @override
  @JsonKey()
  final dynamic isSuccess;
  @override
  @JsonKey()
  final dynamic status;
  @override
  @JsonKey()
  final String otp;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'OtpState(response: $response, isLoading: $isLoading, isSuccess: $isSuccess, status: $status, otp: $otp)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'OtpState'))
      ..add(DiagnosticsProperty('response', response))
      ..add(DiagnosticsProperty('isLoading', isLoading))
      ..add(DiagnosticsProperty('isSuccess', isSuccess))
      ..add(DiagnosticsProperty('status', status))
      ..add(DiagnosticsProperty('otp', otp));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Initial &&
            const DeepCollectionEquality().equals(other.response, response) &&
            const DeepCollectionEquality().equals(other.isLoading, isLoading) &&
            const DeepCollectionEquality().equals(other.isSuccess, isSuccess) &&
            const DeepCollectionEquality().equals(other.status, status) &&
            const DeepCollectionEquality().equals(other.otp, otp));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(response),
      const DeepCollectionEquality().hash(isLoading),
      const DeepCollectionEquality().hash(isSuccess),
      const DeepCollectionEquality().hash(status),
      const DeepCollectionEquality().hash(otp));

  @JsonKey(ignore: true)
  @override
  _$$_InitialCopyWith<_$_Initial> get copyWith =>
      __$$_InitialCopyWithImpl<_$_Initial>(this, _$identity);
}

abstract class _Initial implements OtpState {
  const factory _Initial(
      {final dynamic response,
      final dynamic isLoading,
      final dynamic isSuccess,
      final dynamic status,
      final String otp}) = _$_Initial;

  @override
  dynamic get response => throw _privateConstructorUsedError;
  @override
  dynamic get isLoading => throw _privateConstructorUsedError;
  @override
  dynamic get isSuccess => throw _privateConstructorUsedError;
  @override
  dynamic get status => throw _privateConstructorUsedError;
  @override
  String get otp => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_InitialCopyWith<_$_Initial> get copyWith =>
      throw _privateConstructorUsedError;
}

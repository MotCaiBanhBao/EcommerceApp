// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'check_out_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CheckOutEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(CartModel currentCart) started,
    required TResult Function(String address) onAddAddress,
    required TResult Function(String phoneNumber) onAddPhoneNumber,
    required TResult Function() autoLocation,
    required TResult Function() checkOut,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(CartModel currentCart)? started,
    TResult Function(String address)? onAddAddress,
    TResult Function(String phoneNumber)? onAddPhoneNumber,
    TResult Function()? autoLocation,
    TResult Function()? checkOut,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(CartModel currentCart)? started,
    TResult Function(String address)? onAddAddress,
    TResult Function(String phoneNumber)? onAddPhoneNumber,
    TResult Function()? autoLocation,
    TResult Function()? checkOut,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_OnAddAddress value) onAddAddress,
    required TResult Function(_OnAddPhoneNumber value) onAddPhoneNumber,
    required TResult Function(_AutoLocation value) autoLocation,
    required TResult Function(_CheckOut value) checkOut,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_OnAddAddress value)? onAddAddress,
    TResult Function(_OnAddPhoneNumber value)? onAddPhoneNumber,
    TResult Function(_AutoLocation value)? autoLocation,
    TResult Function(_CheckOut value)? checkOut,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_OnAddAddress value)? onAddAddress,
    TResult Function(_OnAddPhoneNumber value)? onAddPhoneNumber,
    TResult Function(_AutoLocation value)? autoLocation,
    TResult Function(_CheckOut value)? checkOut,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CheckOutEventCopyWith<$Res> {
  factory $CheckOutEventCopyWith(
          CheckOutEvent value, $Res Function(CheckOutEvent) then) =
      _$CheckOutEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$CheckOutEventCopyWithImpl<$Res>
    implements $CheckOutEventCopyWith<$Res> {
  _$CheckOutEventCopyWithImpl(this._value, this._then);

  final CheckOutEvent _value;
  // ignore: unused_field
  final $Res Function(CheckOutEvent) _then;
}

/// @nodoc
abstract class _$$_StartedCopyWith<$Res> {
  factory _$$_StartedCopyWith(
          _$_Started value, $Res Function(_$_Started) then) =
      __$$_StartedCopyWithImpl<$Res>;
  $Res call({CartModel currentCart});
}

/// @nodoc
class __$$_StartedCopyWithImpl<$Res> extends _$CheckOutEventCopyWithImpl<$Res>
    implements _$$_StartedCopyWith<$Res> {
  __$$_StartedCopyWithImpl(_$_Started _value, $Res Function(_$_Started) _then)
      : super(_value, (v) => _then(v as _$_Started));

  @override
  _$_Started get _value => super._value as _$_Started;

  @override
  $Res call({
    Object? currentCart = freezed,
  }) {
    return _then(_$_Started(
      currentCart == freezed
          ? _value.currentCart
          : currentCart // ignore: cast_nullable_to_non_nullable
              as CartModel,
    ));
  }
}

/// @nodoc

class _$_Started implements _Started {
  const _$_Started(this.currentCart);

  @override
  final CartModel currentCart;

  @override
  String toString() {
    return 'CheckOutEvent.started(currentCart: $currentCart)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Started &&
            const DeepCollectionEquality()
                .equals(other.currentCart, currentCart));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(currentCart));

  @JsonKey(ignore: true)
  @override
  _$$_StartedCopyWith<_$_Started> get copyWith =>
      __$$_StartedCopyWithImpl<_$_Started>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(CartModel currentCart) started,
    required TResult Function(String address) onAddAddress,
    required TResult Function(String phoneNumber) onAddPhoneNumber,
    required TResult Function() autoLocation,
    required TResult Function() checkOut,
  }) {
    return started(currentCart);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(CartModel currentCart)? started,
    TResult Function(String address)? onAddAddress,
    TResult Function(String phoneNumber)? onAddPhoneNumber,
    TResult Function()? autoLocation,
    TResult Function()? checkOut,
  }) {
    return started?.call(currentCart);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(CartModel currentCart)? started,
    TResult Function(String address)? onAddAddress,
    TResult Function(String phoneNumber)? onAddPhoneNumber,
    TResult Function()? autoLocation,
    TResult Function()? checkOut,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(currentCart);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_OnAddAddress value) onAddAddress,
    required TResult Function(_OnAddPhoneNumber value) onAddPhoneNumber,
    required TResult Function(_AutoLocation value) autoLocation,
    required TResult Function(_CheckOut value) checkOut,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_OnAddAddress value)? onAddAddress,
    TResult Function(_OnAddPhoneNumber value)? onAddPhoneNumber,
    TResult Function(_AutoLocation value)? autoLocation,
    TResult Function(_CheckOut value)? checkOut,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_OnAddAddress value)? onAddAddress,
    TResult Function(_OnAddPhoneNumber value)? onAddPhoneNumber,
    TResult Function(_AutoLocation value)? autoLocation,
    TResult Function(_CheckOut value)? checkOut,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class _Started implements CheckOutEvent {
  const factory _Started(final CartModel currentCart) = _$_Started;

  CartModel get currentCart => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$$_StartedCopyWith<_$_Started> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_OnAddAddressCopyWith<$Res> {
  factory _$$_OnAddAddressCopyWith(
          _$_OnAddAddress value, $Res Function(_$_OnAddAddress) then) =
      __$$_OnAddAddressCopyWithImpl<$Res>;
  $Res call({String address});
}

/// @nodoc
class __$$_OnAddAddressCopyWithImpl<$Res>
    extends _$CheckOutEventCopyWithImpl<$Res>
    implements _$$_OnAddAddressCopyWith<$Res> {
  __$$_OnAddAddressCopyWithImpl(
      _$_OnAddAddress _value, $Res Function(_$_OnAddAddress) _then)
      : super(_value, (v) => _then(v as _$_OnAddAddress));

  @override
  _$_OnAddAddress get _value => super._value as _$_OnAddAddress;

  @override
  $Res call({
    Object? address = freezed,
  }) {
    return _then(_$_OnAddAddress(
      address == freezed
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_OnAddAddress implements _OnAddAddress {
  const _$_OnAddAddress(this.address);

  @override
  final String address;

  @override
  String toString() {
    return 'CheckOutEvent.onAddAddress(address: $address)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_OnAddAddress &&
            const DeepCollectionEquality().equals(other.address, address));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(address));

  @JsonKey(ignore: true)
  @override
  _$$_OnAddAddressCopyWith<_$_OnAddAddress> get copyWith =>
      __$$_OnAddAddressCopyWithImpl<_$_OnAddAddress>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(CartModel currentCart) started,
    required TResult Function(String address) onAddAddress,
    required TResult Function(String phoneNumber) onAddPhoneNumber,
    required TResult Function() autoLocation,
    required TResult Function() checkOut,
  }) {
    return onAddAddress(address);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(CartModel currentCart)? started,
    TResult Function(String address)? onAddAddress,
    TResult Function(String phoneNumber)? onAddPhoneNumber,
    TResult Function()? autoLocation,
    TResult Function()? checkOut,
  }) {
    return onAddAddress?.call(address);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(CartModel currentCart)? started,
    TResult Function(String address)? onAddAddress,
    TResult Function(String phoneNumber)? onAddPhoneNumber,
    TResult Function()? autoLocation,
    TResult Function()? checkOut,
    required TResult orElse(),
  }) {
    if (onAddAddress != null) {
      return onAddAddress(address);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_OnAddAddress value) onAddAddress,
    required TResult Function(_OnAddPhoneNumber value) onAddPhoneNumber,
    required TResult Function(_AutoLocation value) autoLocation,
    required TResult Function(_CheckOut value) checkOut,
  }) {
    return onAddAddress(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_OnAddAddress value)? onAddAddress,
    TResult Function(_OnAddPhoneNumber value)? onAddPhoneNumber,
    TResult Function(_AutoLocation value)? autoLocation,
    TResult Function(_CheckOut value)? checkOut,
  }) {
    return onAddAddress?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_OnAddAddress value)? onAddAddress,
    TResult Function(_OnAddPhoneNumber value)? onAddPhoneNumber,
    TResult Function(_AutoLocation value)? autoLocation,
    TResult Function(_CheckOut value)? checkOut,
    required TResult orElse(),
  }) {
    if (onAddAddress != null) {
      return onAddAddress(this);
    }
    return orElse();
  }
}

abstract class _OnAddAddress implements CheckOutEvent {
  const factory _OnAddAddress(final String address) = _$_OnAddAddress;

  String get address => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$$_OnAddAddressCopyWith<_$_OnAddAddress> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_OnAddPhoneNumberCopyWith<$Res> {
  factory _$$_OnAddPhoneNumberCopyWith(
          _$_OnAddPhoneNumber value, $Res Function(_$_OnAddPhoneNumber) then) =
      __$$_OnAddPhoneNumberCopyWithImpl<$Res>;
  $Res call({String phoneNumber});
}

/// @nodoc
class __$$_OnAddPhoneNumberCopyWithImpl<$Res>
    extends _$CheckOutEventCopyWithImpl<$Res>
    implements _$$_OnAddPhoneNumberCopyWith<$Res> {
  __$$_OnAddPhoneNumberCopyWithImpl(
      _$_OnAddPhoneNumber _value, $Res Function(_$_OnAddPhoneNumber) _then)
      : super(_value, (v) => _then(v as _$_OnAddPhoneNumber));

  @override
  _$_OnAddPhoneNumber get _value => super._value as _$_OnAddPhoneNumber;

  @override
  $Res call({
    Object? phoneNumber = freezed,
  }) {
    return _then(_$_OnAddPhoneNumber(
      phoneNumber == freezed
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_OnAddPhoneNumber implements _OnAddPhoneNumber {
  const _$_OnAddPhoneNumber(this.phoneNumber);

  @override
  final String phoneNumber;

  @override
  String toString() {
    return 'CheckOutEvent.onAddPhoneNumber(phoneNumber: $phoneNumber)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_OnAddPhoneNumber &&
            const DeepCollectionEquality()
                .equals(other.phoneNumber, phoneNumber));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(phoneNumber));

  @JsonKey(ignore: true)
  @override
  _$$_OnAddPhoneNumberCopyWith<_$_OnAddPhoneNumber> get copyWith =>
      __$$_OnAddPhoneNumberCopyWithImpl<_$_OnAddPhoneNumber>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(CartModel currentCart) started,
    required TResult Function(String address) onAddAddress,
    required TResult Function(String phoneNumber) onAddPhoneNumber,
    required TResult Function() autoLocation,
    required TResult Function() checkOut,
  }) {
    return onAddPhoneNumber(phoneNumber);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(CartModel currentCart)? started,
    TResult Function(String address)? onAddAddress,
    TResult Function(String phoneNumber)? onAddPhoneNumber,
    TResult Function()? autoLocation,
    TResult Function()? checkOut,
  }) {
    return onAddPhoneNumber?.call(phoneNumber);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(CartModel currentCart)? started,
    TResult Function(String address)? onAddAddress,
    TResult Function(String phoneNumber)? onAddPhoneNumber,
    TResult Function()? autoLocation,
    TResult Function()? checkOut,
    required TResult orElse(),
  }) {
    if (onAddPhoneNumber != null) {
      return onAddPhoneNumber(phoneNumber);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_OnAddAddress value) onAddAddress,
    required TResult Function(_OnAddPhoneNumber value) onAddPhoneNumber,
    required TResult Function(_AutoLocation value) autoLocation,
    required TResult Function(_CheckOut value) checkOut,
  }) {
    return onAddPhoneNumber(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_OnAddAddress value)? onAddAddress,
    TResult Function(_OnAddPhoneNumber value)? onAddPhoneNumber,
    TResult Function(_AutoLocation value)? autoLocation,
    TResult Function(_CheckOut value)? checkOut,
  }) {
    return onAddPhoneNumber?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_OnAddAddress value)? onAddAddress,
    TResult Function(_OnAddPhoneNumber value)? onAddPhoneNumber,
    TResult Function(_AutoLocation value)? autoLocation,
    TResult Function(_CheckOut value)? checkOut,
    required TResult orElse(),
  }) {
    if (onAddPhoneNumber != null) {
      return onAddPhoneNumber(this);
    }
    return orElse();
  }
}

abstract class _OnAddPhoneNumber implements CheckOutEvent {
  const factory _OnAddPhoneNumber(final String phoneNumber) =
      _$_OnAddPhoneNumber;

  String get phoneNumber => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$$_OnAddPhoneNumberCopyWith<_$_OnAddPhoneNumber> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_AutoLocationCopyWith<$Res> {
  factory _$$_AutoLocationCopyWith(
          _$_AutoLocation value, $Res Function(_$_AutoLocation) then) =
      __$$_AutoLocationCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_AutoLocationCopyWithImpl<$Res>
    extends _$CheckOutEventCopyWithImpl<$Res>
    implements _$$_AutoLocationCopyWith<$Res> {
  __$$_AutoLocationCopyWithImpl(
      _$_AutoLocation _value, $Res Function(_$_AutoLocation) _then)
      : super(_value, (v) => _then(v as _$_AutoLocation));

  @override
  _$_AutoLocation get _value => super._value as _$_AutoLocation;
}

/// @nodoc

class _$_AutoLocation implements _AutoLocation {
  const _$_AutoLocation();

  @override
  String toString() {
    return 'CheckOutEvent.autoLocation()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_AutoLocation);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(CartModel currentCart) started,
    required TResult Function(String address) onAddAddress,
    required TResult Function(String phoneNumber) onAddPhoneNumber,
    required TResult Function() autoLocation,
    required TResult Function() checkOut,
  }) {
    return autoLocation();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(CartModel currentCart)? started,
    TResult Function(String address)? onAddAddress,
    TResult Function(String phoneNumber)? onAddPhoneNumber,
    TResult Function()? autoLocation,
    TResult Function()? checkOut,
  }) {
    return autoLocation?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(CartModel currentCart)? started,
    TResult Function(String address)? onAddAddress,
    TResult Function(String phoneNumber)? onAddPhoneNumber,
    TResult Function()? autoLocation,
    TResult Function()? checkOut,
    required TResult orElse(),
  }) {
    if (autoLocation != null) {
      return autoLocation();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_OnAddAddress value) onAddAddress,
    required TResult Function(_OnAddPhoneNumber value) onAddPhoneNumber,
    required TResult Function(_AutoLocation value) autoLocation,
    required TResult Function(_CheckOut value) checkOut,
  }) {
    return autoLocation(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_OnAddAddress value)? onAddAddress,
    TResult Function(_OnAddPhoneNumber value)? onAddPhoneNumber,
    TResult Function(_AutoLocation value)? autoLocation,
    TResult Function(_CheckOut value)? checkOut,
  }) {
    return autoLocation?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_OnAddAddress value)? onAddAddress,
    TResult Function(_OnAddPhoneNumber value)? onAddPhoneNumber,
    TResult Function(_AutoLocation value)? autoLocation,
    TResult Function(_CheckOut value)? checkOut,
    required TResult orElse(),
  }) {
    if (autoLocation != null) {
      return autoLocation(this);
    }
    return orElse();
  }
}

abstract class _AutoLocation implements CheckOutEvent {
  const factory _AutoLocation() = _$_AutoLocation;
}

/// @nodoc
abstract class _$$_CheckOutCopyWith<$Res> {
  factory _$$_CheckOutCopyWith(
          _$_CheckOut value, $Res Function(_$_CheckOut) then) =
      __$$_CheckOutCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_CheckOutCopyWithImpl<$Res> extends _$CheckOutEventCopyWithImpl<$Res>
    implements _$$_CheckOutCopyWith<$Res> {
  __$$_CheckOutCopyWithImpl(
      _$_CheckOut _value, $Res Function(_$_CheckOut) _then)
      : super(_value, (v) => _then(v as _$_CheckOut));

  @override
  _$_CheckOut get _value => super._value as _$_CheckOut;
}

/// @nodoc

class _$_CheckOut implements _CheckOut {
  const _$_CheckOut();

  @override
  String toString() {
    return 'CheckOutEvent.checkOut()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_CheckOut);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(CartModel currentCart) started,
    required TResult Function(String address) onAddAddress,
    required TResult Function(String phoneNumber) onAddPhoneNumber,
    required TResult Function() autoLocation,
    required TResult Function() checkOut,
  }) {
    return checkOut();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(CartModel currentCart)? started,
    TResult Function(String address)? onAddAddress,
    TResult Function(String phoneNumber)? onAddPhoneNumber,
    TResult Function()? autoLocation,
    TResult Function()? checkOut,
  }) {
    return checkOut?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(CartModel currentCart)? started,
    TResult Function(String address)? onAddAddress,
    TResult Function(String phoneNumber)? onAddPhoneNumber,
    TResult Function()? autoLocation,
    TResult Function()? checkOut,
    required TResult orElse(),
  }) {
    if (checkOut != null) {
      return checkOut();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_OnAddAddress value) onAddAddress,
    required TResult Function(_OnAddPhoneNumber value) onAddPhoneNumber,
    required TResult Function(_AutoLocation value) autoLocation,
    required TResult Function(_CheckOut value) checkOut,
  }) {
    return checkOut(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_OnAddAddress value)? onAddAddress,
    TResult Function(_OnAddPhoneNumber value)? onAddPhoneNumber,
    TResult Function(_AutoLocation value)? autoLocation,
    TResult Function(_CheckOut value)? checkOut,
  }) {
    return checkOut?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_OnAddAddress value)? onAddAddress,
    TResult Function(_OnAddPhoneNumber value)? onAddPhoneNumber,
    TResult Function(_AutoLocation value)? autoLocation,
    TResult Function(_CheckOut value)? checkOut,
    required TResult orElse(),
  }) {
    if (checkOut != null) {
      return checkOut(this);
    }
    return orElse();
  }
}

abstract class _CheckOut implements CheckOutEvent {
  const factory _CheckOut() = _$_CheckOut;
}

/// @nodoc
mixin _$CheckOutState {
  CheckOutModel? get order => throw _privateConstructorUsedError;
  CheckOutStatus get status => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CheckOutStateCopyWith<CheckOutState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CheckOutStateCopyWith<$Res> {
  factory $CheckOutStateCopyWith(
          CheckOutState value, $Res Function(CheckOutState) then) =
      _$CheckOutStateCopyWithImpl<$Res>;
  $Res call({CheckOutModel? order, CheckOutStatus status});
}

/// @nodoc
class _$CheckOutStateCopyWithImpl<$Res>
    implements $CheckOutStateCopyWith<$Res> {
  _$CheckOutStateCopyWithImpl(this._value, this._then);

  final CheckOutState _value;
  // ignore: unused_field
  final $Res Function(CheckOutState) _then;

  @override
  $Res call({
    Object? order = freezed,
    Object? status = freezed,
  }) {
    return _then(_value.copyWith(
      order: order == freezed
          ? _value.order
          : order // ignore: cast_nullable_to_non_nullable
              as CheckOutModel?,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as CheckOutStatus,
    ));
  }
}

/// @nodoc
abstract class _$$_InitialCopyWith<$Res>
    implements $CheckOutStateCopyWith<$Res> {
  factory _$$_InitialCopyWith(
          _$_Initial value, $Res Function(_$_Initial) then) =
      __$$_InitialCopyWithImpl<$Res>;
  @override
  $Res call({CheckOutModel? order, CheckOutStatus status});
}

/// @nodoc
class __$$_InitialCopyWithImpl<$Res> extends _$CheckOutStateCopyWithImpl<$Res>
    implements _$$_InitialCopyWith<$Res> {
  __$$_InitialCopyWithImpl(_$_Initial _value, $Res Function(_$_Initial) _then)
      : super(_value, (v) => _then(v as _$_Initial));

  @override
  _$_Initial get _value => super._value as _$_Initial;

  @override
  $Res call({
    Object? order = freezed,
    Object? status = freezed,
  }) {
    return _then(_$_Initial(
      order: order == freezed
          ? _value.order
          : order // ignore: cast_nullable_to_non_nullable
              as CheckOutModel?,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as CheckOutStatus,
    ));
  }
}

/// @nodoc

class _$_Initial implements _Initial {
  const _$_Initial({this.order = null, this.status = CheckOutStatus.none});

  @override
  @JsonKey()
  final CheckOutModel? order;
  @override
  @JsonKey()
  final CheckOutStatus status;

  @override
  String toString() {
    return 'CheckOutState(order: $order, status: $status)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Initial &&
            const DeepCollectionEquality().equals(other.order, order) &&
            const DeepCollectionEquality().equals(other.status, status));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(order),
      const DeepCollectionEquality().hash(status));

  @JsonKey(ignore: true)
  @override
  _$$_InitialCopyWith<_$_Initial> get copyWith =>
      __$$_InitialCopyWithImpl<_$_Initial>(this, _$identity);
}

abstract class _Initial implements CheckOutState {
  const factory _Initial(
      {final CheckOutModel? order, final CheckOutStatus status}) = _$_Initial;

  @override
  CheckOutModel? get order => throw _privateConstructorUsedError;
  @override
  CheckOutStatus get status => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_InitialCopyWith<_$_Initial> get copyWith =>
      throw _privateConstructorUsedError;
}

// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'order_detail_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$OrderDetailEvent {
  String get orderID => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String orderID) started,
    required TResult Function(String orderID, String message) cancelOrder,
    required TResult Function(String orderID) confirmOrder,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String orderID)? started,
    TResult Function(String orderID, String message)? cancelOrder,
    TResult Function(String orderID)? confirmOrder,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String orderID)? started,
    TResult Function(String orderID, String message)? cancelOrder,
    TResult Function(String orderID)? confirmOrder,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_CancelOrder value) cancelOrder,
    required TResult Function(_ConfirmOrder value) confirmOrder,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_CancelOrder value)? cancelOrder,
    TResult Function(_ConfirmOrder value)? confirmOrder,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_CancelOrder value)? cancelOrder,
    TResult Function(_ConfirmOrder value)? confirmOrder,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $OrderDetailEventCopyWith<OrderDetailEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderDetailEventCopyWith<$Res> {
  factory $OrderDetailEventCopyWith(
          OrderDetailEvent value, $Res Function(OrderDetailEvent) then) =
      _$OrderDetailEventCopyWithImpl<$Res>;
  $Res call({String orderID});
}

/// @nodoc
class _$OrderDetailEventCopyWithImpl<$Res>
    implements $OrderDetailEventCopyWith<$Res> {
  _$OrderDetailEventCopyWithImpl(this._value, this._then);

  final OrderDetailEvent _value;
  // ignore: unused_field
  final $Res Function(OrderDetailEvent) _then;

  @override
  $Res call({
    Object? orderID = freezed,
  }) {
    return _then(_value.copyWith(
      orderID: orderID == freezed
          ? _value.orderID
          : orderID // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_StartedCopyWith<$Res>
    implements $OrderDetailEventCopyWith<$Res> {
  factory _$$_StartedCopyWith(
          _$_Started value, $Res Function(_$_Started) then) =
      __$$_StartedCopyWithImpl<$Res>;
  @override
  $Res call({String orderID});
}

/// @nodoc
class __$$_StartedCopyWithImpl<$Res>
    extends _$OrderDetailEventCopyWithImpl<$Res>
    implements _$$_StartedCopyWith<$Res> {
  __$$_StartedCopyWithImpl(_$_Started _value, $Res Function(_$_Started) _then)
      : super(_value, (v) => _then(v as _$_Started));

  @override
  _$_Started get _value => super._value as _$_Started;

  @override
  $Res call({
    Object? orderID = freezed,
  }) {
    return _then(_$_Started(
      orderID == freezed
          ? _value.orderID
          : orderID // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_Started implements _Started {
  const _$_Started(this.orderID);

  @override
  final String orderID;

  @override
  String toString() {
    return 'OrderDetailEvent.started(orderID: $orderID)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Started &&
            const DeepCollectionEquality().equals(other.orderID, orderID));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(orderID));

  @JsonKey(ignore: true)
  @override
  _$$_StartedCopyWith<_$_Started> get copyWith =>
      __$$_StartedCopyWithImpl<_$_Started>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String orderID) started,
    required TResult Function(String orderID, String message) cancelOrder,
    required TResult Function(String orderID) confirmOrder,
  }) {
    return started(orderID);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String orderID)? started,
    TResult Function(String orderID, String message)? cancelOrder,
    TResult Function(String orderID)? confirmOrder,
  }) {
    return started?.call(orderID);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String orderID)? started,
    TResult Function(String orderID, String message)? cancelOrder,
    TResult Function(String orderID)? confirmOrder,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(orderID);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_CancelOrder value) cancelOrder,
    required TResult Function(_ConfirmOrder value) confirmOrder,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_CancelOrder value)? cancelOrder,
    TResult Function(_ConfirmOrder value)? confirmOrder,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_CancelOrder value)? cancelOrder,
    TResult Function(_ConfirmOrder value)? confirmOrder,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class _Started implements OrderDetailEvent {
  const factory _Started(final String orderID) = _$_Started;

  @override
  String get orderID => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_StartedCopyWith<_$_Started> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_CancelOrderCopyWith<$Res>
    implements $OrderDetailEventCopyWith<$Res> {
  factory _$$_CancelOrderCopyWith(
          _$_CancelOrder value, $Res Function(_$_CancelOrder) then) =
      __$$_CancelOrderCopyWithImpl<$Res>;
  @override
  $Res call({String orderID, String message});
}

/// @nodoc
class __$$_CancelOrderCopyWithImpl<$Res>
    extends _$OrderDetailEventCopyWithImpl<$Res>
    implements _$$_CancelOrderCopyWith<$Res> {
  __$$_CancelOrderCopyWithImpl(
      _$_CancelOrder _value, $Res Function(_$_CancelOrder) _then)
      : super(_value, (v) => _then(v as _$_CancelOrder));

  @override
  _$_CancelOrder get _value => super._value as _$_CancelOrder;

  @override
  $Res call({
    Object? orderID = freezed,
    Object? message = freezed,
  }) {
    return _then(_$_CancelOrder(
      orderID == freezed
          ? _value.orderID
          : orderID // ignore: cast_nullable_to_non_nullable
              as String,
      message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_CancelOrder implements _CancelOrder {
  const _$_CancelOrder(this.orderID, this.message);

  @override
  final String orderID;
  @override
  final String message;

  @override
  String toString() {
    return 'OrderDetailEvent.cancelOrder(orderID: $orderID, message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CancelOrder &&
            const DeepCollectionEquality().equals(other.orderID, orderID) &&
            const DeepCollectionEquality().equals(other.message, message));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(orderID),
      const DeepCollectionEquality().hash(message));

  @JsonKey(ignore: true)
  @override
  _$$_CancelOrderCopyWith<_$_CancelOrder> get copyWith =>
      __$$_CancelOrderCopyWithImpl<_$_CancelOrder>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String orderID) started,
    required TResult Function(String orderID, String message) cancelOrder,
    required TResult Function(String orderID) confirmOrder,
  }) {
    return cancelOrder(orderID, message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String orderID)? started,
    TResult Function(String orderID, String message)? cancelOrder,
    TResult Function(String orderID)? confirmOrder,
  }) {
    return cancelOrder?.call(orderID, message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String orderID)? started,
    TResult Function(String orderID, String message)? cancelOrder,
    TResult Function(String orderID)? confirmOrder,
    required TResult orElse(),
  }) {
    if (cancelOrder != null) {
      return cancelOrder(orderID, message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_CancelOrder value) cancelOrder,
    required TResult Function(_ConfirmOrder value) confirmOrder,
  }) {
    return cancelOrder(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_CancelOrder value)? cancelOrder,
    TResult Function(_ConfirmOrder value)? confirmOrder,
  }) {
    return cancelOrder?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_CancelOrder value)? cancelOrder,
    TResult Function(_ConfirmOrder value)? confirmOrder,
    required TResult orElse(),
  }) {
    if (cancelOrder != null) {
      return cancelOrder(this);
    }
    return orElse();
  }
}

abstract class _CancelOrder implements OrderDetailEvent {
  const factory _CancelOrder(final String orderID, final String message) =
      _$_CancelOrder;

  @override
  String get orderID => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_CancelOrderCopyWith<_$_CancelOrder> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_ConfirmOrderCopyWith<$Res>
    implements $OrderDetailEventCopyWith<$Res> {
  factory _$$_ConfirmOrderCopyWith(
          _$_ConfirmOrder value, $Res Function(_$_ConfirmOrder) then) =
      __$$_ConfirmOrderCopyWithImpl<$Res>;
  @override
  $Res call({String orderID});
}

/// @nodoc
class __$$_ConfirmOrderCopyWithImpl<$Res>
    extends _$OrderDetailEventCopyWithImpl<$Res>
    implements _$$_ConfirmOrderCopyWith<$Res> {
  __$$_ConfirmOrderCopyWithImpl(
      _$_ConfirmOrder _value, $Res Function(_$_ConfirmOrder) _then)
      : super(_value, (v) => _then(v as _$_ConfirmOrder));

  @override
  _$_ConfirmOrder get _value => super._value as _$_ConfirmOrder;

  @override
  $Res call({
    Object? orderID = freezed,
  }) {
    return _then(_$_ConfirmOrder(
      orderID == freezed
          ? _value.orderID
          : orderID // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_ConfirmOrder implements _ConfirmOrder {
  const _$_ConfirmOrder(this.orderID);

  @override
  final String orderID;

  @override
  String toString() {
    return 'OrderDetailEvent.confirmOrder(orderID: $orderID)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ConfirmOrder &&
            const DeepCollectionEquality().equals(other.orderID, orderID));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(orderID));

  @JsonKey(ignore: true)
  @override
  _$$_ConfirmOrderCopyWith<_$_ConfirmOrder> get copyWith =>
      __$$_ConfirmOrderCopyWithImpl<_$_ConfirmOrder>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String orderID) started,
    required TResult Function(String orderID, String message) cancelOrder,
    required TResult Function(String orderID) confirmOrder,
  }) {
    return confirmOrder(orderID);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String orderID)? started,
    TResult Function(String orderID, String message)? cancelOrder,
    TResult Function(String orderID)? confirmOrder,
  }) {
    return confirmOrder?.call(orderID);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String orderID)? started,
    TResult Function(String orderID, String message)? cancelOrder,
    TResult Function(String orderID)? confirmOrder,
    required TResult orElse(),
  }) {
    if (confirmOrder != null) {
      return confirmOrder(orderID);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_CancelOrder value) cancelOrder,
    required TResult Function(_ConfirmOrder value) confirmOrder,
  }) {
    return confirmOrder(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_CancelOrder value)? cancelOrder,
    TResult Function(_ConfirmOrder value)? confirmOrder,
  }) {
    return confirmOrder?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_CancelOrder value)? cancelOrder,
    TResult Function(_ConfirmOrder value)? confirmOrder,
    required TResult orElse(),
  }) {
    if (confirmOrder != null) {
      return confirmOrder(this);
    }
    return orElse();
  }
}

abstract class _ConfirmOrder implements OrderDetailEvent {
  const factory _ConfirmOrder(final String orderID) = _$_ConfirmOrder;

  @override
  String get orderID => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_ConfirmOrderCopyWith<_$_ConfirmOrder> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$OrderDetailState {
  OrderDetailPageStatus get status => throw _privateConstructorUsedError;
  OrderModel? get order => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $OrderDetailStateCopyWith<OrderDetailState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderDetailStateCopyWith<$Res> {
  factory $OrderDetailStateCopyWith(
          OrderDetailState value, $Res Function(OrderDetailState) then) =
      _$OrderDetailStateCopyWithImpl<$Res>;
  $Res call({OrderDetailPageStatus status, OrderModel? order});
}

/// @nodoc
class _$OrderDetailStateCopyWithImpl<$Res>
    implements $OrderDetailStateCopyWith<$Res> {
  _$OrderDetailStateCopyWithImpl(this._value, this._then);

  final OrderDetailState _value;
  // ignore: unused_field
  final $Res Function(OrderDetailState) _then;

  @override
  $Res call({
    Object? status = freezed,
    Object? order = freezed,
  }) {
    return _then(_value.copyWith(
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as OrderDetailPageStatus,
      order: order == freezed
          ? _value.order
          : order // ignore: cast_nullable_to_non_nullable
              as OrderModel?,
    ));
  }
}

/// @nodoc
abstract class _$$_InitialCopyWith<$Res>
    implements $OrderDetailStateCopyWith<$Res> {
  factory _$$_InitialCopyWith(
          _$_Initial value, $Res Function(_$_Initial) then) =
      __$$_InitialCopyWithImpl<$Res>;
  @override
  $Res call({OrderDetailPageStatus status, OrderModel? order});
}

/// @nodoc
class __$$_InitialCopyWithImpl<$Res>
    extends _$OrderDetailStateCopyWithImpl<$Res>
    implements _$$_InitialCopyWith<$Res> {
  __$$_InitialCopyWithImpl(_$_Initial _value, $Res Function(_$_Initial) _then)
      : super(_value, (v) => _then(v as _$_Initial));

  @override
  _$_Initial get _value => super._value as _$_Initial;

  @override
  $Res call({
    Object? status = freezed,
    Object? order = freezed,
  }) {
    return _then(_$_Initial(
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as OrderDetailPageStatus,
      order: order == freezed
          ? _value.order
          : order // ignore: cast_nullable_to_non_nullable
              as OrderModel?,
    ));
  }
}

/// @nodoc

class _$_Initial implements _Initial {
  const _$_Initial(
      {this.status = OrderDetailPageStatus.initial, this.order = null});

  @override
  @JsonKey()
  final OrderDetailPageStatus status;
  @override
  @JsonKey()
  final OrderModel? order;

  @override
  String toString() {
    return 'OrderDetailState(status: $status, order: $order)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Initial &&
            const DeepCollectionEquality().equals(other.status, status) &&
            const DeepCollectionEquality().equals(other.order, order));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(status),
      const DeepCollectionEquality().hash(order));

  @JsonKey(ignore: true)
  @override
  _$$_InitialCopyWith<_$_Initial> get copyWith =>
      __$$_InitialCopyWithImpl<_$_Initial>(this, _$identity);
}

abstract class _Initial implements OrderDetailState {
  const factory _Initial(
      {final OrderDetailPageStatus status,
      final OrderModel? order}) = _$_Initial;

  @override
  OrderDetailPageStatus get status => throw _privateConstructorUsedError;
  @override
  OrderModel? get order => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_InitialCopyWith<_$_Initial> get copyWith =>
      throw _privateConstructorUsedError;
}

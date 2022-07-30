// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'cart_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CartEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String id, String publisher) delete,
    required TResult Function(int counter, String id, String publisher)
        updateQuantity,
    required TResult Function(bool isCheck, String id, String publisher)
        updateChoose,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String id, String publisher)? delete,
    TResult Function(int counter, String id, String publisher)? updateQuantity,
    TResult Function(bool isCheck, String id, String publisher)? updateChoose,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String id, String publisher)? delete,
    TResult Function(int counter, String id, String publisher)? updateQuantity,
    TResult Function(bool isCheck, String id, String publisher)? updateChoose,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_Delete value) delete,
    required TResult Function(_UpdateQuantity value) updateQuantity,
    required TResult Function(_UpdateChoose value) updateChoose,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_Delete value)? delete,
    TResult Function(_UpdateQuantity value)? updateQuantity,
    TResult Function(_UpdateChoose value)? updateChoose,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_Delete value)? delete,
    TResult Function(_UpdateQuantity value)? updateQuantity,
    TResult Function(_UpdateChoose value)? updateChoose,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CartEventCopyWith<$Res> {
  factory $CartEventCopyWith(CartEvent value, $Res Function(CartEvent) then) =
      _$CartEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$CartEventCopyWithImpl<$Res> implements $CartEventCopyWith<$Res> {
  _$CartEventCopyWithImpl(this._value, this._then);

  final CartEvent _value;
  // ignore: unused_field
  final $Res Function(CartEvent) _then;
}

/// @nodoc
abstract class _$$_StartedCopyWith<$Res> {
  factory _$$_StartedCopyWith(
          _$_Started value, $Res Function(_$_Started) then) =
      __$$_StartedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_StartedCopyWithImpl<$Res> extends _$CartEventCopyWithImpl<$Res>
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
    return 'CartEvent.started()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'CartEvent.started'));
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
    required TResult Function(String id, String publisher) delete,
    required TResult Function(int counter, String id, String publisher)
        updateQuantity,
    required TResult Function(bool isCheck, String id, String publisher)
        updateChoose,
  }) {
    return started();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String id, String publisher)? delete,
    TResult Function(int counter, String id, String publisher)? updateQuantity,
    TResult Function(bool isCheck, String id, String publisher)? updateChoose,
  }) {
    return started?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String id, String publisher)? delete,
    TResult Function(int counter, String id, String publisher)? updateQuantity,
    TResult Function(bool isCheck, String id, String publisher)? updateChoose,
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
    required TResult Function(_Delete value) delete,
    required TResult Function(_UpdateQuantity value) updateQuantity,
    required TResult Function(_UpdateChoose value) updateChoose,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_Delete value)? delete,
    TResult Function(_UpdateQuantity value)? updateQuantity,
    TResult Function(_UpdateChoose value)? updateChoose,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_Delete value)? delete,
    TResult Function(_UpdateQuantity value)? updateQuantity,
    TResult Function(_UpdateChoose value)? updateChoose,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class _Started implements CartEvent {
  const factory _Started() = _$_Started;
}

/// @nodoc
abstract class _$$_DeleteCopyWith<$Res> {
  factory _$$_DeleteCopyWith(_$_Delete value, $Res Function(_$_Delete) then) =
      __$$_DeleteCopyWithImpl<$Res>;
  $Res call({String id, String publisher});
}

/// @nodoc
class __$$_DeleteCopyWithImpl<$Res> extends _$CartEventCopyWithImpl<$Res>
    implements _$$_DeleteCopyWith<$Res> {
  __$$_DeleteCopyWithImpl(_$_Delete _value, $Res Function(_$_Delete) _then)
      : super(_value, (v) => _then(v as _$_Delete));

  @override
  _$_Delete get _value => super._value as _$_Delete;

  @override
  $Res call({
    Object? id = freezed,
    Object? publisher = freezed,
  }) {
    return _then(_$_Delete(
      id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      publisher == freezed
          ? _value.publisher
          : publisher // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_Delete with DiagnosticableTreeMixin implements _Delete {
  const _$_Delete(this.id, this.publisher);

  @override
  final String id;
  @override
  final String publisher;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CartEvent.delete(id: $id, publisher: $publisher)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'CartEvent.delete'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('publisher', publisher));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Delete &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.publisher, publisher));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(publisher));

  @JsonKey(ignore: true)
  @override
  _$$_DeleteCopyWith<_$_Delete> get copyWith =>
      __$$_DeleteCopyWithImpl<_$_Delete>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String id, String publisher) delete,
    required TResult Function(int counter, String id, String publisher)
        updateQuantity,
    required TResult Function(bool isCheck, String id, String publisher)
        updateChoose,
  }) {
    return delete(id, publisher);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String id, String publisher)? delete,
    TResult Function(int counter, String id, String publisher)? updateQuantity,
    TResult Function(bool isCheck, String id, String publisher)? updateChoose,
  }) {
    return delete?.call(id, publisher);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String id, String publisher)? delete,
    TResult Function(int counter, String id, String publisher)? updateQuantity,
    TResult Function(bool isCheck, String id, String publisher)? updateChoose,
    required TResult orElse(),
  }) {
    if (delete != null) {
      return delete(id, publisher);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_Delete value) delete,
    required TResult Function(_UpdateQuantity value) updateQuantity,
    required TResult Function(_UpdateChoose value) updateChoose,
  }) {
    return delete(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_Delete value)? delete,
    TResult Function(_UpdateQuantity value)? updateQuantity,
    TResult Function(_UpdateChoose value)? updateChoose,
  }) {
    return delete?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_Delete value)? delete,
    TResult Function(_UpdateQuantity value)? updateQuantity,
    TResult Function(_UpdateChoose value)? updateChoose,
    required TResult orElse(),
  }) {
    if (delete != null) {
      return delete(this);
    }
    return orElse();
  }
}

abstract class _Delete implements CartEvent {
  const factory _Delete(final String id, final String publisher) = _$_Delete;

  String get id => throw _privateConstructorUsedError;
  String get publisher => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$$_DeleteCopyWith<_$_Delete> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_UpdateQuantityCopyWith<$Res> {
  factory _$$_UpdateQuantityCopyWith(
          _$_UpdateQuantity value, $Res Function(_$_UpdateQuantity) then) =
      __$$_UpdateQuantityCopyWithImpl<$Res>;
  $Res call({int counter, String id, String publisher});
}

/// @nodoc
class __$$_UpdateQuantityCopyWithImpl<$Res>
    extends _$CartEventCopyWithImpl<$Res>
    implements _$$_UpdateQuantityCopyWith<$Res> {
  __$$_UpdateQuantityCopyWithImpl(
      _$_UpdateQuantity _value, $Res Function(_$_UpdateQuantity) _then)
      : super(_value, (v) => _then(v as _$_UpdateQuantity));

  @override
  _$_UpdateQuantity get _value => super._value as _$_UpdateQuantity;

  @override
  $Res call({
    Object? counter = freezed,
    Object? id = freezed,
    Object? publisher = freezed,
  }) {
    return _then(_$_UpdateQuantity(
      counter == freezed
          ? _value.counter
          : counter // ignore: cast_nullable_to_non_nullable
              as int,
      id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      publisher == freezed
          ? _value.publisher
          : publisher // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_UpdateQuantity
    with DiagnosticableTreeMixin
    implements _UpdateQuantity {
  const _$_UpdateQuantity(this.counter, this.id, this.publisher);

  @override
  final int counter;
  @override
  final String id;
  @override
  final String publisher;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CartEvent.updateQuantity(counter: $counter, id: $id, publisher: $publisher)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'CartEvent.updateQuantity'))
      ..add(DiagnosticsProperty('counter', counter))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('publisher', publisher));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UpdateQuantity &&
            const DeepCollectionEquality().equals(other.counter, counter) &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.publisher, publisher));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(counter),
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(publisher));

  @JsonKey(ignore: true)
  @override
  _$$_UpdateQuantityCopyWith<_$_UpdateQuantity> get copyWith =>
      __$$_UpdateQuantityCopyWithImpl<_$_UpdateQuantity>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String id, String publisher) delete,
    required TResult Function(int counter, String id, String publisher)
        updateQuantity,
    required TResult Function(bool isCheck, String id, String publisher)
        updateChoose,
  }) {
    return updateQuantity(counter, id, publisher);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String id, String publisher)? delete,
    TResult Function(int counter, String id, String publisher)? updateQuantity,
    TResult Function(bool isCheck, String id, String publisher)? updateChoose,
  }) {
    return updateQuantity?.call(counter, id, publisher);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String id, String publisher)? delete,
    TResult Function(int counter, String id, String publisher)? updateQuantity,
    TResult Function(bool isCheck, String id, String publisher)? updateChoose,
    required TResult orElse(),
  }) {
    if (updateQuantity != null) {
      return updateQuantity(counter, id, publisher);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_Delete value) delete,
    required TResult Function(_UpdateQuantity value) updateQuantity,
    required TResult Function(_UpdateChoose value) updateChoose,
  }) {
    return updateQuantity(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_Delete value)? delete,
    TResult Function(_UpdateQuantity value)? updateQuantity,
    TResult Function(_UpdateChoose value)? updateChoose,
  }) {
    return updateQuantity?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_Delete value)? delete,
    TResult Function(_UpdateQuantity value)? updateQuantity,
    TResult Function(_UpdateChoose value)? updateChoose,
    required TResult orElse(),
  }) {
    if (updateQuantity != null) {
      return updateQuantity(this);
    }
    return orElse();
  }
}

abstract class _UpdateQuantity implements CartEvent {
  const factory _UpdateQuantity(
          final int counter, final String id, final String publisher) =
      _$_UpdateQuantity;

  int get counter => throw _privateConstructorUsedError;
  String get id => throw _privateConstructorUsedError;
  String get publisher => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$$_UpdateQuantityCopyWith<_$_UpdateQuantity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_UpdateChooseCopyWith<$Res> {
  factory _$$_UpdateChooseCopyWith(
          _$_UpdateChoose value, $Res Function(_$_UpdateChoose) then) =
      __$$_UpdateChooseCopyWithImpl<$Res>;
  $Res call({bool isCheck, String id, String publisher});
}

/// @nodoc
class __$$_UpdateChooseCopyWithImpl<$Res> extends _$CartEventCopyWithImpl<$Res>
    implements _$$_UpdateChooseCopyWith<$Res> {
  __$$_UpdateChooseCopyWithImpl(
      _$_UpdateChoose _value, $Res Function(_$_UpdateChoose) _then)
      : super(_value, (v) => _then(v as _$_UpdateChoose));

  @override
  _$_UpdateChoose get _value => super._value as _$_UpdateChoose;

  @override
  $Res call({
    Object? isCheck = freezed,
    Object? id = freezed,
    Object? publisher = freezed,
  }) {
    return _then(_$_UpdateChoose(
      isCheck == freezed
          ? _value.isCheck
          : isCheck // ignore: cast_nullable_to_non_nullable
              as bool,
      id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      publisher == freezed
          ? _value.publisher
          : publisher // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_UpdateChoose with DiagnosticableTreeMixin implements _UpdateChoose {
  const _$_UpdateChoose(this.isCheck, this.id, this.publisher);

  @override
  final bool isCheck;
  @override
  final String id;
  @override
  final String publisher;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CartEvent.updateChoose(isCheck: $isCheck, id: $id, publisher: $publisher)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'CartEvent.updateChoose'))
      ..add(DiagnosticsProperty('isCheck', isCheck))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('publisher', publisher));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UpdateChoose &&
            const DeepCollectionEquality().equals(other.isCheck, isCheck) &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.publisher, publisher));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(isCheck),
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(publisher));

  @JsonKey(ignore: true)
  @override
  _$$_UpdateChooseCopyWith<_$_UpdateChoose> get copyWith =>
      __$$_UpdateChooseCopyWithImpl<_$_UpdateChoose>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String id, String publisher) delete,
    required TResult Function(int counter, String id, String publisher)
        updateQuantity,
    required TResult Function(bool isCheck, String id, String publisher)
        updateChoose,
  }) {
    return updateChoose(isCheck, id, publisher);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String id, String publisher)? delete,
    TResult Function(int counter, String id, String publisher)? updateQuantity,
    TResult Function(bool isCheck, String id, String publisher)? updateChoose,
  }) {
    return updateChoose?.call(isCheck, id, publisher);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String id, String publisher)? delete,
    TResult Function(int counter, String id, String publisher)? updateQuantity,
    TResult Function(bool isCheck, String id, String publisher)? updateChoose,
    required TResult orElse(),
  }) {
    if (updateChoose != null) {
      return updateChoose(isCheck, id, publisher);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_Delete value) delete,
    required TResult Function(_UpdateQuantity value) updateQuantity,
    required TResult Function(_UpdateChoose value) updateChoose,
  }) {
    return updateChoose(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_Delete value)? delete,
    TResult Function(_UpdateQuantity value)? updateQuantity,
    TResult Function(_UpdateChoose value)? updateChoose,
  }) {
    return updateChoose?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_Delete value)? delete,
    TResult Function(_UpdateQuantity value)? updateQuantity,
    TResult Function(_UpdateChoose value)? updateChoose,
    required TResult orElse(),
  }) {
    if (updateChoose != null) {
      return updateChoose(this);
    }
    return orElse();
  }
}

abstract class _UpdateChoose implements CartEvent {
  const factory _UpdateChoose(
          final bool isCheck, final String id, final String publisher) =
      _$_UpdateChoose;

  bool get isCheck => throw _privateConstructorUsedError;
  String get id => throw _privateConstructorUsedError;
  String get publisher => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$$_UpdateChooseCopyWith<_$_UpdateChoose> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$CartState {
  CartModel? get cartData => throw _privateConstructorUsedError;
  dynamic get status => throw _privateConstructorUsedError;
  num get totalBill => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CartStateCopyWith<CartState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CartStateCopyWith<$Res> {
  factory $CartStateCopyWith(CartState value, $Res Function(CartState) then) =
      _$CartStateCopyWithImpl<$Res>;
  $Res call({CartModel? cartData, dynamic status, num totalBill});
}

/// @nodoc
class _$CartStateCopyWithImpl<$Res> implements $CartStateCopyWith<$Res> {
  _$CartStateCopyWithImpl(this._value, this._then);

  final CartState _value;
  // ignore: unused_field
  final $Res Function(CartState) _then;

  @override
  $Res call({
    Object? cartData = freezed,
    Object? status = freezed,
    Object? totalBill = freezed,
  }) {
    return _then(_value.copyWith(
      cartData: cartData == freezed
          ? _value.cartData
          : cartData // ignore: cast_nullable_to_non_nullable
              as CartModel?,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as dynamic,
      totalBill: totalBill == freezed
          ? _value.totalBill
          : totalBill // ignore: cast_nullable_to_non_nullable
              as num,
    ));
  }
}

/// @nodoc
abstract class _$$_InitialCopyWith<$Res> implements $CartStateCopyWith<$Res> {
  factory _$$_InitialCopyWith(
          _$_Initial value, $Res Function(_$_Initial) then) =
      __$$_InitialCopyWithImpl<$Res>;
  @override
  $Res call({CartModel? cartData, dynamic status, num totalBill});
}

/// @nodoc
class __$$_InitialCopyWithImpl<$Res> extends _$CartStateCopyWithImpl<$Res>
    implements _$$_InitialCopyWith<$Res> {
  __$$_InitialCopyWithImpl(_$_Initial _value, $Res Function(_$_Initial) _then)
      : super(_value, (v) => _then(v as _$_Initial));

  @override
  _$_Initial get _value => super._value as _$_Initial;

  @override
  $Res call({
    Object? cartData = freezed,
    Object? status = freezed,
    Object? totalBill = freezed,
  }) {
    return _then(_$_Initial(
      cartData: cartData == freezed
          ? _value.cartData
          : cartData // ignore: cast_nullable_to_non_nullable
              as CartModel?,
      status: status == freezed ? _value.status : status,
      totalBill: totalBill == freezed
          ? _value.totalBill
          : totalBill // ignore: cast_nullable_to_non_nullable
              as num,
    ));
  }
}

/// @nodoc

class _$_Initial with DiagnosticableTreeMixin implements _Initial {
  const _$_Initial(
      {this.cartData = null,
      this.status = CartStatus.initial,
      this.totalBill = 0});

  @override
  @JsonKey()
  final CartModel? cartData;
  @override
  @JsonKey()
  final dynamic status;
  @override
  @JsonKey()
  final num totalBill;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CartState(cartData: $cartData, status: $status, totalBill: $totalBill)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'CartState'))
      ..add(DiagnosticsProperty('cartData', cartData))
      ..add(DiagnosticsProperty('status', status))
      ..add(DiagnosticsProperty('totalBill', totalBill));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Initial &&
            const DeepCollectionEquality().equals(other.cartData, cartData) &&
            const DeepCollectionEquality().equals(other.status, status) &&
            const DeepCollectionEquality().equals(other.totalBill, totalBill));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(cartData),
      const DeepCollectionEquality().hash(status),
      const DeepCollectionEquality().hash(totalBill));

  @JsonKey(ignore: true)
  @override
  _$$_InitialCopyWith<_$_Initial> get copyWith =>
      __$$_InitialCopyWithImpl<_$_Initial>(this, _$identity);
}

abstract class _Initial implements CartState {
  const factory _Initial(
      {final CartModel? cartData,
      final dynamic status,
      final num totalBill}) = _$_Initial;

  @override
  CartModel? get cartData => throw _privateConstructorUsedError;
  @override
  dynamic get status => throw _privateConstructorUsedError;
  @override
  num get totalBill => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_InitialCopyWith<_$_Initial> get copyWith =>
      throw _privateConstructorUsedError;
}

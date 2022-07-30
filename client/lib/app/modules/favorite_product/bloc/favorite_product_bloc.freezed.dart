// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'favorite_product_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$FavoriteProductEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? started,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Started value)? started,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FavoriteProductEventCopyWith<$Res> {
  factory $FavoriteProductEventCopyWith(FavoriteProductEvent value,
          $Res Function(FavoriteProductEvent) then) =
      _$FavoriteProductEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$FavoriteProductEventCopyWithImpl<$Res>
    implements $FavoriteProductEventCopyWith<$Res> {
  _$FavoriteProductEventCopyWithImpl(this._value, this._then);

  final FavoriteProductEvent _value;
  // ignore: unused_field
  final $Res Function(FavoriteProductEvent) _then;
}

/// @nodoc
abstract class _$$_StartedCopyWith<$Res> {
  factory _$$_StartedCopyWith(
          _$_Started value, $Res Function(_$_Started) then) =
      __$$_StartedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_StartedCopyWithImpl<$Res>
    extends _$FavoriteProductEventCopyWithImpl<$Res>
    implements _$$_StartedCopyWith<$Res> {
  __$$_StartedCopyWithImpl(_$_Started _value, $Res Function(_$_Started) _then)
      : super(_value, (v) => _then(v as _$_Started));

  @override
  _$_Started get _value => super._value as _$_Started;
}

/// @nodoc

class _$_Started implements _Started {
  const _$_Started();

  @override
  String toString() {
    return 'FavoriteProductEvent.started()';
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
  }) {
    return started();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? started,
  }) {
    return started?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
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
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Started value)? started,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class _Started implements FavoriteProductEvent {
  const factory _Started() = _$_Started;
}

/// @nodoc
mixin _$FavoriteProductState {
  List<ProductModel>? get favoriteProduct => throw _privateConstructorUsedError;
  dynamic get status => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FavoriteProductStateCopyWith<FavoriteProductState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FavoriteProductStateCopyWith<$Res> {
  factory $FavoriteProductStateCopyWith(FavoriteProductState value,
          $Res Function(FavoriteProductState) then) =
      _$FavoriteProductStateCopyWithImpl<$Res>;
  $Res call({List<ProductModel>? favoriteProduct, dynamic status});
}

/// @nodoc
class _$FavoriteProductStateCopyWithImpl<$Res>
    implements $FavoriteProductStateCopyWith<$Res> {
  _$FavoriteProductStateCopyWithImpl(this._value, this._then);

  final FavoriteProductState _value;
  // ignore: unused_field
  final $Res Function(FavoriteProductState) _then;

  @override
  $Res call({
    Object? favoriteProduct = freezed,
    Object? status = freezed,
  }) {
    return _then(_value.copyWith(
      favoriteProduct: favoriteProduct == freezed
          ? _value.favoriteProduct
          : favoriteProduct // ignore: cast_nullable_to_non_nullable
              as List<ProductModel>?,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc
abstract class _$$_InitialCopyWith<$Res>
    implements $FavoriteProductStateCopyWith<$Res> {
  factory _$$_InitialCopyWith(
          _$_Initial value, $Res Function(_$_Initial) then) =
      __$$_InitialCopyWithImpl<$Res>;
  @override
  $Res call({List<ProductModel>? favoriteProduct, dynamic status});
}

/// @nodoc
class __$$_InitialCopyWithImpl<$Res>
    extends _$FavoriteProductStateCopyWithImpl<$Res>
    implements _$$_InitialCopyWith<$Res> {
  __$$_InitialCopyWithImpl(_$_Initial _value, $Res Function(_$_Initial) _then)
      : super(_value, (v) => _then(v as _$_Initial));

  @override
  _$_Initial get _value => super._value as _$_Initial;

  @override
  $Res call({
    Object? favoriteProduct = freezed,
    Object? status = freezed,
  }) {
    return _then(_$_Initial(
      favoriteProduct: favoriteProduct == freezed
          ? _value._favoriteProduct
          : favoriteProduct // ignore: cast_nullable_to_non_nullable
              as List<ProductModel>?,
      status: status == freezed ? _value.status : status,
    ));
  }
}

/// @nodoc

class _$_Initial implements _Initial {
  const _$_Initial(
      {final List<ProductModel>? favoriteProduct = null,
      this.status = FavoriteProductStatus.initial})
      : _favoriteProduct = favoriteProduct;

  final List<ProductModel>? _favoriteProduct;
  @override
  @JsonKey()
  List<ProductModel>? get favoriteProduct {
    final value = _favoriteProduct;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey()
  final dynamic status;

  @override
  String toString() {
    return 'FavoriteProductState(favoriteProduct: $favoriteProduct, status: $status)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Initial &&
            const DeepCollectionEquality()
                .equals(other._favoriteProduct, _favoriteProduct) &&
            const DeepCollectionEquality().equals(other.status, status));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_favoriteProduct),
      const DeepCollectionEquality().hash(status));

  @JsonKey(ignore: true)
  @override
  _$$_InitialCopyWith<_$_Initial> get copyWith =>
      __$$_InitialCopyWithImpl<_$_Initial>(this, _$identity);
}

abstract class _Initial implements FavoriteProductState {
  const factory _Initial(
      {final List<ProductModel>? favoriteProduct,
      final dynamic status}) = _$_Initial;

  @override
  List<ProductModel>? get favoriteProduct => throw _privateConstructorUsedError;
  @override
  dynamic get status => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_InitialCopyWith<_$_Initial> get copyWith =>
      throw _privateConstructorUsedError;
}

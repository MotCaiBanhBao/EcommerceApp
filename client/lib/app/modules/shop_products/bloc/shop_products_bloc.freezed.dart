// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'shop_products_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ShopProductsEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String id) deleteProduct,
    required TResult Function(
            XFile avatar,
            List<XFile> productImage,
            String address,
            String title,
            String description,
            String price,
            String category,
            String variations,
            String stock,
            String shippingDetails)
        addProduct,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String id)? deleteProduct,
    TResult Function(
            XFile avatar,
            List<XFile> productImage,
            String address,
            String title,
            String description,
            String price,
            String category,
            String variations,
            String stock,
            String shippingDetails)?
        addProduct,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String id)? deleteProduct,
    TResult Function(
            XFile avatar,
            List<XFile> productImage,
            String address,
            String title,
            String description,
            String price,
            String category,
            String variations,
            String stock,
            String shippingDetails)?
        addProduct,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_DeleteProduct value) deleteProduct,
    required TResult Function(_AddProduct value) addProduct,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_DeleteProduct value)? deleteProduct,
    TResult Function(_AddProduct value)? addProduct,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_DeleteProduct value)? deleteProduct,
    TResult Function(_AddProduct value)? addProduct,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShopProductsEventCopyWith<$Res> {
  factory $ShopProductsEventCopyWith(
          ShopProductsEvent value, $Res Function(ShopProductsEvent) then) =
      _$ShopProductsEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$ShopProductsEventCopyWithImpl<$Res>
    implements $ShopProductsEventCopyWith<$Res> {
  _$ShopProductsEventCopyWithImpl(this._value, this._then);

  final ShopProductsEvent _value;
  // ignore: unused_field
  final $Res Function(ShopProductsEvent) _then;
}

/// @nodoc
abstract class _$$_StartedCopyWith<$Res> {
  factory _$$_StartedCopyWith(
          _$_Started value, $Res Function(_$_Started) then) =
      __$$_StartedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_StartedCopyWithImpl<$Res>
    extends _$ShopProductsEventCopyWithImpl<$Res>
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
    return 'ShopProductsEvent.started()';
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
    required TResult Function(String id) deleteProduct,
    required TResult Function(
            XFile avatar,
            List<XFile> productImage,
            String address,
            String title,
            String description,
            String price,
            String category,
            String variations,
            String stock,
            String shippingDetails)
        addProduct,
  }) {
    return started();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String id)? deleteProduct,
    TResult Function(
            XFile avatar,
            List<XFile> productImage,
            String address,
            String title,
            String description,
            String price,
            String category,
            String variations,
            String stock,
            String shippingDetails)?
        addProduct,
  }) {
    return started?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String id)? deleteProduct,
    TResult Function(
            XFile avatar,
            List<XFile> productImage,
            String address,
            String title,
            String description,
            String price,
            String category,
            String variations,
            String stock,
            String shippingDetails)?
        addProduct,
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
    required TResult Function(_DeleteProduct value) deleteProduct,
    required TResult Function(_AddProduct value) addProduct,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_DeleteProduct value)? deleteProduct,
    TResult Function(_AddProduct value)? addProduct,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_DeleteProduct value)? deleteProduct,
    TResult Function(_AddProduct value)? addProduct,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class _Started implements ShopProductsEvent {
  const factory _Started() = _$_Started;
}

/// @nodoc
abstract class _$$_DeleteProductCopyWith<$Res> {
  factory _$$_DeleteProductCopyWith(
          _$_DeleteProduct value, $Res Function(_$_DeleteProduct) then) =
      __$$_DeleteProductCopyWithImpl<$Res>;
  $Res call({String id});
}

/// @nodoc
class __$$_DeleteProductCopyWithImpl<$Res>
    extends _$ShopProductsEventCopyWithImpl<$Res>
    implements _$$_DeleteProductCopyWith<$Res> {
  __$$_DeleteProductCopyWithImpl(
      _$_DeleteProduct _value, $Res Function(_$_DeleteProduct) _then)
      : super(_value, (v) => _then(v as _$_DeleteProduct));

  @override
  _$_DeleteProduct get _value => super._value as _$_DeleteProduct;

  @override
  $Res call({
    Object? id = freezed,
  }) {
    return _then(_$_DeleteProduct(
      id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_DeleteProduct implements _DeleteProduct {
  const _$_DeleteProduct(this.id);

  @override
  final String id;

  @override
  String toString() {
    return 'ShopProductsEvent.deleteProduct(id: $id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DeleteProduct &&
            const DeepCollectionEquality().equals(other.id, id));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(id));

  @JsonKey(ignore: true)
  @override
  _$$_DeleteProductCopyWith<_$_DeleteProduct> get copyWith =>
      __$$_DeleteProductCopyWithImpl<_$_DeleteProduct>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String id) deleteProduct,
    required TResult Function(
            XFile avatar,
            List<XFile> productImage,
            String address,
            String title,
            String description,
            String price,
            String category,
            String variations,
            String stock,
            String shippingDetails)
        addProduct,
  }) {
    return deleteProduct(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String id)? deleteProduct,
    TResult Function(
            XFile avatar,
            List<XFile> productImage,
            String address,
            String title,
            String description,
            String price,
            String category,
            String variations,
            String stock,
            String shippingDetails)?
        addProduct,
  }) {
    return deleteProduct?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String id)? deleteProduct,
    TResult Function(
            XFile avatar,
            List<XFile> productImage,
            String address,
            String title,
            String description,
            String price,
            String category,
            String variations,
            String stock,
            String shippingDetails)?
        addProduct,
    required TResult orElse(),
  }) {
    if (deleteProduct != null) {
      return deleteProduct(id);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_DeleteProduct value) deleteProduct,
    required TResult Function(_AddProduct value) addProduct,
  }) {
    return deleteProduct(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_DeleteProduct value)? deleteProduct,
    TResult Function(_AddProduct value)? addProduct,
  }) {
    return deleteProduct?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_DeleteProduct value)? deleteProduct,
    TResult Function(_AddProduct value)? addProduct,
    required TResult orElse(),
  }) {
    if (deleteProduct != null) {
      return deleteProduct(this);
    }
    return orElse();
  }
}

abstract class _DeleteProduct implements ShopProductsEvent {
  const factory _DeleteProduct(final String id) = _$_DeleteProduct;

  String get id => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$$_DeleteProductCopyWith<_$_DeleteProduct> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_AddProductCopyWith<$Res> {
  factory _$$_AddProductCopyWith(
          _$_AddProduct value, $Res Function(_$_AddProduct) then) =
      __$$_AddProductCopyWithImpl<$Res>;
  $Res call(
      {XFile avatar,
      List<XFile> productImage,
      String address,
      String title,
      String description,
      String price,
      String category,
      String variations,
      String stock,
      String shippingDetails});
}

/// @nodoc
class __$$_AddProductCopyWithImpl<$Res>
    extends _$ShopProductsEventCopyWithImpl<$Res>
    implements _$$_AddProductCopyWith<$Res> {
  __$$_AddProductCopyWithImpl(
      _$_AddProduct _value, $Res Function(_$_AddProduct) _then)
      : super(_value, (v) => _then(v as _$_AddProduct));

  @override
  _$_AddProduct get _value => super._value as _$_AddProduct;

  @override
  $Res call({
    Object? avatar = freezed,
    Object? productImage = freezed,
    Object? address = freezed,
    Object? title = freezed,
    Object? description = freezed,
    Object? price = freezed,
    Object? category = freezed,
    Object? variations = freezed,
    Object? stock = freezed,
    Object? shippingDetails = freezed,
  }) {
    return _then(_$_AddProduct(
      avatar == freezed
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as XFile,
      productImage == freezed
          ? _value._productImage
          : productImage // ignore: cast_nullable_to_non_nullable
              as List<XFile>,
      address == freezed
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      price == freezed
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as String,
      category == freezed
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      variations == freezed
          ? _value.variations
          : variations // ignore: cast_nullable_to_non_nullable
              as String,
      stock == freezed
          ? _value.stock
          : stock // ignore: cast_nullable_to_non_nullable
              as String,
      shippingDetails == freezed
          ? _value.shippingDetails
          : shippingDetails // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_AddProduct implements _AddProduct {
  const _$_AddProduct(
      this.avatar,
      final List<XFile> productImage,
      this.address,
      this.title,
      this.description,
      this.price,
      this.category,
      this.variations,
      this.stock,
      this.shippingDetails)
      : _productImage = productImage;

  @override
  final XFile avatar;
  final List<XFile> _productImage;
  @override
  List<XFile> get productImage {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_productImage);
  }

  @override
  final String address;
  @override
  final String title;
  @override
  final String description;
  @override
  final String price;
  @override
  final String category;
  @override
  final String variations;
  @override
  final String stock;
  @override
  final String shippingDetails;

  @override
  String toString() {
    return 'ShopProductsEvent.addProduct(avatar: $avatar, productImage: $productImage, address: $address, title: $title, description: $description, price: $price, category: $category, variations: $variations, stock: $stock, shippingDetails: $shippingDetails)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AddProduct &&
            const DeepCollectionEquality().equals(other.avatar, avatar) &&
            const DeepCollectionEquality()
                .equals(other._productImage, _productImage) &&
            const DeepCollectionEquality().equals(other.address, address) &&
            const DeepCollectionEquality().equals(other.title, title) &&
            const DeepCollectionEquality()
                .equals(other.description, description) &&
            const DeepCollectionEquality().equals(other.price, price) &&
            const DeepCollectionEquality().equals(other.category, category) &&
            const DeepCollectionEquality()
                .equals(other.variations, variations) &&
            const DeepCollectionEquality().equals(other.stock, stock) &&
            const DeepCollectionEquality()
                .equals(other.shippingDetails, shippingDetails));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(avatar),
      const DeepCollectionEquality().hash(_productImage),
      const DeepCollectionEquality().hash(address),
      const DeepCollectionEquality().hash(title),
      const DeepCollectionEquality().hash(description),
      const DeepCollectionEquality().hash(price),
      const DeepCollectionEquality().hash(category),
      const DeepCollectionEquality().hash(variations),
      const DeepCollectionEquality().hash(stock),
      const DeepCollectionEquality().hash(shippingDetails));

  @JsonKey(ignore: true)
  @override
  _$$_AddProductCopyWith<_$_AddProduct> get copyWith =>
      __$$_AddProductCopyWithImpl<_$_AddProduct>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String id) deleteProduct,
    required TResult Function(
            XFile avatar,
            List<XFile> productImage,
            String address,
            String title,
            String description,
            String price,
            String category,
            String variations,
            String stock,
            String shippingDetails)
        addProduct,
  }) {
    return addProduct(avatar, productImage, address, title, description, price,
        category, variations, stock, shippingDetails);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String id)? deleteProduct,
    TResult Function(
            XFile avatar,
            List<XFile> productImage,
            String address,
            String title,
            String description,
            String price,
            String category,
            String variations,
            String stock,
            String shippingDetails)?
        addProduct,
  }) {
    return addProduct?.call(avatar, productImage, address, title, description,
        price, category, variations, stock, shippingDetails);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String id)? deleteProduct,
    TResult Function(
            XFile avatar,
            List<XFile> productImage,
            String address,
            String title,
            String description,
            String price,
            String category,
            String variations,
            String stock,
            String shippingDetails)?
        addProduct,
    required TResult orElse(),
  }) {
    if (addProduct != null) {
      return addProduct(avatar, productImage, address, title, description,
          price, category, variations, stock, shippingDetails);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_DeleteProduct value) deleteProduct,
    required TResult Function(_AddProduct value) addProduct,
  }) {
    return addProduct(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_DeleteProduct value)? deleteProduct,
    TResult Function(_AddProduct value)? addProduct,
  }) {
    return addProduct?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_DeleteProduct value)? deleteProduct,
    TResult Function(_AddProduct value)? addProduct,
    required TResult orElse(),
  }) {
    if (addProduct != null) {
      return addProduct(this);
    }
    return orElse();
  }
}

abstract class _AddProduct implements ShopProductsEvent {
  const factory _AddProduct(
      final XFile avatar,
      final List<XFile> productImage,
      final String address,
      final String title,
      final String description,
      final String price,
      final String category,
      final String variations,
      final String stock,
      final String shippingDetails) = _$_AddProduct;

  XFile get avatar => throw _privateConstructorUsedError;
  List<XFile> get productImage => throw _privateConstructorUsedError;
  String get address => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get price => throw _privateConstructorUsedError;
  String get category => throw _privateConstructorUsedError;
  String get variations => throw _privateConstructorUsedError;
  String get stock => throw _privateConstructorUsedError;
  String get shippingDetails => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$$_AddProductCopyWith<_$_AddProduct> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ShopProductsState {
  ShopProductsStatus get status => throw _privateConstructorUsedError;
  ListProductResponse? get shopProduct => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ShopProductsStateCopyWith<ShopProductsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShopProductsStateCopyWith<$Res> {
  factory $ShopProductsStateCopyWith(
          ShopProductsState value, $Res Function(ShopProductsState) then) =
      _$ShopProductsStateCopyWithImpl<$Res>;
  $Res call({ShopProductsStatus status, ListProductResponse? shopProduct});
}

/// @nodoc
class _$ShopProductsStateCopyWithImpl<$Res>
    implements $ShopProductsStateCopyWith<$Res> {
  _$ShopProductsStateCopyWithImpl(this._value, this._then);

  final ShopProductsState _value;
  // ignore: unused_field
  final $Res Function(ShopProductsState) _then;

  @override
  $Res call({
    Object? status = freezed,
    Object? shopProduct = freezed,
  }) {
    return _then(_value.copyWith(
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ShopProductsStatus,
      shopProduct: shopProduct == freezed
          ? _value.shopProduct
          : shopProduct // ignore: cast_nullable_to_non_nullable
              as ListProductResponse?,
    ));
  }
}

/// @nodoc
abstract class _$$_InitialCopyWith<$Res>
    implements $ShopProductsStateCopyWith<$Res> {
  factory _$$_InitialCopyWith(
          _$_Initial value, $Res Function(_$_Initial) then) =
      __$$_InitialCopyWithImpl<$Res>;
  @override
  $Res call({ShopProductsStatus status, ListProductResponse? shopProduct});
}

/// @nodoc
class __$$_InitialCopyWithImpl<$Res>
    extends _$ShopProductsStateCopyWithImpl<$Res>
    implements _$$_InitialCopyWith<$Res> {
  __$$_InitialCopyWithImpl(_$_Initial _value, $Res Function(_$_Initial) _then)
      : super(_value, (v) => _then(v as _$_Initial));

  @override
  _$_Initial get _value => super._value as _$_Initial;

  @override
  $Res call({
    Object? status = freezed,
    Object? shopProduct = freezed,
  }) {
    return _then(_$_Initial(
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ShopProductsStatus,
      shopProduct: shopProduct == freezed
          ? _value.shopProduct
          : shopProduct // ignore: cast_nullable_to_non_nullable
              as ListProductResponse?,
    ));
  }
}

/// @nodoc

class _$_Initial implements _Initial {
  const _$_Initial(
      {this.status = ShopProductsStatus.initial, this.shopProduct = null});

  @override
  @JsonKey()
  final ShopProductsStatus status;
  @override
  @JsonKey()
  final ListProductResponse? shopProduct;

  @override
  String toString() {
    return 'ShopProductsState(status: $status, shopProduct: $shopProduct)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Initial &&
            const DeepCollectionEquality().equals(other.status, status) &&
            const DeepCollectionEquality()
                .equals(other.shopProduct, shopProduct));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(status),
      const DeepCollectionEquality().hash(shopProduct));

  @JsonKey(ignore: true)
  @override
  _$$_InitialCopyWith<_$_Initial> get copyWith =>
      __$$_InitialCopyWithImpl<_$_Initial>(this, _$identity);
}

abstract class _Initial implements ShopProductsState {
  const factory _Initial(
      {final ShopProductsStatus status,
      final ListProductResponse? shopProduct}) = _$_Initial;

  @override
  ShopProductsStatus get status => throw _privateConstructorUsedError;
  @override
  ListProductResponse? get shopProduct => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_InitialCopyWith<_$_Initial> get copyWith =>
      throw _privateConstructorUsedError;
}

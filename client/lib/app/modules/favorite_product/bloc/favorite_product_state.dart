part of 'favorite_product_bloc.dart';

enum FavoriteProductStatus {
  initial,
  successs,
  loading,
  failure,
  started;

  bool get isLoading => this == FavoriteProductStatus.loading;
  bool get isInitial => this == FavoriteProductStatus.initial;
  bool get isStarted => this == FavoriteProductStatus.started;
}

@freezed
class FavoriteProductState with _$FavoriteProductState {
  const factory FavoriteProductState(
      {@Default(null) List<ProductModel>? favoriteProduct,
      @Default(FavoriteProductStatus.initial) status}) = _Initial;
}

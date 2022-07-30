part of 'shop_products_bloc.dart';

enum ShopProductsStatus {
  initial,
  success,
  loading,
  failure,
  needBackActionSuccess,
  actionSuccess,
  started;

  bool get isLoading => this == ShopProductsStatus.loading;
  bool get isInitial => this == ShopProductsStatus.initial;
  bool get isStarted => this == ShopProductsStatus.started;
  bool get isFailure => this == ShopProductsStatus.failure;
  bool get isActionNeedBackSuccess =>
      this == ShopProductsStatus.needBackActionSuccess;
  bool get isActionSuccess => this == ShopProductsStatus.actionSuccess;
}

@freezed
class ShopProductsState with _$ShopProductsState {
  const factory ShopProductsState(
      {@Default(ShopProductsStatus.initial) ShopProductsStatus status,
      @Default(null) ListProductResponse? shopProduct}) = _Initial;
}

part of 'shop_order_page_bloc.dart';

enum ShopOrderStatus {
  initial,
  success,
  loading,
  failure,
  started;

  bool get isLoading => this == ShopOrderStatus.loading;
  bool get isInitial => this == ShopOrderStatus.initial;
  bool get isStarted => this == ShopOrderStatus.started;
  bool get isFailure => this == ShopOrderStatus.failure;
}

@freezed
class ShopOrderPageState with _$ShopOrderPageState {
  const factory ShopOrderPageState(
      {@Default(ShopOrderStatus.initial) ShopOrderStatus status,
      @Default([]) List<OrderModel> orders}) = _Initial;
}

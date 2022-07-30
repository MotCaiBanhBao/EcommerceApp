part of 'shop_order_detail_bloc.dart';

enum ShopOrderDetailPageStatus {
  initial,
  loading,
  success,
  actionSuccess,
  failure;

  bool get isInitial => this == ShopOrderDetailPageStatus.initial;
  bool get isLoading => this == ShopOrderDetailPageStatus.loading;
  bool get isSuccess => this == ShopOrderDetailPageStatus.success;
  bool get isFailure => this == ShopOrderDetailPageStatus.failure;
  bool get isCanceledSuccess => this == ShopOrderDetailPageStatus.actionSuccess;
}

@freezed
class ShopOrderDetailState with _$ShopOrderDetailState {
  const factory ShopOrderDetailState(
      {@Default(ShopOrderDetailPageStatus.initial)
          ShopOrderDetailPageStatus status,
      @Default(null)
          OrderModel? order}) = _Initial;
}

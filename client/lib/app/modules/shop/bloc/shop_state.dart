part of 'shop_bloc.dart';

enum ShopStatus {
  initial,
  success,
  loading,
  failure,
  started;

  bool get isLoading => this == ShopStatus.loading;
  bool get isInitial => this == ShopStatus.initial;
  bool get isStarted => this == ShopStatus.started;
  bool get isFailure => this == ShopStatus.failure;
}

@freezed
class ShopState with _$ShopState {
  const factory ShopState(
      {@Default(ShopStatus.initial) ShopStatus status,
      @Default([]) List<OrderModel> orders}) = _Initial;
}

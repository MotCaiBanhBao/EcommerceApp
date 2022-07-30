part of 'cart_bloc.dart';

enum CartStatus {
  initial,
  loading,
  success,
  failure;

  bool get isSuccess => this == CartStatus.success;
  bool get isLoadding => this == CartStatus.loading;
  bool get isInitial => this == CartStatus.initial;
  bool get isFailure => this == CartStatus.failure;
}

@freezed
class CartState with _$CartState {
  const factory CartState(
      {@Default(null) CartModel? cartData,
      @Default(CartStatus.initial) status,
      @Default(0) num totalBill}) = _Initial;
}

part of 'order_bloc.dart';

enum OrderPageStatus {
  initial,
  loading,
  success,
  failure;

  bool get isInitial => this == OrderPageStatus.initial;
  bool get isLoading => this == OrderPageStatus.loading;
  bool get isSuccess => this == OrderPageStatus.success;
  bool get isFailure => this == OrderPageStatus.failure;
}

@freezed
class OrderState with _$OrderState {
  const factory OrderState(
      {@Default(OrderPageStatus.initial) OrderPageStatus status,
      @Default([]) List<OrderModel> orders}) = _Initial;
}

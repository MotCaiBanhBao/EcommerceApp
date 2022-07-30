part of 'order_detail_bloc.dart';

enum OrderDetailPageStatus {
  initial,
  loading,
  success,
  canceledSuccess,
  failure;

  bool get isInitial => this == OrderDetailPageStatus.initial;
  bool get isLoading => this == OrderDetailPageStatus.loading;
  bool get isSuccess => this == OrderDetailPageStatus.success;
  bool get isFailure => this == OrderDetailPageStatus.failure;
  bool get isCanceledSuccess => this == OrderDetailPageStatus.canceledSuccess;
}

@freezed
class OrderDetailState with _$OrderDetailState {
  const factory OrderDetailState(
      {@Default(OrderDetailPageStatus.initial) OrderDetailPageStatus status,
      @Default(null) OrderModel? order}) = _Initial;
}

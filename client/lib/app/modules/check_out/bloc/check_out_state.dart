part of 'check_out_bloc.dart';

enum CheckOutStatus {
  none,
  initial,
  started,
  success,
  failure,
  loading,
  checkoutSuccess;

  bool get isLoadding => this == CheckOutStatus.loading;
  bool get isInitial => this == CheckOutStatus.initial;
  bool get isStarted => this == CheckOutStatus.started;
  bool get isSuccess => this == CheckOutStatus.success;
  bool get isFailure => this == CheckOutStatus.failure;
  bool get isCheckoutSuccess => this == CheckOutStatus.checkoutSuccess;
}

@freezed
class CheckOutState with _$CheckOutState {
  const factory CheckOutState(
      {@Default(null) CheckOutModel? order,
      @Default(CheckOutStatus.none) CheckOutStatus status}) = _Initial;
}

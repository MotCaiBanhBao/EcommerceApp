part of 'shop_register_bloc.dart';

enum ShopRegisterStateStatus {
  initial,
  success,
  loading,
  failure,
  needBackActionSuccess,
  actionSuccess,
  started;

  bool get isLoading => this == ShopRegisterStateStatus.loading;
  bool get isInitial => this == ShopRegisterStateStatus.initial;
  bool get isStarted => this == ShopRegisterStateStatus.started;
  bool get isFailure => this == ShopRegisterStateStatus.failure;
  bool get isActionNeedBackSuccess =>
      this == ShopRegisterStateStatus.needBackActionSuccess;
  bool get isActionSuccess => this == ShopRegisterStateStatus.actionSuccess;
}

@freezed
class ShopRegisterState with _$ShopRegisterState {
  const factory ShopRegisterState(
      {@Default(ShopRegisterStateStatus.initial)
          ShopRegisterStateStatus status}) = _Initial;
}

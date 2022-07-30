part of 'detail_bloc.dart';

enum DetailStatus {
  initial,
  started,
  success,
  failure,
  actionSuccess,
  actionLoading,
  loading;

  bool get isLoadding => this == DetailStatus.loading;
  bool get isInitial => this == DetailStatus.initial;
  bool get isStarted => this == DetailStatus.started;
  bool get isActionLoading => this == DetailStatus.actionLoading;
  bool get isActionSuccess => this == DetailStatus.actionSuccess;
}

enum AddToCartStatus {
  none,
  loading,
  success,
  failure;

  bool get isLoadding => this == AddToCartStatus.loading;
  bool get isSuccess => this == AddToCartStatus.success;
  bool get isFailure => this == AddToCartStatus.failure;
}

@freezed
class DetailState with _$DetailState {
  const factory DetailState(
      {@Default(false) bool isFavorite,
      @Default([]) List<VariationsData> choiceChip,
      @Default(0) num price,
      @Default(DetailStatus.initial) status,
      @Default(null) ProductModel? data,
      @Default(AddToCartStatus.none) AddToCartStatus addCartStatus}) = _Initial;
}

part of 'review_product_bloc.dart';

enum ReviewProductStatus {
  initial,
  success,
  loading,
  failure,
  needBackActionSuccess,
  actionSuccess,
  started;

  bool get isLoading => this == ReviewProductStatus.loading;
  bool get isInitial => this == ReviewProductStatus.initial;
  bool get isStarted => this == ReviewProductStatus.started;
  bool get isFailure => this == ReviewProductStatus.failure;
  bool get isActionNeedBackSuccess =>
      this == ReviewProductStatus.needBackActionSuccess;
  bool get isActionSuccess => this == ReviewProductStatus.actionSuccess;
}

@freezed
class ReviewProductState with _$ReviewProductState {
  const factory ReviewProductState(
          {@Default(ReviewProductStatus.initial) ReviewProductStatus status}) =
      _Initial;
}

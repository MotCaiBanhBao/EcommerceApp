part of 'home_bloc.dart';

enum HomeInitStatus {
  initial,
  loading,
  success,
  failure;

  bool get isInitial => this == HomeInitStatus.initial;
  bool get isLoading => this == HomeInitStatus.loading;
  bool get isSuccess => this == HomeInitStatus.success;
  bool get isFailure => this == HomeInitStatus.failure;
}

enum MenuState { dashboard, favourite, message, cart, profile }

extension HomeInitStatusX on HomeInitStatus {
  bool get isLoadingOrSuccess => [
        HomeInitStatus.loading,
        HomeInitStatus.success,
      ].contains(this);
}

@freezed
class HomeState with _$HomeState {
  const factory HomeState.initial({
    @Default(null) CartModel? userCart,
    @Default(HomeInitStatus.initial) HomeInitStatus status,
    @Default(MenuState.dashboard) MenuState currentPage,
    @Default(false) bool isBack,
  }) = _Initial;

  factory HomeState.fromJson(Map<String, dynamic> json) =>
      _$HomeStateFromJson(json);
}

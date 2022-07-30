part of 'dashboard_bloc.dart';

enum DashBoardStatus {
  initial,
  loading,
  success,
  failure;

  bool get isInitial => this == DashBoardStatus.initial;
  bool get isLoading => this == DashBoardStatus.loading;
  bool get isSuccess => this == DashBoardStatus.success;
  bool get isFailure => this == DashBoardStatus.failure;
}

@freezed
class DashboardState with _$DashboardState {
  const factory DashboardState(
      {@Default(DashBoardStatus.initial) status,
      @Default(null) ListProductResponse? popularProduct}) = _Initial;
}

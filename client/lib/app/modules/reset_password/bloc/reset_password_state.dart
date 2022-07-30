part of 'reset_password_bloc.dart';

enum ResetPasswordStatus {
  initial,
  success,
  loading,
  failure,
  needBackActionSuccess,
  actionSuccess,
  started;

  bool get isLoading => this == ResetPasswordStatus.loading;
  bool get isInitial => this == ResetPasswordStatus.initial;
  bool get isStarted => this == ResetPasswordStatus.started;
  bool get isFailure => this == ResetPasswordStatus.failure;
  bool get isActionNeedBackSuccess =>
      this == ResetPasswordStatus.needBackActionSuccess;
  bool get isActionSuccess => this == ResetPasswordStatus.actionSuccess;
}

@freezed
class ResetPasswordState with _$ResetPasswordState {
  const factory ResetPasswordState({@Default(ResetPasswordStatus.initial) ResetPasswordStatus status}) = _Initial;
}

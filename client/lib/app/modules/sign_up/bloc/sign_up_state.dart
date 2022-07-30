part of 'sign_up_bloc.dart';

enum SignUpStatus {
  initial,
  success,
  loading,
  failure,
  actionSuccess,
  started;

  bool get isLoading => this == SignUpStatus.loading;
  bool get isInitial => this == SignUpStatus.initial;
  bool get isStarted => this == SignUpStatus.started;
  bool get isFailure => this == SignUpStatus.failure;
  bool get isActionSuccess => this == SignUpStatus.actionSuccess;
}

@freezed
class SignUpState with _$SignUpState {
  const factory SignUpState(
      {@Default(SignUpStatus.initial) SignUpStatus status}) = _Initial;
}

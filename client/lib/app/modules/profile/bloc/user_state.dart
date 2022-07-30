part of 'user_bloc.dart';

enum UserStatus {
  initial,
  successs,
  loading,
  failure,
  started;

  bool get isLoading => this == UserStatus.loading;
  bool get isInitial => this == UserStatus.initial;
  bool get isStarted => this == UserStatus.started;
}

@freezed
class UserState with _$UserState {
  const factory UserState({
    @Default(UserStatus.initial) UserStatus status,
    @Default(null) UserModel? user,
  }) = _Initial;
}

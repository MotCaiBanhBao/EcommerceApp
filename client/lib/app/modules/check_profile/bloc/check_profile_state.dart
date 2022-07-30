part of 'check_profile_bloc.dart';

enum CheckProfileStatus {
  initial,
  successs,
  loading,
  failure,
  started;

  bool get isLoading => this == CheckProfileStatus.loading;
  bool get isInitial => this == CheckProfileStatus.initial;
  bool get isStarted => this == CheckProfileStatus.started;
}

@freezed
class CheckProfileState with _$CheckProfileState {
  const factory CheckProfileState({
    @Default(CheckProfileStatus.initial) CheckProfileStatus status,
    @Default(null) UserModel? user,
}) = _Initial;
}

part of 'otp_bloc.dart';

enum OtpStatus {
  initial,
  started;

  bool get isInitial => this == OtpStatus.initial;
  bool get isStarted => this == OtpStatus.started;
}

@freezed
class OtpState with _$OtpState {
  const factory OtpState({
    @Default('') response,
    @Default(false) isLoading,
    @Default(false) isSuccess,
    @Default(OtpStatus.initial) status,
    @Default('') String otp,
  }) = _Initial;
}

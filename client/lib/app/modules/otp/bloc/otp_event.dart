part of 'otp_bloc.dart';

@freezed
class OtpEvent with _$OtpEvent {
  const factory OtpEvent.started(String hash) = _Started;
  const factory OtpEvent.verifyOTP(String otp) = _VerifyOTP;
  const factory OtpEvent.resendOTP(String hash) = _ResendOTP;
}

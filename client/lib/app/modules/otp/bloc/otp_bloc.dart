import 'package:auth_repository/auth_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'otp_event.dart';
part 'otp_state.dart';
part 'otp_bloc.freezed.dart';

class OtpBloc extends Bloc<OtpEvent, OtpState> {
  final AuthRepository _authRepository;
  String hash;
  String email;
  OtpBloc(this._authRepository, this.hash, this.email)
      : super(const _Initial()) {
    on<_Started>(_onStarted);
    on<_VerifyOTP>(_onVerifyOTP);
    on<_ResendOTP>(_onResendOTP);
  }
  void _onStarted(_Started event, Emitter<OtpState> emit) async {}

  Future<bool> _onResendOTP(_ResendOTP event, Emitter<OtpState> emit) async {
    print(hash);
    print("onresend");
    return true;
  }

  Future<void> _onVerifyOTP(_VerifyOTP event, Emitter<OtpState> emit) async {
    emit(state.copyWith(isLoading: true));
    await _authRepository.otpVerify(email, hash, event.otp).then((value) {
      if (value?.success ?? false) {
        emit(state.copyWith(
            isSuccess: true, response: 'Sucess', isLoading: false));
      } else {
        emit(state.copyWith(
            isSuccess: false, response: 'Data error', isLoading: false));
      }
    });
  }

  @override
  Future<void> close() async {
    print('otp bloc close');
    super.close();
  }
}

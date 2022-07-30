import 'package:auth_repository/auth_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'reset_password_event.dart';
part 'reset_password_state.dart';
part 'reset_password_bloc.freezed.dart';

class ResetPasswordBloc extends Bloc<ResetPasswordEvent, ResetPasswordState> {
  ResetPasswordBloc(this._authRepository) : super(_Initial()) {
    on<_Submit>(_onSubmit);
  }

  Future<void> _onSubmit(_Submit event, Emitter emit) async {
    try {
      emit(state.copyWith(status: ResetPasswordStatus.loading));

      await _authRepository
          .resetPassword(event.oldPassword, event.password)
          .then((value) {
        if (value == false) {
          emit(state.copyWith(status: ResetPasswordStatus.failure));
        } else {
          emit(state.copyWith(status: ResetPasswordStatus.actionSuccess));
        }
      });
    } on Exception catch (error, stackTrace) {
      addError(error, stackTrace);
      emit(state.copyWith(status: ResetPasswordStatus.failure));
    }
  }

  final AuthRepository _authRepository;
}

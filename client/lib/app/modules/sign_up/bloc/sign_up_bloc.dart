import 'package:auth_repository/auth_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_up_event.dart';
part 'sign_up_state.dart';
part 'sign_up_bloc.freezed.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  SignUpBloc(this._authRepository) : super(_Initial()) {
    on<_Submit>(_onSubmit);
  }

  Future<void> _onSubmit(_Submit event, Emitter emit) async {
    try {
      emit(state.copyWith(status: SignUpStatus.loading));

      await _authRepository.register(event.email, event.password)
          .then((value) {
        if (value == false) {
          emit(state.copyWith(status: SignUpStatus.failure));
        } else {
          emit(state.copyWith(status: SignUpStatus.actionSuccess));
        }
      });
    } on Exception catch (error, stackTrace) {
      addError(error, stackTrace);
      emit(state.copyWith(status: SignUpStatus.failure));
    }
  }

  final AuthRepository _authRepository;
}

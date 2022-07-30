import 'package:auth_api/auth_api.dart';
import 'package:auth_repository/auth_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'check_profile_event.dart';
part 'check_profile_state.dart';
part 'check_profile_bloc.freezed.dart';

class CheckProfileBloc extends Bloc<CheckProfileEvent, CheckProfileState> {
  CheckProfileBloc(this._authRepository) : super(const _Initial()) {
    on<_Started>(_onStarted);
  }

  Future<void> _onStarted(
      _Started event, Emitter<CheckProfileState> emit) async {
    emit(state.copyWith(status: CheckProfileStatus.loading));
    try {
      await _authRepository.getAnotherUser(event.id).then((value) async {
        emit(state.copyWith(user: value, status: CheckProfileStatus.successs));
      });
    } catch (err) {
      emit(state.copyWith(status: CheckProfileStatus.failure));
    }
  }

  final AuthRepository _authRepository;
}

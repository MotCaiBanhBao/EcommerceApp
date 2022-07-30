import 'package:auth_repository/auth_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:order_repository/order_repository.dart';

part 'user_event.dart';
part 'user_state.dart';
part 'user_bloc.freezed.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final AuthRepository _authRepository;
  final OrderRepository _orderRepository;
  UserBloc(this._authRepository, this._orderRepository)
      : super(const _Initial()) {
    on<_Started>(_onStarted);
    on<_Logout>(_logout);
  }
  Future<void> _onStarted(_Started event, Emitter<UserState> emit) async {
    emit(state.copyWith(status: UserStatus.loading));
    try {
      await _authRepository.getUser().then((value) async {
        emit(state.copyWith(user: value, status: UserStatus.successs));
      });
    } catch (err) {
      emit(state.copyWith(status: UserStatus.failure));
    }
  }

  Future<void> _logout(_Logout event, Emitter<UserState> emit) async {
    print('bbb');
    emit(state.copyWith(status: UserStatus.loading));
    print('bbb');
    await _authRepository.logout().then((value) {
      print('bbb');
      emit(state.copyWith(
        user: null,
        status: UserStatus.successs,
      ));
    });
  }
}

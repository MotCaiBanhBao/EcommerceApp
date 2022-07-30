import 'package:auth_repository/auth_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'shop_register_event.dart';
part 'shop_register_state.dart';
part 'shop_register_bloc.freezed.dart';

class ShopRegisterBloc extends Bloc<ShopRegisterEvent, ShopRegisterState> {
  ShopRegisterBloc(this._authRepository) : super(_Initial()) {
    on<_Submit>(_onSubmit);
  }

  Future<void> _onSubmit(_Submit event, Emitter emit) async {
    try {
      emit(state.copyWith(status: ShopRegisterStateStatus.loading));

      await _authRepository
          .shopRegistration(event.address, event.phoneNumber, event.shopName)
          .then((value) {
        if (value == false) {
          emit(state.copyWith(status: ShopRegisterStateStatus.failure));
        } else {
          emit(state.copyWith(status: ShopRegisterStateStatus.actionSuccess));
        }
      });
    } on Exception catch (error, stackTrace) {
      addError(error, stackTrace);
      emit(state.copyWith(status: ShopRegisterStateStatus.failure));
    }
  }

  final AuthRepository _authRepository;
}

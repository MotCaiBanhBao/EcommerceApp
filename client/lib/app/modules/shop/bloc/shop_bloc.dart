import 'package:auth_repository/auth_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:order_api/order_api.dart';
import 'package:order_repository/order_repository.dart';

part 'shop_event.dart';
part 'shop_state.dart';
part 'shop_bloc.freezed.dart';

class ShopBloc extends Bloc<ShopEvent, ShopState> {
  ShopBloc(this._orderRepository, this._authRepository) : super(_Initial()) {
    on<_Started>(_onStarted);
  }

  Future<void> _onStarted(_Started event, Emitter emit) async {
    try {
      emit(state.copyWith(status: ShopStatus.loading));

      await _orderRepository.getOrders().then((value) {
        if (value == null) {
          emit(state.copyWith(status: ShopStatus.failure));
        } else {
          emit(state.copyWith(status: ShopStatus.success, orders: value));
        }
      });
    } on Exception catch (error, stackTrace) {
      addError(error, stackTrace);
      emit(state.copyWith(status: ShopStatus.failure));
    }
  }

  final OrderRepository _orderRepository;
  final AuthRepository _authRepository;
}

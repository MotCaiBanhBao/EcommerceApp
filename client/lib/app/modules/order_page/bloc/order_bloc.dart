import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:order_api/order_api.dart';
import 'package:order_repository/order_repository.dart';

part 'order_event.dart';
part 'order_state.dart';
part 'order_bloc.freezed.dart';

class OrderBloc extends Bloc<OrderEvent, OrderState> {
  OrderBloc(this._orderRepository) : super(_Initial()) {
    on<_Started>(_onStarted);
  }

  Future<void> _onStarted(_Started event, Emitter emit) async {
    try {
      emit(state.copyWith(status: OrderPageStatus.loading));

      await _orderRepository.getOrders().then((value) {
        if (value == null) {
          emit(state.copyWith(status: OrderPageStatus.failure));
        } else {
          emit(state.copyWith(status: OrderPageStatus.success, orders: value));
        }
      });
    } on Exception catch (error, stackTrace) {
      addError(error, stackTrace);
      emit(state.copyWith(status: OrderPageStatus.failure));
    }
  }

  final OrderRepository _orderRepository;
}

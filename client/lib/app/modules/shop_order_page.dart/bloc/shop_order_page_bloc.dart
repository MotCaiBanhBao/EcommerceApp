import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:order_api/order_api.dart';
import 'package:order_repository/order_repository.dart';

part 'shop_order_page_event.dart';
part 'shop_order_page_state.dart';
part 'shop_order_page_bloc.freezed.dart';

class ShopOrderPageBloc extends Bloc<ShopOrderPageEvent, ShopOrderPageState> {
  ShopOrderPageBloc(this._orderRepository) : super(_Initial()) {
    on<_Started>(_onStarted);
  }

  Future<void> _onStarted(_Started event, Emitter emit) async {
    try {
      emit(state.copyWith(status: ShopOrderStatus.loading));

      await _orderRepository.shopGetOrders().then((value) {
        if (value == null) {
          emit(state.copyWith(status: ShopOrderStatus.failure));
        } else {
          emit(state.copyWith(status: ShopOrderStatus.success, orders: value));
        }
      });
    } on Exception catch (error, stackTrace) {
      addError(error, stackTrace);
      emit(state.copyWith(status: ShopOrderStatus.failure));
    }
  }

  final OrderRepository _orderRepository;
}

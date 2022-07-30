import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:order_api/order_api.dart';
import 'package:order_repository/order_repository.dart';

part 'shop_order_detail_event.dart';
part 'shop_order_detail_state.dart';
part 'shop_order_detail_bloc.freezed.dart';

class ShopOrderDetailBloc
    extends Bloc<ShopOrderDetailEvent, ShopOrderDetailState> {
  ShopOrderDetailBloc(this._orderRepository) : super(_Initial()) {
    on<_Started>(_onStarted);
    on<_CancelOrder>(_onCancelOrder);
    on<_ChangeStatus>(_onChangeOrderStatus);
  }
  Future<void> _onCancelOrder(_CancelOrder event, Emitter emit) async {
    try {
      emit(state.copyWith(status: ShopOrderDetailPageStatus.loading));

      await _orderRepository
          .cancelOrder(event.orderID, event.message)
          .then((value) {
        if (value == false) {
          emit(state.copyWith(status: ShopOrderDetailPageStatus.failure));
        } else {
          emit(state.copyWith(
              status: ShopOrderDetailPageStatus.actionSuccess));
        }
      });
    } on Exception catch (error, stackTrace) {
      addError(error, stackTrace);
      emit(state.copyWith(status: ShopOrderDetailPageStatus.failure));
    }
  }

  Future<void> _onChangeOrderStatus(_ChangeStatus event, Emitter emit) async {
    try {
      emit(state.copyWith(status: ShopOrderDetailPageStatus.loading));

      await _orderRepository
          .changeOrderStatus(event.orderID, event.status)
          .then((value) {
        if (value == false) {
          emit(state.copyWith(status: ShopOrderDetailPageStatus.failure));
        } else {
          emit(state.copyWith(status: ShopOrderDetailPageStatus.actionSuccess));
        }
      });
    } on Exception catch (error, stackTrace) {
      addError(error, stackTrace);
      emit(state.copyWith(status: ShopOrderDetailPageStatus.failure));
    }
  }

  Future<void> _onStarted(_Started event, Emitter emit) async {
    try {
      emit(state.copyWith(status: ShopOrderDetailPageStatus.loading));

      await _orderRepository.getOrder(event.orderID).then((value) {
        if (value == null) {
          emit(state.copyWith(status: ShopOrderDetailPageStatus.failure));
        } else {
          emit(state.copyWith(
              status: ShopOrderDetailPageStatus.success, order: value));
        }
      });
    } on Exception catch (error, stackTrace) {
      addError(error, stackTrace);
      emit(state.copyWith(status: ShopOrderDetailPageStatus.failure));
    }
  }

  final OrderRepository _orderRepository;
}

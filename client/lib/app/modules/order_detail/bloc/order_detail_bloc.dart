import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:order_api/order_api.dart';
import 'package:order_repository/order_repository.dart';

part 'order_detail_event.dart';
part 'order_detail_state.dart';
part 'order_detail_bloc.freezed.dart';

class OrderDetailBloc extends Bloc<OrderDetailEvent, OrderDetailState> {
  OrderDetailBloc(this._orderRepository) : super(_Initial()) {
    on<_Started>(_onStarted);
    on<_CancelOrder>(_onCancelOrder);
    on<_ConfirmOrder>(_onConfirmOrder);
  }

      
  Future<void> _onConfirmOrder(_ConfirmOrder event, Emitter emit) async {
    try {
      emit(state.copyWith(status: OrderDetailPageStatus.loading));

      await _orderRepository
          .confirmOrder(event.orderID)
          .then((value) {
        if (value == false) {
          emit(state.copyWith(status: OrderDetailPageStatus.failure));
        } else {
          emit(state.copyWith(status: OrderDetailPageStatus.canceledSuccess));
        }
      });
    } on Exception catch (error, stackTrace) {
      addError(error, stackTrace);
      emit(state.copyWith(status: OrderDetailPageStatus.failure));
    }
  }

  Future<void> _onCancelOrder(_CancelOrder event, Emitter emit) async {
    try {
      emit(state.copyWith(status: OrderDetailPageStatus.loading));

      await _orderRepository
          .cancelOrder(event.orderID, event.message)
          .then((value) {
        if (value == false) {
          emit(state.copyWith(status: OrderDetailPageStatus.failure));
        } else {
          emit(state.copyWith(status: OrderDetailPageStatus.canceledSuccess));
        }
      });
    } on Exception catch (error, stackTrace) {
      addError(error, stackTrace);
      emit(state.copyWith(status: OrderDetailPageStatus.failure));
    }
  }

  Future<void> _onStarted(_Started event, Emitter emit) async {
    try {
      emit(state.copyWith(status: OrderDetailPageStatus.loading));

      await _orderRepository.getOrder(event.orderID).then((value) {
        if (value == null) {
          emit(state.copyWith(status: OrderDetailPageStatus.failure));
        } else {
          emit(state.copyWith(
              status: OrderDetailPageStatus.success, order: value));
        }
      });
    } on Exception catch (error, stackTrace) {
      addError(error, stackTrace);
      emit(state.copyWith(status: OrderDetailPageStatus.failure));
    }
  }

  final OrderRepository _orderRepository;
}

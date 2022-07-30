part of 'order_detail_bloc.dart';

@freezed
class OrderDetailEvent with _$OrderDetailEvent {
  const factory OrderDetailEvent.started(String orderID) = _Started;
  const factory OrderDetailEvent.cancelOrder(String orderID, String message) =
      _CancelOrder;
  const factory OrderDetailEvent.confirmOrder(String orderID) = _ConfirmOrder;
}

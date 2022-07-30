part of 'shop_order_detail_bloc.dart';

@freezed
class ShopOrderDetailEvent with _$ShopOrderDetailEvent {
  const factory ShopOrderDetailEvent.started(String orderID) = _Started;
  const factory ShopOrderDetailEvent.cancelOrder(
      String orderID, String message) = _CancelOrder;

  const factory ShopOrderDetailEvent.changeStatus(
      String orderID, OrderStatus status) = _ChangeStatus;
}

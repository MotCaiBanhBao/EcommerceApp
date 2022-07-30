import 'package:order_api/order_api.dart';

class OrderRepository {
  const OrderRepository({
    required OrderApi orderApi,
  }) : _orderApi = orderApi;

  final OrderApi _orderApi;
  Future<bool> changeOrderStatus(String orderID, OrderStatus status) =>
      _orderApi.changeOrderStatus(orderID, status);
  Future<OrderModel?> getOrder(String orderID) => _orderApi.getOrder(orderID);
  Future<List<OrderModel>?> getOrders() => _orderApi.getOrders();
  Future<List<OrderModel>?> shopGetOrders() => _orderApi.shopGetOrders();
  Future<bool> confirmOrder(
    String orderID,
  ) => _orderApi.confirmOrder(orderID);
  Future<bool> cancelOrder(
    String orderID,
    String message,
  ) =>
      _orderApi.cancelOrder(orderID, message);
}

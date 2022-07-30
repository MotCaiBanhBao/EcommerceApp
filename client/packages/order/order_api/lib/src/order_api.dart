// ignore_for_file: constant_identifier_names

import 'package:order_api/src/models/order_model.dart';

enum OrderStatus { Processing, Shipping, Delivered, NotProcessed, Cancelled }

extension ParseToString on OrderStatus {
  String toShortString() {
    if (this == OrderStatus.Processing) {
      return 'Processing';
    } else if (this == OrderStatus.Shipping) {
      return 'Shipping';
    } else if (this == OrderStatus.Delivered) {
      return 'Delivered';
    } else if (this == OrderStatus.NotProcessed) {
      return 'Not Processed';
    } else {
      return 'Cancelled';
    }
  }
}

extension ParseToOrderStatus on String {
  OrderStatus toOrderStatus() {
    if (this == 'Processing') {
      return OrderStatus.Processing;
    } else if (this == 'Shipping') {
      return OrderStatus.Shipping;
    } else if (this == 'Delivered') {
      return OrderStatus.Delivered;
    } else if (this == 'Not Processed') {
      return OrderStatus.NotProcessed;
    } else {
      return OrderStatus.Cancelled;
    }
  }
}

abstract class OrderApi {
  const OrderApi();
  Future<bool> confirmOrder(String orderID);
  Future<OrderModel?> getOrder(String orderID);
  Future<List<OrderModel>?> getOrders();
  Future<bool> cancelOrder(
    String orderID,
    String message,
  );
  Future<List<OrderModel>?> shopGetOrders();
  Future<bool> changeOrderStatus(String orderID, OrderStatus status);
}

import 'package:api_util/api_util.dart';
import 'package:local_storage_auth_api/local_storage_auth_api.dart';
import 'package:order_api/order_api.dart';

class RemoteOderApi extends OrderApi {
  @override
  Future<bool> cancelOrder(String orderID, String message) async {
    try {
      final token = await LocalStorageAuthApi().getToken();
      if (token == null) {
        return false;
      }

      String url = ApiHelper.baseURI + ApiEndPoints.cancleOrder;
      var options = apiUtils.makeSecureHeaders(token);
      final response = await apiUtils.post(
          url: url,
          data: {'id': orderID, 'message': message},
          options: options);
      if (response.statusCode == CODE_SUCCESS) {
        return true;
      }
      return false;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<OrderModel?> getOrder(String orderID) async {
    try {
      final data = await LocalStorageAuthApi().getToken();
      if (data == null) {
        return null;
      } else {
        String url = ApiHelper.baseURI + ApiEndPoints.getOrder;
        var options = apiUtils.makeSecureHeaders(data);
        final result = await apiUtils.post(
            url: url, data: {"orderID": orderID}, options: options);
        if (result.statusCode == CODE_SUCCESS) {
          return OrderModel.fromJson(result.data);
        }
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  @override
  Future<List<OrderModel>?> getOrders() async {
    try {
      final data = await LocalStorageAuthApi().getToken();
      if (data == null) {
        return null;
      } else {
        String url = ApiHelper.baseURI + ApiEndPoints.getOrders;
        var options = apiUtils.makeSecureHeaders(data);
        final result = await apiUtils.get(url: url, options: options);
        if (result.statusCode == CODE_SUCCESS) {
          List<OrderModel> orders = List<OrderModel>.from(
              result.data.map((x) => OrderModel.fromJson(x)));

          return orders;
        }
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  @override
  Future<bool> changeOrderStatus(String orderID, OrderStatus status) async {
    try {
      final token = await LocalStorageAuthApi().getToken();
      if (token == null) {
        return false;
      }

      String url = ApiHelper.baseURI + ApiEndPoints.changeOrderStatus;
      var options = apiUtils.makeSecureHeaders(token);
      final response = await apiUtils.post(
          url: url,
          data: {'id': orderID, 'status': status.toShortString()},
          options: options);
      if (response.statusCode == CODE_SUCCESS) {
        return true;
      }
      return false;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<List<OrderModel>?> shopGetOrders() async {
    try {
      final data = await LocalStorageAuthApi().getToken();
      if (data == null) {
        return null;
      } else {
        print('aaadsadasdasdasdsadweqweqweqweqw');
        String url = ApiHelper.baseURI + ApiEndPoints.shopGetOrders;
        var options = apiUtils.makeSecureHeaders(data);
        print(url);
        final result = await apiUtils.get(url: url, options: options);
        if (result.statusCode == CODE_SUCCESS) {
          List<OrderModel> orders = List<OrderModel>.from(
              result.data.map((x) => OrderModel.fromJson(x)));

          return orders;
        }
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  @override
  Future<bool> confirmOrder(String orderID) async {
    try {
      final token = await LocalStorageAuthApi().getToken();
      if (token == null) {
        return false;
      }

      String url = ApiHelper.baseURI + ApiEndPoints.confirm_order;
      var options = apiUtils.makeSecureHeaders(token);
      final response = await apiUtils.post(
          url: url, data: {'id': orderID}, options: options);
      if (response.statusCode == CODE_SUCCESS) {
        return true;
      }
      return false;
    } catch (e) {
      return false;
    }
  }
}

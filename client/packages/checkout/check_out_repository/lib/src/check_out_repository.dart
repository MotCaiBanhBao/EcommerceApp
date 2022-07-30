import 'package:check_out_api/check_out_api.dart';

class CheckOutRepository {
  /// {@macro todos_repository}
  const CheckOutRepository({
    required CheckOut checkOutApi,
  }) : _checkOutApi = checkOutApi;

  final CheckOut _checkOutApi;

  Future<List<CheckOutModel>?> getUserOrder(String id) =>
      _checkOutApi.getUserOrder(id);
  Future<bool> pushOrder(CheckOutModel order) => _checkOutApi.pushOrder(order);
}

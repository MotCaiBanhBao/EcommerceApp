import 'package:check_out_api/check_out_api.dart';

abstract class CheckOut {
  const CheckOut();
  Future<bool> pushOrder(CheckOutModel order);
  Future<List<CheckOutModel>?> getUserOrder(String id);
}

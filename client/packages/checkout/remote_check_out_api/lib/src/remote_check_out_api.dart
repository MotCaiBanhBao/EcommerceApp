import 'dart:convert';

import 'package:api_util/api_util.dart';
import 'package:check_out_api/check_out_api.dart';
import 'package:local_storage_auth_api/local_storage_auth_api.dart';

class RemoteCheckOutApi extends CheckOut {
  @override
  Future<bool> pushOrder(CheckOutModel order) async {
    try {
      final token = await LocalStorageAuthApi().getToken();
      if (token == null) {
        return false;
      }

      String url = ApiHelper.baseURI + ApiEndPoints.orderURI;
      var options = apiUtils.makeSecureHeaders(token);
      final response =
          await apiUtils.post(url: url, data: order.toJson(), options: options);
      print('response : ${response.statusCode}');
      if (response.statusCode == CODE_SUCCESS) {
        print('ok ne CODE_SUCCESS');
        return true;
      }
      print('ok ne eo dung');
      return false;
    } catch (e) {
      print(e);
      return false;
    }
  }

  @override
  Future<List<CheckOutModel>?> getUserOrder(String id) async {
    var options = apiUtils.makeSecureHeaders(id);
    var response =
        await apiUtils.get(url: ApiEndPoints.orderURI, options: options);

    print(response.data);
  }
}

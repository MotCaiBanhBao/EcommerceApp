import 'dart:convert';

import 'product_model.dart';

class ProductResponse {
  ProductResponse({
    this.success = false,
    this.message,
    this.statusCode,
    this.product,
  });

  bool success = false;
  int? statusCode;
  String? message;
  ProductModel? product;

  bool get isSuccess => success;

  ProductResponse.withError({
    int? statusCode,
    bool success = false,
    String? msg,
  })  : statusCode = statusCode,
        success = success,
        message = msg;

  String toRawJson() => json.encode(toJson());

  Map<String, dynamic> toJson() => {
        "message": message,
        "statusCode": statusCode,
        "success": success,
        "product": product!.toJson(),
      };
}

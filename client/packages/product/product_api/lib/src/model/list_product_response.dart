import 'dart:convert';

import 'product_model.dart';

class ListProductResponse {
  ListProductResponse({
    this.success = false,
    this.message,
    this.statusCode,
    this.productList,
  });

  bool success = false;
  int? statusCode;
  String? message;
  List<ProductModel>? productList;

  bool get isSuccess => success;

  ListProductResponse.withError({
    int? statusCode,
    bool success = false,
    String? msg,
  })  : statusCode = statusCode,
        success = success,
        message = msg;

  factory ListProductResponse.fromRawJson(String str) =>
      ListProductResponse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ListProductResponse.fromJson(Map<String, dynamic> json) =>
      ListProductResponse(
        statusCode: json["statusCode"],
        message: json["message"],
        success: json["success"],
        productList: json["product_list"] == null
            ? null
            : List<ProductModel>.from(
                json["product_list"].map((x) => ProductModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "statusCode": statusCode,
        "success": success,
        "product_list": productList == null
            ? null
            : List<dynamic>.from(productList!.map((x) => x.toJson())),
      };
}

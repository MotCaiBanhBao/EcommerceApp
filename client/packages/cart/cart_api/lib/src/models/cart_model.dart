import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:uuid/uuid.dart';

class CartModel extends Equatable {
  String? userID;
  List<Items> items = [];
  num? bill;

  CartModel({this.userID, required this.items, this.bill});

  CartModel.fromJson(Map<String, dynamic> json) {
    userID = json['userID'];
    if (json['items'] != null) {
      items = <Items>[];
      json['items'].forEach((v) {
        items.add(Items.fromJson(v));
      });
    }
    bill = json['bill'];
  }

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [items];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['userID'] = userID;
    if (items != null) {
      data['items'] = items.map((v) => v.toJson()).toList();
    }
    data['bill'] = bill;
    return data;
  }
}

class Items extends Equatable {
  String? publisherId;
  List<ProductItem> productItems = [];

  bool get isNotCheckAll {
    for (final data in productItems) {
      if (data.isCheck) {
        return false;
      }
    }
    return true;
  }

  Items({required this.productItems, this.publisherId});
  bool get isCheckAll {
    for (final data in productItems) {
      if (!data.isCheck) {
        return false;
      }
    }
    return true;
  }

  Items.fromJson(Map<String, dynamic> json) {
    publisherId = json['publisher_id'];
    if (json['product_items'] != null) {
      productItems = <ProductItem>[];
      json['product_items'].forEach((v) {
        productItems.add(ProductItem.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['publisher_id'] = publisherId;
    if (productItems != null) {
      data['product_items'] = productItems.map((v) => v.toJson()).toList();
    }
    return data;
  }

  @override
  List<Object?> get props => [productItems];
}

class ProductItem extends Equatable {
  String? productId;
  String? name;
  String? variation;
  String? productImage;
  int? quantity;
  num? price;
  String id = const Uuid().v1();
  String? publisherId;
  bool isCheck = false;
  int? stock;
  String? variationData;

  String get getVariationData =>
      (variationData == null || variationData == "null")
          ? 'Default'
          : variationData!;

  ProductItem(
      {this.productId,
      this.name,
      this.stock,
      this.variation,
      this.quantity,
      this.price,
      this.publisherId,
      this.productImage,
      this.variationData});

  ProductItem.fromJson(Map<String, dynamic> json) {
    productId = json['product_id'];
    name = json['name'];
    variation = json['variation_id'];
    quantity = json['quantity'];
    price = json['price'];
    stock = json['stock'];
    publisherId = json['publisher_id'];
    id = json['id'] ?? '0';
    isCheck = json['is_check'] ?? false;
    productImage = json['product_image'];
    variationData = json['variation_data'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['product_id'] = productId;
    data['name'] = name;
    data['variation_id'] = variation;
    data['quantity'] = quantity;
    data['price'] = price;
    data['stock'] = stock;
    data['publisher_id'] = publisherId;
    data['id'] = id;
    data['is_check'] = isCheck;
    data['product_image'] = productImage;
    data['variation_data'] = variationData;
    return data;
  }

  @override
  List<Object?> get props => [productId, variation, isCheck, quantity];
}

import 'dart:io';

import 'package:flutter/material.dart';

import 'model/list_product_response.dart';
import 'model/product_model.dart';
import 'model/product_response.dart';

abstract class ProductsApi {
  const ProductsApi();
  Future<bool> pushReview(String comment, int star, String itemID);

  Future<ListProductResponse?> getProducts();
  Future<ListProductResponse?> getShopProducts();
  Future<ProductResponse?> getProduct(String id);
  Future<ListProductResponse> findProduct(String findData);

  Future<List<ProductModel>?> getFavoriteItem();
  Future<bool> saveProduct(
    File avatar,
    List<File> productImage,
    String address,
    String title,
    String description,
    String price,
    String stock,
    String category,
    String variations,
    String shippingDetails,
  );
  Future<bool> deleteProduct(String id);
}

/// Error thrown when a [Todo] with a given id is not found.
class ProductNotFoundException implements Exception {}

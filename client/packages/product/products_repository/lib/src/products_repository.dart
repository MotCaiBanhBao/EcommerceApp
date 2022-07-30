import 'dart:io';

import 'package:product_api/product_api.dart';

class ProductsRepository {
  const ProductsRepository({
    required ProductsApi productsApi,
  }) : _productsApi = productsApi;

  final ProductsApi _productsApi;

  Future<ListProductResponse?> getProducts() => _productsApi.getProducts();

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
          String shippingDetails) =>
      _productsApi.saveProduct(avatar, productImage, address, title,
          description, price, stock, category, variations, shippingDetails);
  Future<bool> pushReview(String comment, int star, String itemID) =>
      _productsApi.pushReview(comment, star, itemID);
  Future<List<ProductModel>?> getFavoriteItem() =>
      _productsApi.getFavoriteItem();
  Future<bool> deleteProduct(String id) => _productsApi.deleteProduct(id);
  Future<ProductResponse?> getProduct(String id) => _productsApi.getProduct(id);
  Future<ListProductResponse?> getShopProducts() =>
      _productsApi.getShopProducts();
  Future<ListProductResponse> findProduct(String findData) =>
      _productsApi.findProduct(findData);
}

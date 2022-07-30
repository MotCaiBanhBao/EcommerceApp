import 'dart:io';

import 'package:api_util/api_util.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/src/painting/image_provider.dart';
import 'package:local_storage_auth_api/local_storage_auth_api.dart';
import 'package:product_api/product_api.dart';

import '../../products_api.dart';

class InternetProductsApi extends ProductsApi {
  @override
  Future<int> clearCompleted() {
    // TODO: implement clearCompleted
    throw UnimplementedError();
  }

  @override
  Future<int> completeAll({required bool isCompleted}) {
    // TODO: implement completeAll
    throw UnimplementedError();
  }

  @override
  Future<bool> deleteProduct(String id) async {
    try {
      final data = await LocalStorageAuthApi().getToken();
      if (data == null) {
        return false;
      } else {
        String url = ApiHelper.deleteItem(id);
        var options = apiUtils.makeSecureHeaders(data);
        final result = await apiUtils.delete(api: url, options: options);
        if (result.statusCode == CODE_SUCCESS) {
          return true;
        }
        return false;
      }
    } catch (e) {
      return false;
    }
  }

  @override
  Future<ListProductResponse?> getProducts() async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      print("no internet");
      return ListProductResponse.withError(
          statusCode: CODE_NO_INTERNET, msg: apiUtils.getNetworkError());
    }

    String url = ApiHelper.baseURI + ApiEndPoints.popularProductURI;

    try {
      final response = await apiUtils.get(url: url);

      if (response != null) {
        List<ProductModel> products = List<ProductModel>.from(
            response.data.map((x) => ProductModel.fromJson(x)));

        return ListProductResponse(success: true, productList: products);
      }

      return ListProductResponse.withError(
          statusCode: CODE_RESPONSE_NULL, msg: "");
    } catch (e) {
      return ListProductResponse.withError(
          statusCode: CODE_ERROR, msg: apiUtils.handleError(e));
    }
  }

  // Future<MovieResponse?> getPopularMovies() async {
  //   final connectivityResult = await (Connectivity().checkConnectivity());
  //   if (connectivityResult == ConnectivityResult.none) {
  //     return MovieResponse.withError(
  //         statusCode: CODE_NO_INTERNET, msg: apiUtils.getNetworkError());
  //   }

  //   String url = Api.baseUrlMovies + ApiEndPoints.popularMovies;
  //   Map<String, dynamic>? queryParameters = {PARAM_API_KEY: Api.api_key};

  //   try {
  //     final response =
  //         await apiUtils.get(url: url, queryParameters: queryParameters);
  //     return MovieResponse.fromJson(response.data);
  //   } catch (e) {
  //     return MovieResponse.withError(
  //         statusCode: CODE_ERROR, msg: apiUtils.handleError(e));
  //   }
  // }

  // Future<MovieResponse?> getUpcomingMovies() async {
  //   final connectivityResult = await (Connectivity().checkConnectivity());
  //   if (connectivityResult == ConnectivityResult.none) {
  //     return MovieResponse.withError(
  //         statusCode: CODE_NO_INTERNET, msg: apiUtils.getNetworkError());
  //   }

  //   String url = Api.baseUrlMovies + ApiEndPoints.upcomingMovies;
  //   Map<String, dynamic>? queryParameters = {PARAM_API_KEY: Api.api_key};

  //   try {
  //     final response =
  //         await apiUtils.get(url: url, queryParameters: queryParameters);
  //     return MovieResponse.fromJson(response.data);
  //   } catch (e) {
  //     return MovieResponse.withError(
  //         statusCode: CODE_ERROR, msg: apiUtils.handleError(e));
  //   }
  // }

  // Future<GenreResponse?> getGenreList() async {
  //   final connectivityResult = await (Connectivity().checkConnectivity());
  //   if (connectivityResult == ConnectivityResult.none) {
  //     return GenreResponse.withError(
  //         statusCode: CODE_NO_INTERNET, msg: apiUtils.getNetworkError());
  //   }

  //   String url = Api.baseUrlMovies + ApiEndPoints.getGenreList;
  //   Map<String, dynamic>? queryParameters = {PARAM_API_KEY: Api.api_key};

  //   try {
  //     final response =
  //         await apiUtils.get(url: url, queryParameters: queryParameters);
  //     return GenreResponse.fromJson(response.data);
  //   } catch (e) {
  //     return GenreResponse.withError(
  //         statusCode: CODE_ERROR, msg: apiUtils.handleError(e));
  //

  @override
  Future<ProductResponse?> getProduct(String id) async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      print("no internet");
      return ProductResponse.withError(
          statusCode: CODE_NO_INTERNET, msg: apiUtils.getNetworkError());
    }

    String url = ApiHelper.getItemByIdURI(id);

    try {
      final response = await apiUtils.get(url: url);

      if (response != null) {
        ProductModel products = ProductModel.fromJson(response.data);
        return ProductResponse(success: true, product: products);
      }

      return ProductResponse.withError(statusCode: CODE_RESPONSE_NULL, msg: "");
    } catch (e) {
      return ProductResponse.withError(
          statusCode: CODE_ERROR, msg: apiUtils.handleError(e));
    }
  }

  @override
  Future<ListProductResponse> findProduct(String findData) async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      print("no internet");
      return ListProductResponse.withError(
          statusCode: CODE_NO_INTERNET, msg: apiUtils.getNetworkError());
    }

    String url = ApiHelper.baseURI + ApiEndPoints.findProduct;

    try {
      final response = await apiUtils.post(url: url, data: {
        'findData': findData,
      });

      if (response != null) {
        List<ProductModel> products = List<ProductModel>.from(
            response.data.map((x) => ProductModel.fromJson(x)));

        return ListProductResponse(success: true, productList: products);
      }

      return ListProductResponse.withError(
          statusCode: CODE_RESPONSE_NULL, msg: "");
    } catch (e) {
      return ListProductResponse.withError(
          statusCode: CODE_ERROR, msg: apiUtils.handleError(e));
    }
  }

  @override
  Future<ListProductResponse?> getShopProducts() async {
    try {
      final data = await LocalStorageAuthApi().getToken();
      if (data == null) {
        return null;
      } else {
        String url = ApiHelper.baseURI + ApiEndPoints.shopGetProducts;
        var options = apiUtils.makeSecureHeaders(data);
        final result = await apiUtils.get(url: url, options: options);
        if (result.statusCode == CODE_SUCCESS) {
          List<ProductModel> products = List<ProductModel>.from(
              result.data['product'].map((x) => ProductModel.fromJson(x)));

          return ListProductResponse(success: true, productList: products);
        }
        return ListProductResponse.withError(
            statusCode: CODE_RESPONSE_NULL, msg: "");
      }
    } catch (e) {
      return ListProductResponse.withError(
          statusCode: CODE_ERROR, msg: apiUtils.handleError(e));
    }
  }

  @override
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
      String shippingDetails) async {
    try {
      final data = await LocalStorageAuthApi().getToken();
      if (data == null) {
        return false;
      } else {
        String url = ApiHelper.baseURI + ApiEndPoints.saveProduct;
        var options = apiUtils.makeSecureHeaders(data);
        final result = await apiUtils.postItemProduct(
            options: options,
            url: url,
            avatar: avatar,
            productImage: productImage,
            address: address,
            title: title,
            description: description,
            price: price,
            stock: stock,
            category: category,
            variations: variations,
            shippingDetails: shippingDetails);
        if (result.statusCode == CODE_SUCCESS) {
          return true;
        }
        return false;
      }
    } catch (e) {
      return false;
    }
  }

  @override
  Future<List<ProductModel>?> getFavoriteItem() async {
    try {
      final data = await LocalStorageAuthApi().getToken();
      if (data == null) {
        return null;
      } else {
        String url = ApiHelper.baseURI + ApiEndPoints.getAllFavoriteItem;
        var options = apiUtils.makeSecureHeaders(data);
        final result = await apiUtils.get(url: url, options: options);
        if (result.statusCode == CODE_SUCCESS) {
          List<ProductModel> products = List<ProductModel>.from(
              result.data['product'].map((x) => ProductModel.fromJson(x)));

          return products;
        }
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  @override
  Future<bool> pushReview(String comment, int star, String itemID) async {
    try {
      final data = await LocalStorageAuthApi().getToken();
      if (data == null) {
        return false;
      } else {
        String url = ApiHelper.baseURI + ApiEndPoints.pushReview;
        var options = apiUtils.makeSecureHeaders(data);
        final result = await apiUtils.post(url: url, options: options, data: {
          'comment': comment,
          'star': star,
          'itemID': itemID,
        });
        if (result.statusCode == CODE_SUCCESS) {
          return true;
        }
        return false;
      }
    } catch (e) {
      return false;
    }
  }
}

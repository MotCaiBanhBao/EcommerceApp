import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'log_util.dart';

import 'custom_log_interceptor.dart';

const title = "ApiUtils";

ApiUtils apiUtils = ApiUtils();

class ApiUtils {
  static final ApiUtils _apiUtils = ApiUtils._i();
  final Dio _dio = Dio();

  ApiUtils._i() {
    _dio.interceptors.add(CustomLogInterceptor(
      requestHeader: true,
      requestBody: true,
      responseHeader: false,
      responseBody: true,
    ));
  }

  factory ApiUtils() {
    return _apiUtils;
  }

  Map<String, String> header = {"Content-Type": "application/json"};

  Map<String, String> headers = {
    "Content-Type": "application/json",
    "api-version": "1"
  };

  Options makeSecureHeaders(String token) {
    return Options(
        contentType: Headers.jsonContentType,
        headers: {"api-version": "1", "x-auth-token": token});
  }

  Options makeSecureHeadersFormData(String token) {
    return Options(
        contentType: Headers.formUrlEncodedContentType,
        headers: {"api-version": "1", "x-auth-token": token});
  }

  Future<Response> postItemProduct({
    required String url,
    required File avatar,
    required List<File> productImage,
    required String address,
    required String title,
    required String description,
    required String price,
    required String stock,
    required String category,
    required String variations,
    required String shippingDetails,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    var formData = FormData();
    for (var file in productImage) {
      formData.files.addAll([
        MapEntry("productImage", await MultipartFile.fromFile(file.path)),
      ]);
    }
    formData.files.add(
      MapEntry("avatar", await MultipartFile.fromFile(avatar.path)),
    );

    formData.fields.addAll([
      MapEntry("address", address),
      MapEntry("title", title),
      MapEntry("description", description),
      MapEntry("price", price),
      MapEntry("stock", stock),
      MapEntry("category", category),
      MapEntry("variations", variations),
      MapEntry("shipping_details", shippingDetails),
    ]);
    var result = await _dio.post(
      url,
      data: formData,
      queryParameters: queryParameters,
      options: options,
    );

    return result;
  }

  Future<Response> get({
    required String url,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    var result = await _dio.get(
      url,
      queryParameters: queryParameters,
      options: options,
    );
    return result;
  }

  Future<Response> postFormData({
    required String url,
    required File data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    //Sending FormData:
    if (data != null) {
      FormData formData = FormData.fromMap(
          {'productImage': await MultipartFile.fromFile(data.path)});
      var result = await _dio.post(
        url,
        data: formData,
        queryParameters: queryParameters,
        options: options,
      );
      return result;
    }

    var result = await _dio.post(
      url,
      data: data,
      queryParameters: queryParameters,
      options: options,
    );
    return result;
  }

  Future<Response> post({
    required String url,
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    //Sending FormData:
    if (data != null) {
      FormData formData = FormData.fromMap(data);
      final test = jsonEncode(data);
      var result = await _dio.post(
        url,
        data: test,
        queryParameters: queryParameters,
        options: options,
      );
      return result;
    }

    var result = await _dio.post(
      url,
      data: data,
      queryParameters: queryParameters,
      options: options,
    );
    return result;
  }

  Future<Response> postWithProgress({
    required String url,
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    ProgressCallback? onSendProgress,
  }) async {
    //
    var result = await _dio.post(
      url,
      data: data,
      queryParameters: queryParameters,
      options: options,
      onSendProgress: onSendProgress,
    );
    return result;
  }

  Future<Response> put({
    required String url,
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    var result = await _dio.put(
      url,
      data: data,
      queryParameters: queryParameters,
      options: options,
    );
    return result;
  }

  Future<Response> delete({
    required String api,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    //Options options = Options(headers: secureHeaders);

    //var result = await _dio.delete(api, options: options);
    var result = await _dio.delete(
      api,
      queryParameters: queryParameters,
      options: options,
    );
    return result;
  }

  String handleError(dynamic error) {
    String errorDescription = "";

    Log.loga(title, "handleError:: error >> $error");

    if (error is DioError) {
      Log.loga(
          title, '************************ DioError ************************');

      DioError dioError = error as DioError;
      Log.loga(title, 'dioError:: $dioError');
      if (dioError.response != null) {
        Log.loga(
            title, "dioError:: response >> " + dioError.response.toString());
      }

      switch (dioError.type) {
        case DioErrorType.other:
          errorDescription =
              "Connection to API server failed due to internet connection";
          break;
        case DioErrorType.cancel:
          errorDescription = "Request to API server was cancelled";
          break;
        case DioErrorType.connectTimeout:
          errorDescription = "Connection timeout with API server";
          break;
        case DioErrorType.receiveTimeout:
          errorDescription = "Receive timeout in connection with API server";
          break;
        case DioErrorType.response:
          errorDescription =
              "Received invalid status code: ${dioError.response?.statusCode}";
          break;
        case DioErrorType.sendTimeout:
          errorDescription = "Send timeout in connection with API server";
          break;
      }
    } else {
      errorDescription = "Unexpected error occured";
    }
    Log.loga(title, "handleError:: errorDescription >> $errorDescription");
    return errorDescription;
  }

  getFormattedError() {
    return {'error': 'Error'};
  }

  getNetworkError() {
    return "No Internet Connection.";
  }
}

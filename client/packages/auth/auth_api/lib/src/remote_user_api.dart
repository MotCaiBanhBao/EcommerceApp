import 'package:api_util/api_util.dart';
import 'package:auth_api/src/auth_api.dart';
import 'package:auth_api/src/models/user_response.dart';
import 'package:auth_api/src/models/user_model.dart';
import 'package:auth_api/src/models/login_response.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:local_storage_auth_api/local_storage_auth_api.dart';

class RemoteUserApi extends AuthApi {
  @override
  Future<UserModel?> getUser() async {
    final token = await LocalStorageAuthApi().getToken();
    print(token);
    String url = ApiHelper.baseURI + ApiEndPoints.getUser;
    if (token == null) {
      return null;
    }
    try {
      final options = apiUtils.makeSecureHeaders(token);
      final response = await apiUtils.get(url: url, options: options);

      if (response != null) {
        return UserModel.fromJson(response.data);
      }
      return null;
    } catch (e) {
      return null;
    }
  }

  @override
  Future<LoginResponse?> login(String email, String password) async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      return LoginResponse.withError(
          statusCode: CODE_NO_INTERNET, msg: apiUtils.getNetworkError());
    }
    String url = ApiHelper.baseURI + ApiEndPoints.login;

    try {
      final response = await apiUtils.post(url: url, data: {
        'email': email,
        'password': password,
      });
      if (response.statusCode == CODE_SUCCESS) {
        return LoginResponse.fromJson(response.data);
      }

      return LoginResponse.withError(
          statusCode: CODE_ERROR, msg: response.data['msg']);
    } catch (e) {
      return LoginResponse.withError(
          statusCode: CODE_RESPONSE_NULL, msg: apiUtils.handleError(e));
    }
  }

  @override
  Future<UserResponse?> otpVerify(String email, String hash, String otp) async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      return UserResponse.withError(
          statusCode: CODE_NO_INTERNET, msg: apiUtils.getNetworkError());
    }
    String url = ApiHelper.baseURI + ApiEndPoints.verifyOTP;

    try {
      final response = await apiUtils.post(url: url, data: {
        'email': email,
        'hash': hash,
        'otp': otp,
      });
      if (response.statusCode == CODE_SUCCESS) {
        var data = UserResponse.fromJson(response.data);
        LocalStorageAuthApi().persistEmailAndToken(
            data.data?.user?.email, data.data?.token, data.data?.user?.isShop);
        return data;
      }

      return UserResponse.withError(statusCode: CODE_RESPONSE_NULL, msg: "");
    } catch (e) {
      return UserResponse.withError(
          statusCode: CODE_ERROR, msg: apiUtils.handleError(e));
    }
  }

  @override
  Future<void> logout() async {
    return LocalStorageAuthApi().deleteAll();
  }

  @override
  Future<String?> getToken() {
    return LocalStorageAuthApi().getToken();
  }

  @override
  Future<bool> isFavorite(String productID) async {
    final token = await LocalStorageAuthApi().getToken();
    String url = ApiHelper.baseURI + ApiEndPoints.isfavorite;
    if (token == null) {
      return false;
    }
    try {
      final options = apiUtils.makeSecureHeaders(token);
      final response = await apiUtils.post(url: url, options: options);

      if (response.statusCode == 200) {
        print(response);
        return response.data;
      }
      return false;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<bool> setFavorite(bool isFavorite, String productID) async {
    try {
      final data = await LocalStorageAuthApi().getToken();
      if (data == null) {
        return false;
      } else {
        String url;
        if (isFavorite) {
          url = ApiHelper.baseURI + ApiEndPoints.makeFavorite;
        } else {
          url = ApiHelper.baseURI + ApiEndPoints.unFavorite;
        }

        var options = apiUtils.makeSecureHeaders(data);
        final result = await apiUtils
            .post(url: url, options: options, data: {'productID': productID});
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
  Future<bool> shopRegistration(
      String address, String phoneNumber, String shopName) async {
    try {
      final data = await LocalStorageAuthApi().getToken();
      if (data == null) {
        return false;
      } else {
        String url = ApiHelper.baseURI + ApiEndPoints.shopRegistration;

        var options = apiUtils.makeSecureHeaders(data);
        final result = await apiUtils.post(url: url, options: options, data: {
          'address': address,
          'phoneNumber': phoneNumber,
          'shopName': shopName
        });
        if (result.statusCode == CODE_SUCCESS) {
          await LocalStorageAuthApi().addIsShop();
          return true;
        }
        return false;
      }
    } catch (e) {
      return false;
    }
  }

  @override
  Future<bool> register(String email, String password) async {
    String url = ApiHelper.baseURI + ApiEndPoints.signup;

    try {
      final response = await apiUtils.post(url: url, data: {
        'email': email,
        'password': password,
      });
      if (response.statusCode == CODE_SUCCESS) {
        var data = Data.fromJson(response.data);
        print(data.token);
        await LocalStorageAuthApi().persistEmailAndToken(
            data.user?.email, data.token, data.user?.isShop);
        return true;
      }

      return false;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<bool> resetPassword(String oldPassword, String password) async {
    String url = ApiHelper.baseURI + ApiEndPoints.resetPassword;
    try {
      final data = await LocalStorageAuthApi().getToken();
      if (data == null) {
        return false;
      } else {
        String url = ApiHelper.baseURI + ApiEndPoints.resetPassword;
        var options = apiUtils.makeSecureHeaders(data);
        final response = await apiUtils.post(
            url: url,
            data: {
              'password': password,
              'oldPassword': oldPassword,
            },
            options: options);
        if (response.statusCode == CODE_SUCCESS) {
          var data = Data.fromJson(response.data);
          print(data.token);
          // await LocalStorageAuthApi().persistEmailAndToken(
          //     data.user?.email, data.token, data.user?.isShop);
          return true;
        }

        return false;
      }
    } catch (err) {
      return false;
    }
  }

  @override
  Future<UserModel?> getAnotherUser(String id) async {
    String url = ApiHelper.baseURI + ApiEndPoints.getAnotherUser;
    try {
      final response = await apiUtils.post(url: url, data: {
        'userID': id,
      });

      if (response != null) {
        return UserModel.fromJson(response.data);
      }
      return null;
    } catch (e) {
      return null;
    }
  }
}

  // @override
  // Future<ProductResponse?> getProducts() async {
  //   final connectivityResult = await (Connectivity().checkConnectivity());
  //   if (connectivityResult == ConnectivityResult.none) {
  //     return ProductResponse.withError(
  //         statusCode: CODE_NO_INTERNET, msg: apiUtils.getNetworkError());
  //   }

  //   String url = ApiHelper.baseURI + ApiEndPoints.popularProductURI;

  //   try {
  //     final response = await apiUtils.get(url: url);

  //     if (response != null) {
  //       List<ProductModel> products = List<ProductModel>.from(
  //           response.data.map((x) => ProductModel.fromJson(x)));

  //       return ProductResponse(success: true, productList: products);
  //     }

  //     return ProductResponse.withError(statusCode: CODE_RESPONSE_NULL, msg: "");
  //   } catch (e) {
  //     return ProductResponse.withError(
  //         statusCode: CODE_ERROR, msg: apiUtils.handleError(e));
  //   }

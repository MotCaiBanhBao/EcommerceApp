import 'package:auth_api/auth_api.dart';
import 'package:auth_api/src/models/login_response.dart';
import 'package:auth_api/src/models/user_response.dart';

abstract class AuthApi {
  /// {@macro product_api}
  const AuthApi();
  Future<bool> isFavorite(String productID);
  Future<String?> getToken();
  Future<LoginResponse?> login(String email, String password);
  Future<bool> resetPassword(String oldPassword, String password);
  Future<UserResponse?> otpVerify(String email, String hash, String otp);
  Future<UserModel?> getAnotherUser(String id);

  Future<UserModel?> getUser();
  Future<bool> setFavorite(bool isFavorite, String productID);
  Future<void> logout();
  Future<bool> shopRegistration(
      String address, String phoneNumber, String shopName);

  Future<bool> register(String email, String password);
}

class UserNotFoundException implements Exception {}

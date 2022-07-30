import 'package:auth_api/auth_api.dart';

/// {@endtemplate}
class AuthRepository {
  /// {@macro products_repository}
  const AuthRepository({
    required RemoteUserApi authApi,
  }) : _authApi = authApi;

  Future<bool> resetPassword(String oldPassword, String password) =>
      _authApi.resetPassword(oldPassword, password);

  Future<UserModel?> getAnotherUser(String id) =>
      _authApi.getAnotherUser(id);
  Future<bool> setFavorite(bool isFavorite, String productID) =>
      _authApi.setFavorite(isFavorite, productID);
  Future<bool> shopRegistration(
          String address, String phoneNumber, String shopName) =>
      _authApi.shopRegistration(address, phoneNumber, shopName);
  final RemoteUserApi _authApi;
  Future<bool> isFavorite(String productID) => _authApi.isFavorite(productID);
  Future<LoginResponse?> login(String email, String password) =>
      _authApi.login(email, password);

  Future<UserResponse?> otpVerify(String email, String hash, String otp) =>
      _authApi.otpVerify(email, hash, otp);

  Future<UserModel?> getUser() => _authApi.getUser();

  Future<void> logout() => _authApi.logout();

  Future<bool> register(String email, String password) =>
      _authApi.register(email, password);
}

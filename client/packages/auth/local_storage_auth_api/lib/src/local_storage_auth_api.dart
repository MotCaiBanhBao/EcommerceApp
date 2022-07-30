import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LocalStorageAuthApi {
  static LocalStorageAuthApi? _instance;

  LocalStorageAuthApi._internal() {
    _instance = this;
  }

  factory LocalStorageAuthApi() => _instance ?? LocalStorageAuthApi._internal();

  final FlutterSecureStorage _storage = const FlutterSecureStorage();
  static const _tokenKey = 'TOKEN';
  static const _emailKey = 'EMAIL';
  static const _isShopKey = 'ISSHOP';

  Future<void> persistEmailAndToken(
      String? email, String? token, String? isShop) async {
    await _storage.write(key: _emailKey, value: email);
    await _storage.write(key: _isShopKey, value: isShop.toString());
    await _storage.write(key: _tokenKey, value: token);
  }

  Future<void> addIsShop() async {
    await _storage.write(key: _isShopKey, value: true.toString());
  }

  Future<bool> hasToken() async {
    var value = await _storage.read(key: _tokenKey);
    return value != null;
  }

  Future<bool> isShop() async {
    var value = await _storage.read(key: _isShopKey);
    print(value);
    return (value != null && value == 'true');
  }

  Future<bool> hasEmail() async {
    var value = await _storage.read(key: _emailKey);
    return value != null;
  }

  Future<void> deleteToken() async {
    return _storage.delete(key: _tokenKey);
  }

  Future<void> deleteEmail() async {
    return await _storage.delete(key: _emailKey);
  }

  Future<String?> getEmail() async {
    return await _storage.read(key: _emailKey);
  }

  Future<String?> getToken() async {
    return await _storage.read(key: _tokenKey);
  }

  Future<void> deleteAll() async {
    return await _storage.deleteAll();
  }
}

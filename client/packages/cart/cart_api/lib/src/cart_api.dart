import 'package:cart_api/src/models/cart_model.dart';

abstract class CartApi {
  const CartApi();
  Stream<CartModel> getCart();
  Future<void> saveCartItem(ProductItem item);

  Future<void> deleteCartItem(String id, String publisher);

  Future<void> deleteAllItem();
  Future<void> updateQuantity(num counter, String id, String publisher);
  Future<void> updateChoose(bool isCheck, String id, String publisher);
}

class TodoNotFoundException implements Exception {}

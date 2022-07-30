import 'package:cart_api/cart_api.dart';

class CartRepository {
  /// {@macro todos_repository}
  const CartRepository({
    required CartApi cartApi,
  }) : _cartApi = cartApi;

  final CartApi _cartApi;

  Stream<CartModel> getCart() => _cartApi.getCart();

  Future<void> saveCartItem(ProductItem item) => _cartApi.saveCartItem(item);

  Future<void> deleteCartItem(String id, String publisher) =>
      _cartApi.deleteCartItem(id, publisher);

  Future<void> deleteAllItem() => _cartApi.deleteAllItem();
  Future<void> updateQuantity(num counter, String id, String publisher) =>
      _cartApi.updateQuantity(counter, id, publisher);

  Future<void> updateChoose(bool isCheck, String id, String publisher) =>
      _cartApi.updateChoose(isCheck, id, publisher);
}

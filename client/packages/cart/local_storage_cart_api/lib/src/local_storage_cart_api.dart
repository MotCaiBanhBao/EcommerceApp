import 'dart:async';
import 'dart:convert';

import 'package:cart_api/cart_api.dart';
import 'package:meta/meta.dart';
import 'package:rxdart/subjects.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageCartApi extends CartApi {
  LocalStorageCartApi({
    required SharedPreferences plugin,
  }) : _plugin = plugin {
    _init();
  }

  final SharedPreferences _plugin;

  final _cartStreamController =
      BehaviorSubject<CartModel>.seeded(CartModel(items: []));

  @visibleForTesting
  static const kCartCollectionKey = '__cart_collection_key__';

  String? _getValue(String key) => _plugin.getString(key);
  Future<void> _setValue(String key, String value) =>
      _plugin.setString(key, value);

  void _init() {
    final todosJson = _getValue(kCartCollectionKey);
    if (todosJson != null) {
      final carts = CartModel.fromJson(json.decode(todosJson));
      print('/...');
      print(carts);
      _cartStreamController.add(carts);
    } else {
      _cartStreamController.add(CartModel(items: []));
    }
  }

  @override
  Stream<CartModel> getCart() => _cartStreamController.asBroadcastStream();

  @override
  Future<void> saveCartItem(ProductItem item) {
    final cart = _cartStreamController.value;
    var listItem = List<Items>.from(cart.items);

    for (var element in listItem) {
      if (element.publisherId == item.publisherId) {
        var after = List<ProductItem>.from(element.productItems);
        for (final data in element.productItems) {
          if (data.productId == item.productId) {
            if (data.variation == item.variation) {
              var newElement = data;
              var newQuantity = newElement.quantity! + data.quantity!;

              newElement.quantity = newQuantity;

              after.remove(data);
              after.add(newElement);

              cart.items[cart.items.indexOf(element)].productItems = after;

              cart.bill = _billCal(cart.items);
              _cartStreamController.add(cart);
              return _setValue(kCartCollectionKey, json.encode(cart));
            }
          }
        }

        after.add(item);
        cart.items[cart.items.indexOf(element)].productItems = after;
        cart.bill = _billCal(cart.items);
        _cartStreamController.add(cart);
        return _setValue(kCartCollectionKey, json.encode(cart));
      }
    }
    listItem.add(Items(productItems: [item], publisherId: item.publisherId));
    cart.items = listItem;
    cart.bill = _billCal(cart.items);
    _cartStreamController.add(cart);
    return _setValue(kCartCollectionKey, json.encode(cart));
  }

  num _billCal(List<Items> items) {
    num bill = 0;
    for (var item in items) {
      for (final product in item.productItems) {
        if (product.isCheck) {
          bill += (product.quantity! * product.price!);
        }
      }
    }

    return bill;
  }

  @override
  Future<void> deleteAllItem() async {
    final cart = _cartStreamController.value;
    cart.items = [];
    return _setValue(kCartCollectionKey, json.encode(cart));
  }

  @override
  Future<void> deleteCartItem(String id, String publisher) async {
    final cart = _cartStreamController.value;

    for (final item in cart.items) {
      if (item.publisherId == publisher) {
        item.productItems.removeWhere((element) => element.id == id);
        final index = cart.items.indexOf(item);
        cart.items[index] = item;
      }
    }
    cart.bill = _billCal(cart.items);
    _cartStreamController.add(cart);
    return _setValue(kCartCollectionKey, json.encode(cart));
  }

  @override
  Future<void> updateQuantity(num counter, String id, String publisher) {
    print("${[counter, id]}");
    final cart = _cartStreamController.value;

    for (final item in cart.items) {
      if (item.publisherId == publisher) {
        var index = item.productItems.indexWhere((element) => element.id == id);

        if ((item.productItems[index].stock ?? 0) <= counter) {
          return _setValue(kCartCollectionKey, json.encode(cart));
        }
        item.productItems[index].quantity = counter as int?;

        final indexProduct = cart.items.indexOf(item);
        cart.items[indexProduct] = item;

        cart.bill = _billCal(cart.items);
        _cartStreamController.add(cart);
        return _setValue(kCartCollectionKey, json.encode(cart));
      }
    }

    _cartStreamController.add(cart);
    return _setValue(kCartCollectionKey, json.encode(cart));
  }

  @override
  Future<void> updateChoose(bool isCheck, String id, String publisher) {
    final cart = _cartStreamController.value;
    for (final item in cart.items) {
      if (item.publisherId == publisher) {
        var index = item.productItems.indexWhere((element) => element.id == id);
        item.productItems[index].isCheck = isCheck;
        final indexProduct = cart.items.indexOf(item);
        cart.items[indexProduct] = item;
        cart.bill = _billCal(cart.items);
        _cartStreamController.add(cart);
        return _setValue(kCartCollectionKey, json.encode(cart));
      }
    }

    _cartStreamController.add(cart);
    return _setValue(kCartCollectionKey, json.encode(cart));
  }
}

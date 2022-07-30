part of 'shop_products_bloc.dart';

@freezed
class ShopProductsEvent with _$ShopProductsEvent {
  const factory ShopProductsEvent.started() = _Started;
  const factory ShopProductsEvent.deleteProduct(String id) = _DeleteProduct;
  const factory ShopProductsEvent.addProduct(
      XFile avatar,
      List<XFile> productImage,
      String address,
      String title,
      String description,
      String price,
      String category,
      String variations,
      String stock,
      String shippingDetails) = _AddProduct;
}

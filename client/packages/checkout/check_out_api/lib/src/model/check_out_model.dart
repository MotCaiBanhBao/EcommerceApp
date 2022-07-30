class CheckOutModel {
  List<ShopProductItems?> items = [];
  DateTime? dateAdd;
  String? userID;
  ShippingAddress shippingAdress = ShippingAddress('', '');

  num get getTotalBill {
    if (items.isEmpty) {
      return 0;
    }
    num totalBill = 0;
    for (final item in items) {
      totalBill += ((item == null) ? 0 : item.getShopTotalBill);
    }

    return totalBill;
  }

  CheckOutModel(
      {required this.items, this.dateAdd, required this.shippingAdress});

  CheckOutModel.fromJson(Map<String, dynamic> json) {
    if (json['items'] != null) {
      items = <ShopProductItems>[];
      json['items'].forEach((v) {
        items.add(ShopProductItems.fromJson(v));
      });
    }
    shippingAdress = ShippingAddress.fromJson(json['shipping_address']);
    userID = json['user_id'];
    dateAdd = json['date_add'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (items != null) {
      data['items'] = items.map((v) => v?.toJson()).toList();
    }
    data['shipping_address'] = shippingAdress.toJson();
    data['bill'] = getTotalBill;

    return data;
  }
}

class ShippingAddress {
  String address = '';
  String phoneNumber = '';

  ShippingAddress(this.address, this.phoneNumber);

  ShippingAddress.fromJson(Map<String, dynamic> json) {
    address = json['address'];
    phoneNumber = json['phone_number'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['address'] = address;
    data['phone_number'] = phoneNumber;
    return data;
  }
}

class ShopProductItems {
  List<ItemData>? items = [];
  String? publisherId;
  String? id;
  num shopProductTotalBill = 0;

  String get getAvatar {
    return items?[0].productImage ??
        'https://res.cloudinary.com/luongvany/image/upload/v1658827434/default-product-image_yisxlz.png';
  }

  num get getShopTotalBill {
    num totalBill = 0;
    if (items == null || items!.isEmpty) {
      return 0;
    }
    for (final item in items!) {
      totalBill += ((item.price ?? 0) * (item.quantity ?? 1).toInt());
    }

    return totalBill;
  }

  ShopProductItems({
    this.items,
    this.publisherId,
  });

  ShopProductItems.fromJson(Map<String, dynamic> json) {
    publisherId = json['publisher_id'];
    if (json['items'] != null) {
      items = <ItemData>[];
      json['items'].forEach((v) {
        items!.add(ItemData.fromJson(v));
      });
    }
    id = json['id'] ?? '0';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['publisher_id'] = publisherId;
    if (items != null) {
      data['items'] = items!.map((v) => v.toJson()).toList();
    }
    data['avatar'] = getAvatar;
    data['bill'] = getShopTotalBill;
    // data['id'] = id;
    // data['product_image'] = productImage;
    return data;
  }
}

class ItemData {
  String? productId;
  String? name;
  String? variation;
  String? productImage;
  int? quantity;
  num? price;
  String? variationData;

  String get getVariationData =>
      (variationData == null || variationData == "null")
          ? 'Default'
          : variationData!;

  ItemData(
      {this.price,
      this.productId,
      this.name,
      this.productImage,
      this.quantity,
      this.variation,
      this.variationData});

  ItemData.fromJson(Map<String, dynamic> json) {
    productId = json['product_id'];
    name = json['name'];
    variation = json['variation_id'];
    quantity = json['quantity'];
    price = json['price'];
    productImage = json['product_image'];
    variationData = json['variation_data'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['product_id'] = productId;
    data['name'] = name;
    // data['variation_id'] = variation;
    data['quantity'] = quantity;
    data['price'] = price;
    // data['id'] = id;
    // data['product_image'] = productImage;
    data['variation_data'] = variationData;
    return data;
  }
}

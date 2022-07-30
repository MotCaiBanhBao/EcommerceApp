class OrderModel {
  ShippingAddress? shippingAddress;
  bool? isConfirm;
  bool? isCalled;
  String? id;
  String? userId;
  String? publisherId;
  List<Items>? items;
  String? bill;
  bool? isDelivered;
  String? status;
  String? dateAdded;
  String? avatar;
  String? user_get_at;

  OrderModel(
      {this.shippingAddress,
      this.isConfirm,
      this.isCalled,
      this.userId,
      this.publisherId,
      this.items,
      this.bill,
      this.isDelivered,
      this.status,
      this.dateAdded});

  OrderModel.fromJson(Map<String, dynamic> json) {
    shippingAddress = json['shipping_address'] != null
        ? ShippingAddress.fromJson(json['shipping_address'])
        : null;
    isConfirm = json['is_confirm'];
    isCalled = json['is_called'];
    id = json['_id'];
    userId = json['user_id'];
    publisherId = json['publisher_id'];
    if (json['items'] != null) {
      items = <Items>[];
      json['items'].forEach((v) {
        items!.add(Items.fromJson(v));
      });
    }
    user_get_at = json['user_get_at'];
    bill = json['bill'];
    avatar = json['avatar'];
    isDelivered = json['is_delivered'];
    status = json['status'];
    dateAdded = json['date_added'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (shippingAddress != null) {
      data['shipping_address'] = shippingAddress!.toJson();
    }
    data['is_confirm'] = isConfirm;
    data['is_called'] = isCalled;
    data['user_id'] = userId;
    data['publisher_id'] = publisherId;
    data['avatar'] = avatar;
    if (items != null) {
      data['items'] = items!.map((v) => v.toJson()).toList();
    }
    data['bill'] = bill;
    data['is_delivered'] = isDelivered;
    data['status'] = status;
    data['date_added'] = dateAdded;
    return data;
  }
}

class ShippingAddress {
  String? address;
  String? phoneNumber;

  ShippingAddress({this.address, this.phoneNumber});

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

class Items {
  String? productId;
  String? name;
  int? quantity;
  String? price;
  String? variationData;
  String? id;

  Items(
      {this.productId,
      this.name,
      this.quantity,
      this.price,
      this.variationData,
      this.id});

  Items.fromJson(Map<String, dynamic> json) {
    productId = json['product_id'];
    name = json['name'];
    quantity = json['quantity'];
    price = json['price'];
    variationData = json['variation_data'];
    id = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['product_id'] = productId;
    data['name'] = name;
    data['quantity'] = quantity;
    data['price'] = price;
    data['variation_data'] = variationData;
    data['_id'] = id;
    return data;
  }
}

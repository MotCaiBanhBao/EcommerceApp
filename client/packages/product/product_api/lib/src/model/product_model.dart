import 'rate.dart';
import 'variations.dart';

class ProductModel {
  String? address;
  Rate? rate;
  String? id;
  Variations? variations;
  String? title;
  String? avatar;
  List<String>? productImage;
  String? description;
  String? category;
  num? price;
  String? dateAdded;
  List<String>? subCategory;
  String? publisher;
  num? stock;
  num? sold;
  num? cancell;

  ProductModel(
      {this.variations,
      this.rate,
      this.id,
      this.title,
      this.avatar,
      this.productImage,
      this.description,
      this.category,
      this.subCategory,
      this.price,
      this.publisher,
      this.sold,
      this.cancell,
      this.stock,
      this.dateAdded});

  ProductModel.fromJson(Map<String, dynamic> json) {
    variations = json['variations'] != null
        ? Variations.fromJson(json['variations'])
        : null;
    rate = json['rate'] != null ? Rate.fromJson(json['rate']) : null;
    id = json['_id'];
    title = json['title'];
    avatar = json['avatar'];
    cancell = json['cancell'];
    sold = json['sold'];
    productImage = productImage = json['product_image'] == null
        ? null
        : List<String>.from(json["product_image"].map((x) => x));
    description = json['description'];
    category = json['category'];
    if (json['sub_category'] != null) {
      subCategory = <String>[];
      json['sub_category'].forEach((v) {
        subCategory!.add(v);
      });
    }
    price = json['price'];
    publisher = json['publisher'];
    stock = json['stock'];
    dateAdded = json['date_added'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (variations != null) {
      data['variations'] = variations!.toJson();
    }
    if (rate != null) {
      data['rate'] = rate!.toJson();
    }
    data['_id'] = id;
    data['title'] = title;
    data['avatar'] = avatar;
    data['product_image'] = productImage;
    data['description'] = description;
    data['category'] = category;
    if (subCategory != null) {
      data['sub_category'] = subCategory!.map((v) => v).toList();
    }
    data['price'] = price;
    data['publisher'] = publisher;
    data['stock'] = stock;
    data['date_added'] = dateAdded;
    return data;
  }
}

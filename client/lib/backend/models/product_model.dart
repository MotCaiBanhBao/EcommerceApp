class ProductModel {
  String? id;
  String? title;
  String? avatar;
  List<String>? productImage;
  String? description;
  String? category;
  int? price;
  Rate? rate;
  String? dateAdded;

  @override
  String toString() {
    return "$id $title $avatar $productImage $description $category $price $rate $dateAdded";
  }

  ProductModel(
      {this.id,
      this.title,
      this.avatar,
      this.productImage,
      this.description,
      this.category,
      this.price,
      this.rate,
      this.dateAdded});

  ProductModel.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    title = json['title'];
    avatar = json['avatar'];
    productImage = json['product_image'].cast<String>();
    description = json['description'];
    category = json['category'];
    price = json['price'];
    rate = json['rate'] != null ? Rate.fromJson(json['rate']) : null;
    dateAdded = json['date_added'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = id;
    data['title'] = title;
    data['avatar'] = avatar;
    data['product_image'] = productImage;
    data['description'] = description;
    data['category'] = category;
    data['price'] = price;
    if (rate != null) {
      data['rate'] = rate!.toJson();
    }
    data['date_added'] = dateAdded;
    return data;
  }
}

class Rate {
  int? totalRate;
  History? history;
  int? numberOfReview;

  Rate({this.totalRate, this.history, this.numberOfReview});

  Rate.fromJson(Map<String, dynamic> json) {
    totalRate = json['totalRate'];
    history =
        json['history'] != null ? History.fromJson(json['history']) : null;
    numberOfReview = json['numberOfReview'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['totalRate'] = totalRate;
    if (history != null) {
      data['history'] = history!.toJson();
    }
    data['numberOfReview'] = numberOfReview;
    return data;
  }
}

class History {
  int? numberOfReview;
  List<Data>? data;

  History({this.numberOfReview, this.data});

  History.fromJson(Map<String, dynamic> json) {
    numberOfReview = json['numberOfReview'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['numberOfReview'] = this.numberOfReview;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? rate;
  String? id;

  Data({this.rate, this.id});

  Data.fromJson(Map<String, dynamic> json) {
    rate = json['rate'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['rate'] = rate;
    data['id'] = id;
    return data;
  }
}

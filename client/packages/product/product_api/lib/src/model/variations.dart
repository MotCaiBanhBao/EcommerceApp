class Variations {
  List<CombineData>? combineData;
  List<ListVariation>? listVariation;

  Variations({this.combineData, this.listVariation});

  Variations.fromJson(Map<String, dynamic> json) {
    if (json['combineData'] != null) {
      combineData = <CombineData>[];
      json['combineData'].forEach((v) {
        combineData!.add(CombineData.fromJson(v));
      });
    }
    if (json['list_variation'] != null) {
      listVariation = <ListVariation>[];
      json['list_variation'].forEach((v) {
        listVariation!.add(ListVariation.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (combineData != null) {
      data['combineData'] = combineData!.map((v) => v.toJson()).toList();
    }
    if (listVariation != null) {
      data['list_variation'] = listVariation!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

extension GetVariationImage on List<VariationsData> {
  String? getImage() {
    for (var data in this) {
      if (data.productImage != null) return data.productImage;
    }
    return null;
  }
}

class CombineData {
  List<String>? nameOfvariation;
  List<String>? combine;
  int? price;
  int? stock;
  String? id;

  CombineData({this.nameOfvariation, this.combine, this.price, this.stock});

  CombineData.fromJson(Map<String, dynamic> json) {
    nameOfvariation = json['nameOfvariation'] == null
        ? null
        : List<String>.from(json["nameOfvariation"].map((x) => x));
    combine = json['combine'] == null
        ? null
        : List<String>.from(json["combine"].map((x) => x));
    price = json['price'];
    stock = json['stock'];
    id = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['nameOfvariation'] = nameOfvariation;
    data['combine'] = combine;
    data['price'] = price;
    data['stock'] = stock;
    data['_id'] = id;
    return data;
  }
}

class ListVariation {
  String? variationName;
  List<VariationsData>? variationsData;
  String? id;

  ListVariation({this.variationName, this.variationsData, this.id});

  ListVariation.fromJson(Map<String, dynamic> json) {
    variationName = json['variation_name'];
    if (json['variation_data'] != null) {
      variationsData = <VariationsData>[];
      json['variation_data'].forEach((v) {
        variationsData!.add(VariationsData.fromJson(v));
      });
    }

    id = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['variation_name'] = variationName;
    if (variationsData != null) {
      data['variation_data'] = variationsData!.map((v) => v.toJson()).toList();
    }
    data['_id'] = id;
    return data;
  }
}

class VariationsData {
  String? name;
  String? productImage;
  String? id;

  VariationsData({this.name, this.productImage, this.id});

  VariationsData.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    productImage = json['product_image'];
    id = json['_id'];
  }

  @override
  String toString() {
    return name ?? '';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['product_image'] = productImage;
    data['_id'] = id;
    return data;
  }
}

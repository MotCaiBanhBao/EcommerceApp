import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../models/product_model.dart';
import '../data/repository/popular_product_repo.dart';

class PopularProductController extends GetxController {
  final PopularProductRepo popularProductRepo;
  PopularProductController({required this.popularProductRepo});
  List<dynamic> _popularProductList = [];
  List<dynamic> get popularProductList => _popularProductList;
  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;
  static PopularProductController get to => Get.find();

  @override
  onInit() {
    getPopularProduct();
    super.onInit();
  }

  Future<void> getPopularProduct() async {
    debugPrint("Get popular product data");
    Response response = await popularProductRepo.getPopularProductList();
    debugPrint(response.statusCode.toString());
    if (response.statusCode == 200) {
      _popularProductList = [];

      response.body.forEach((product) {
        _popularProductList.add(ProductModel.fromJson(product));
      });
      for (var element in _popularProductList) {
        debugPrint(element.toString());
      }
      _isLoaded = true;
      update();
    } else {
      debugPrint("Không thể lấy");
    }
  }
}

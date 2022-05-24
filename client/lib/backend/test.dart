// GetBuilder<PopularProductController>(builder: (popularProduct) {
//               return popularProduct.isLoaded
//                   ? Expanded(
//                       child: Image.network(ApiHelper.getImageStreamURI(
//                           popularProduct
//                               .popularProductList[0].productImage[0])))
//                   : const CircularProgressIndicator(color: kPrimaryColor);
//             }),
//DotIndication
//Get.find<PopularProductController>().getPopularProduct();
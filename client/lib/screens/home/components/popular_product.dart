import 'package:client/backend/controller/popular_product_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/components/product_card.dart';

import '../../../size_config.dart';
import 'section_title.dart';

class PopularProducts extends StatelessWidget {
  const PopularProducts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: SectionTitle(title: "Popular Products", press: () {}),
        ),
        SizedBox(height: getProportionateScreenWidth(20)),
        GetBuilder<PopularProductController>(builder: (products) {
          return products.isLoaded
              ? SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      ...List.generate(
                        products.popularProductList.length,
                        (index) {
                          // if (demoProducts[index].isPopular)
                          return ProductCard(
                              product: products.popularProductList[index]);
                          // return SizedBox
                          //     .shrink(); // here by default width and height is 0
                        },
                      ),
                      SizedBox(width: getProportionateScreenWidth(20)),
                    ],
                  ),
                )
              : const CircularProgressIndicator();
        })
      ],
    );
  }
}

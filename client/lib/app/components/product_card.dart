import 'package:auto_route/auto_route.dart';
import 'package:client/app/components/default_loading_image.dart';
import 'package:client/app/routes/routes.gr.dart';
import 'package:flutter/material.dart';
import 'package:product_api/product_api.dart';
import '../../size_config.dart';
import 'default_image.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    Key? key,
    this.width = 140,
    this.aspectRetio = 1.02,
    required this.product,
  }) : super(key: key);

  final double width, aspectRetio;
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: getProportionateScreenWidth(20)),
      child: SizedBox(
        width: getProportionateScreenWidth(width),
        child: GestureDetector(
          onTap: (() {
            context.pushRoute(DetailsWrapperRoute(product: product));
          }),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AspectRatio(
                aspectRatio: 1.02,
                child: Container(
                    padding: EdgeInsets.all(getProportionateScreenWidth(20)),
                    decoration: BoxDecoration(
                      color: Theme.of(context)
                          .colorScheme
                          .secondary
                          .withOpacity(0.1),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: product.avatar != null
                        ? DefaultInternetImage(
                            imageUri: product.avatar!,
                            tagId: product.id.toString(),
                          )
                        : const DefaultLoadingImage()
                    // child: Hero(
                    //   tag: product.id.toString(),
                    //   child: product.avatar != null
                    //       ? CachedNetworkImage(
                    //           imageUrl: product.avatar!,
                    //           placeholder: (context, url) =>
                    //               Image.asset('assets/images/logo.png',),
                    //           errorWidget: (context, url, error) =>
                    //               const Icon(Icons.error),
                    //         )
                    //       : const CircularProgressIndicator(),
                    // ),
                    ),
              ),
              const SizedBox(height: 10),
              Text(
                product.title ?? "Null",
                style: const TextStyle(color: Colors.black),
                maxLines: 2,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "đ${product.price}",
                    style: TextStyle(
                      fontSize: getProportionateScreenWidth(18),
                      fontWeight: FontWeight.w600,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  // InkWell(
                  //   borderRadius: BorderRadius.circular(50),
                  //   onTap: () {},
                  //   child: Container(
                  //     padding: EdgeInsets.all(getProportionateScreenWidth(8)),
                  //     height: getProportionateScreenWidth(28),
                  //     width: getProportionateScreenWidth(28),
                  //     decoration: BoxDecoration(
                  //       color: product.isFavourite
                  //           ? kPrimaryColor.withOpacity(0.15)
                  //           : kSecondaryColor.withOpacity(0.1),
                  //       shape: BoxShape.circle,
                  //     ),
                  //     child: SvgPicture.asset(
                  //       "assets/icons/Heart Icon_2.svg",
                  //       color: product.isFavourite
                  //           ? Color(0xFFFF4848)
                  //           : Color(0xFFDBDEE4),
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

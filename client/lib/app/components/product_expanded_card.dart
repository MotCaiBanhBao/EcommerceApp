import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:product_api/product_api.dart';
import 'package:products_repository/products_repository.dart';
import 'package:auto_route/auto_route.dart';

import '../../size_config.dart';
import '../helper/constants.dart';
import '../routes/routes.gr.dart';
import 'default_loading_image.dart';

class ProductExpandedCard extends StatelessWidget {
  const ProductExpandedCard({Key? key, required this.data}) : super(key: key);
  final ProductModel data;
  // late AnimationController _controller;
  // late Animation _animation;

  // @override
  // void initState() {
  //   super.initState();
  //   _controller = AnimationController(
  //       duration: const Duration(milliseconds: 200), vsync: this);
  //   _animation = Tween(begin: 150.0, end: 260.0).animate(CurvedAnimation(
  //       parent: _controller,
  //       curve: Curves.easeOut,
  //       reverseCurve: Curves.easeOut));

  //   _controller.addListener(() {
  //     setState(() {});
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 7,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: GestureDetector(
        onTap: () {
          context.pushRoute(DetailsWrapperRoute(product: data));
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Hero(
            //   tag: product.id.toString(),
            //   child: product.avatar != null
            //       ? CachedNetworkImage(
            //           imageUrl:
            //               ApiHelper.getImageStreamURI(product.avatar!),
            //           placeholder: (context, url) =>
            //               const CircularProgressIndicator(),
            //           errorWidget: (context, url, error) =>
            //               const Icon(Icons.error),
            //         )
            //       : const CircularProgressIndicator(),
            // )
            Hero(
              tag: Random().nextInt(1000),
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                ),
                child: CachedNetworkImage(
                  imageUrl: data.avatar!,
                  placeholder: (context, url) => const DefaultLoadingImage(),
                  errorWidget: (context, url, error) {
                    print(error);
                    print(url);
                    return const Icon(Icons.error);
                  },
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(getProportionateScreenWidth(10)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(data.title!,
                      style: const TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                      softWrap: true,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis),
                  Text(
                    'đ${data.price}',
                    style: TextStyle(
                      fontSize: getProportionateScreenWidth(15),
                      fontWeight: FontWeight.w400,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '🌟${data.rate?.totalRate} / (${data.rate?.history?.numberOfReview ?? 0})',
                        style: TextStyle(fontWeight: FontWeight.w300),
                        softWrap: true,
                        maxLines: 1,
                      ),
                      Text(
                        '${data.sold} sold',
                        style: TextStyle(
                          fontWeight: FontWeight.w300,
                        ),
                        softWrap: true,
                        maxLines: 1,
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

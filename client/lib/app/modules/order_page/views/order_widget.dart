import 'dart:math';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/svg.dart';
import 'package:order_api/order_api.dart';
import 'package:product_api/product_api.dart';

import '../../../../size_config.dart';
import '../../../components/default_image.dart';
import '../../../helper/constants.dart';
import '../../../routes/routes.gr.dart';

class OrderCard extends StatelessWidget {
  const OrderCard({Key? key, required this.order}) : super(key: key);
  final OrderModel order;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(children: [
        SizedBox(height: getProportionateScreenHeight(20)),
        Column(children: [
          Container(
              color: Colors.grey[100],
              padding: const EdgeInsets.only(bottom: 10),
              child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: defaultPadding),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: () {
                            AutoRouter.of(context).push(
                                OrderDetailWrapperRoute(orderID: order.id!));
                          },
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 5.0),
                                child: SvgPicture.asset(
                                  'assets/icons/Shop Icon.svg',
                                ),
                              ),
                              Flexible(
                                child: Text(
                                    softWrap: false,
                                    overflow: TextOverflow.ellipsis,
                                    style:
                                        Theme.of(context).textTheme.headline6,
                                    order.id ?? 'YShop'),
                              ),
                            ],
                          ),
                        ),
                        const Divider(height: 10.0, thickness: 1.0),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              SizedBox(
                                width: 88,
                                child: AspectRatio(
                                  aspectRatio: 0.88,
                                  child: Container(
                                    padding: EdgeInsets.all(
                                        getProportionateScreenWidth(10)),
                                    decoration: BoxDecoration(
                                      color: const Color(0xFFF5F6F9),
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: DefaultInternetImage(
                                        imageUri: order.avatar ?? '',
                                        tagId: order.avatar ??
                                            Random().nextInt(100).toString()),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 20),
                              Expanded(
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      order.items?[0].name ?? '',
                                      style: const TextStyle(
                                          color: Colors.black, fontSize: 16),
                                      maxLines: 2,
                                    ),
                                    const SizedBox(height: 10),
                                    Text(
                                      order.items?[0].variationData ??
                                          'Default',
                                      style: const TextStyle(
                                          color: Colors.grey, fontSize: 13),
                                    ),
                                    IntrinsicHeight(
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "\đ${order.items?[0].price} x${order.items?[0].quantity}",
                                            style: const TextStyle(
                                                fontWeight: FontWeight.w600),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        Text('${order.items?.length} sản phẩm'),
                        Divider(),
                        Text(
                          'Trạng thái: ${order.status}',
                          style: TextStyle(color: Colors.red),
                        ),
                        Divider(),
                        Text('Thành tiền: ${order.bill}')
                      ])))
        ]),
      ]),
    );
  }
}

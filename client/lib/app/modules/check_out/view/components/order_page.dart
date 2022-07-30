import 'dart:math';

import 'package:auto_route/auto_route.dart';
import 'package:client/app/modules/check_out/bloc/check_out_bloc.dart';
import 'package:client/app/modules/check_out/cubit/checkout_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:product_api/product_api.dart';

import '../../../../../size_config.dart';
import '../../../../components/coupon.dart';
import '../../../../components/default_button.dart';
import '../../../../components/default_image.dart';
import '../../../../helper/constants.dart';
import '../../../../routes/routes.gr.dart';
import '../../../cart/views/components/cart_card.dart';

class OrderPage extends StatelessWidget {
  const OrderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget _buildVoucher() {
      return Padding(
        padding: EdgeInsets.all(defaultPadding),
        child: Padding(
          padding: EdgeInsets.all(defaultPadding),
          child: Container(
            color: Colors.white,
            height: getProportionateScreenHeight(400.0),
            child: Column(
              children: [
                SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: [
                      HorizontalCoupon(
                          kindCoupon: 'Free ship',
                          minspend: '20000',
                          outvalid: '24/2',
                          percent: '30%'),
                      const SizedBox(
                        height: 10,
                      ),
                      HorizontalCoupon(
                          kindCoupon: 'Giam gia',
                          minspend: '20000',
                          outvalid: '24/2',
                          percent: '30%'),
                      const SizedBox(
                        height: 10,
                      ),
                      HorizontalCoupon(
                          kindCoupon: 'Giam gia',
                          minspend: '20000',
                          outvalid: '24/2',
                          percent: '30%'),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }

    return BlocBuilder<CheckOutBloc, CheckOutState>(builder: (context, state) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            height: getProportionateScreenHeight(400),
            child: ListView.builder(
                itemCount: state.order?.items.length ?? 0,
                itemBuilder: (context, index) => Container(
                    color: Colors.grey[100],
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: defaultPadding),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              GestureDetector(
                                onTap: () {},
                                child: Row(
                                  children: [
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(right: 5.0),
                                      child: SvgPicture.asset(
                                        'assets/icons/Shop Icon.svg',
                                      ),
                                    ),
                                    Flexible(
                                      child: Text(
                                          softWrap: false,
                                          overflow: TextOverflow.ellipsis,
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline6,
                                          state.order?.items[index]
                                                  ?.publisherId ??
                                              'YShop'),
                                    ),
                                  ],
                                ),
                              ),
                              const Divider(height: 10.0, thickness: 1.0),
                              ListView.builder(
                                primary: false,
                                shrinkWrap: true,
                                itemCount:
                                    state.order?.items[index]?.items?.length ??
                                        0,
                                itemBuilder: (context, item) => Padding(
                                  padding: const EdgeInsets.only(bottom: 10),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      GestureDetector(
                                        onTap: () => AutoRouter.of(context)
                                            .push(DetailsWrapperRoute(
                                                product: ProductModel(
                                                    id: state
                                                        .order
                                                        ?.items[index]
                                                        ?.items![item]
                                                        .productId))),
                                        child: SizedBox(
                                          width: 88,
                                          child: AspectRatio(
                                            aspectRatio: 0.88,
                                            child: Container(
                                              padding: EdgeInsets.all(
                                                  getProportionateScreenWidth(
                                                      10)),
                                              decoration: BoxDecoration(
                                                color: const Color(0xFFF5F6F9),
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                              ),
                                              child: DefaultInternetImage(
                                                  imageUri: state
                                                          .order
                                                          ?.items[index]
                                                          ?.items![item]
                                                          .productImage ??
                                                      '',
                                                  tagId: state
                                                          .order
                                                          ?.items[index]
                                                          ?.items![item]
                                                          .productImage ??
                                                      Random()
                                                          .nextInt(100)
                                                          .toString()),
                                            ),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 20),
                                      Expanded(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              state.order?.items[index]
                                                      ?.items![item].name ??
                                                  '',
                                              style: const TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 16),
                                              maxLines: 2,
                                            ),
                                            const SizedBox(height: 10),
                                            Text(
                                              state
                                                      .order
                                                      ?.items[index]
                                                      ?.items![item]
                                                      .getVariationData ??
                                                  'Default',
                                              style: const TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 13),
                                            ),
                                            IntrinsicHeight(
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    "\đ${state.order?.items[index]?.items![item].price} x${state.order?.items[index]?.items![item].quantity}",
                                                    style: const TextStyle(
                                                        fontWeight:
                                                            FontWeight.w600),
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
                              ),
                            ])))
                // child:
                ),
          ),
          Container(
            padding: EdgeInsets.symmetric(
              vertical: getProportionateScreenWidth(15),
              horizontal: getProportionateScreenWidth(30),
            ),
            // height: 174,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.all(
                Radius.circular(30),
              ),
              boxShadow: [
                BoxShadow(
                  offset: const Offset(0, -15),
                  blurRadius: 20,
                  color: const Color(0xFFDADADA).withOpacity(0.15),
                )
              ],
            ),
            child: SafeArea(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10),
                        height: getProportionateScreenWidth(40),
                        width: getProportionateScreenWidth(40),
                        decoration: BoxDecoration(
                          color: const Color(0xFFF5F6F9),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: SvgPicture.asset("assets/icons/receipt.svg"),
                      ),
                      const Spacer(),
                      TextButton(
                          child: const Text("Add voucher code"),
                          onPressed: () => showModalBottomSheet<bool>(
                                enableDrag: false,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                isScrollControlled: true,
                                context: context,
                                builder: (context) => _buildVoucher(),
                              ).then((value) => print(value))),
                      const SizedBox(width: 10),
                      const Icon(
                        Icons.arrow_forward_ios,
                        size: 12,
                      )
                    ],
                  ),
                  SizedBox(height: getProportionateScreenHeight(20)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text.rich(
                        TextSpan(
                          text: "Total:\n",
                          children: [
                            TextSpan(
                              text: (state.order?.getTotalBill ?? 0).toString(),
                              style: const TextStyle(
                                  fontSize: 16, color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: getProportionateScreenWidth(190),
                        child: DefaultButton(
                          text: ">",
                          press: () {
                            context.read<CheckoutCubit>().stepContinued();
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      );
    });
  }
}

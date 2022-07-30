import 'package:auto_route/auto_route.dart';
import 'package:client/app/routes/routes.gr.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../translations/locale_keys.g.dart';
import '../../../../components/coupon.dart';
import '../../../../helper/constants.dart';
import '../../../../../size_config.dart';
import '../../../../components/default_button.dart';
import '../../bloc/cart_bloc.dart';

class CheckoutCard extends StatelessWidget {
  const CheckoutCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
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

        return Container(
          padding: EdgeInsets.symmetric(
            vertical: getProportionateScreenWidth(15),
            horizontal: getProportionateScreenWidth(30),
          ),
          // height: 174,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
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
                            text: (state.cartData?.bill ?? 0).toString(),
                            style: const TextStyle(
                                fontSize: 16, color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: getProportionateScreenWidth(190),
                      child: DefaultButton(
                        text: "Check Out",
                        press: () {
                          if (state.cartData?.items == null ||
                              state.cartData!.items.isEmpty ||
                              state.cartData!.items
                                  .every((element) => element.isNotCheckAll)) {
                            ScaffoldMessenger.of(context)
                              ..hideCurrentSnackBar()
                              ..showSnackBar(SnackBar(
                                content: Text(
                                  LocaleKeys.null_cart.tr(),
                                ),
                              ));
                          } else {
                            AutoRouter.of(context).push(
                                CheckOutWrapperRoute(cart: state.cartData!));
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

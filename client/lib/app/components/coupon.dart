import 'package:coupon_uikit/coupon_uikit.dart';
import 'package:dotted_decoration/dotted_decoration.dart';
import 'package:flutter/material.dart';

import '../../size_config.dart';
import '../helper/constants.dart';

class HorizontalCoupon extends StatelessWidget {
  HorizontalCoupon(
      {Key? key,
      required this.percent,
      required this.minspend,
      required this.outvalid,
      required this.kindCoupon})
      : super(key: key);
  String percent;
  String minspend;
  String outvalid;
  String kindCoupon;
  @override
  Widget build(BuildContext context) {
    const Color primaryColor = Color(0xffcbf3f0);
    const Color textColor = Color(0xff368f8b);

    return Padding(
      padding: EdgeInsets.only(left: getProportionateScreenWidth(10)),
      child: CouponCard(
        width: getProportionateScreenWidth(275),
        height: getProportionateScreenWidth(100),
        backgroundColor: primaryColor,
        curveAxis: Axis.vertical,
        firstChild: Container(
          decoration: DottedDecoration(
              linePosition: LinePosition.right, color: textColor),
          width: getProportionateScreenWidth(150),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      percent,
                      style: const TextStyle(
                        color: textColor,
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Min.spend $minspend',
                      softWrap: true,
                      maxLines: 1,
                      style: const TextStyle(
                        color: textColor,
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        secondChild: Container(
          width: double.maxFinite,
          padding: const EdgeInsets.all(18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                kindCoupon,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: textColor,
                ),
              ),
              const Text(
                'For specific items',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w400,
                  color: textColor,
                ),
              ),
              Text(
                'Valid Till $outvalid',
                style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w400,
                  color: textColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

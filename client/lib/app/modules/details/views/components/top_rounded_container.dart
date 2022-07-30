import 'package:flutter/material.dart';

import '../../../../../size_config.dart';
import '../../../../helper/constants.dart';

class TopRoundedContainer extends StatelessWidget {
  const TopRoundedContainer({
    Key? key,
    required this.color,
    required this.child,
  }) : super(key: key);

  final Color color;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          top: defaultPadding,
          left: getProportionateScreenWidth(10),
          right: getProportionateScreenWidth(10)),
      padding: EdgeInsets.only(top: defaultPadding),
      width: double.infinity,
      decoration: BoxDecoration(
        color: color,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
      ),
      child: child,
    );
  }
}

import 'package:flutter/material.dart';

import '../../../../../size_config.dart';
import '../helper/constants.dart';

class PaddingDefault extends StatelessWidget {
  const PaddingDefault({
    Key? key,
    required this.color,
    required this.child,
  }) : super(key: key);

  final Color color;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          Container(
            color: const Color(
              0xFFF5F6F9,
            ),
            height: getProportionateScreenHeight(10),
          ),
          Container(
            padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(10)),
            margin: EdgeInsets.only(top: defaultPadding),
            width: double.infinity,
            decoration: BoxDecoration(
              color: color,
            ),
            child: child,
          ),
        ],
      ),
    );
  }
}

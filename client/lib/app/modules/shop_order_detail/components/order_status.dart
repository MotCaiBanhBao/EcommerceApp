import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:order_api/order_api.dart';

import '../../../../../translations/locale_keys.g.dart';
import '../../../helper/constants.dart';

class OrderStatusWidget extends StatelessWidget {
  const OrderStatusWidget({Key? key, required this.status}) : super(key: key);
  final String status;
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.only(bottom: 10, top: 10),
        color: Colors.red,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: defaultPadding),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    LocaleKeys.order_status_txt.tr(),
                    style: Theme.of(context).textTheme.headline6,
                  ),
                ],
              ),
              Text(status, style: TextStyle(color: Colors.white)),
            ],
          ),
        ));
  }
}

import 'package:client/app/helper/extension.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:order_api/order_api.dart';

import '../../../../../translations/locale_keys.g.dart';
import '../../../helper/constants.dart';

class OrderDetailWidget extends StatelessWidget {
  OrderDetailWidget({Key? key, required this.orderID, required this.orderTime})
      : super(key: key);
  String orderID;
  String? orderTime;
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.grey[100],
        padding: const EdgeInsets.only(bottom: 10, top: 10),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: defaultPadding),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Order id:',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  Text(
                    orderID,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Order time:',
                  ),
                  Text(
                    orderTime != null ? orderTime!.parseLocalDate() : '',
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}

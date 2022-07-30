import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:order_api/order_api.dart';

import '../../../../../translations/locale_keys.g.dart';
import '../../../helper/constants.dart';

class ShippingAdressWidget extends StatelessWidget {
  const ShippingAdressWidget({Key? key, required this.shippingAddress})
      : super(key: key);
  final ShippingAddress shippingAddress;
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.only(bottom: 10),
        color: Colors.blue[50],
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: defaultPadding),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(right: 5.0),
                    child: Icon(Icons.local_shipping_rounded),
                  ),
                  Text(
                    LocaleKeys.shipping_address.tr(),
                    style: Theme.of(context).textTheme.headline6,
                  ),
                ],
              ),
              Text(shippingAddress.address!),
              Text(shippingAddress.phoneNumber!),
            ],
          ),
        ));
  }
}

import 'dart:math';

import 'package:auto_route/auto_route.dart';
import 'package:cart_repository/cart_repository.dart';
import 'package:cart_stepper/cart_stepper.dart';
import 'package:client/app/components/default_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_api/product_api.dart';
import 'package:products_repository/products_repository.dart';

import '../../../../../translations/locale_keys.g.dart';
import '../../../../helper/constants.dart';
import '../../../../../size_config.dart';
import '../../../../routes/routes.gr.dart';
import '../../bloc/cart_bloc.dart';

class CartCard extends StatelessWidget {
  const CartCard({
    Key? key,
    required this.productItem,
  }) : super(key: key);

  final ProductItem productItem;

  @override
  Widget build(BuildContext context) {
    Widget _buildStepper(int counter, Function onPress) {
      return CartStepperInt(
        count: counter,
        size: 30,
        style: CartStepperStyle.fromTheme(Theme.of(context)).copyWith(
          activeForegroundColor: Colors.black,
        ),
        didChangeCount: (count) {
          if (count == 0) {
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(
                SnackBar(
                  content: Text(LocaleKeys.default_error_text.tr()),
                ),
              );
          } else {
            onPress(count, productItem.id, productItem.publisherId);
          }
        },
      );
    }

    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        return Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Checkbox(
                value: productItem.isCheck,
                onChanged: (isCheck) => context.read<CartBloc>().add(
                    CartEvent.updateChoose(
                        isCheck!, productItem.id, productItem.publisherId!))),
            GestureDetector(
              onTap: () => AutoRouter.of(context).push(DetailsWrapperRoute(
                  product: ProductModel(id: productItem.productId))),
              child: SizedBox(
                width: 88,
                child: AspectRatio(
                  aspectRatio: 0.88,
                  child: Container(
                    padding: EdgeInsets.all(getProportionateScreenWidth(10)),
                    decoration: BoxDecoration(
                      color: const Color(0xFFF5F6F9),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: DefaultInternetImage(
                        imageUri: productItem.productImage ?? '',
                        tagId: productItem.productImage ??
                            Random().nextInt(100).toString()),
                  ),
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
                    productItem.name!,
                    style: const TextStyle(color: Colors.black, fontSize: 16),
                    maxLines: 2,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    productItem.getVariationData,
                    style: const TextStyle(color: Colors.grey, fontSize: 13),
                  ),
                  Text(
                    "Stock: ${(productItem.stock ?? 0)}",
                    style: const TextStyle(color: Colors.grey, fontSize: 13),
                  ),
                  IntrinsicHeight(
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "\đ${productItem.price}",
                          style: const TextStyle(fontWeight: FontWeight.w600),
                        ),
                        _buildStepper(
                            productItem.quantity ?? 1,
                            (counter, id, publisher) => context
                                .read<CartBloc>()
                                .add(CartEvent.updateQuantity(
                                    counter, id, publisher)))
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        );
      },
    );
  }
}

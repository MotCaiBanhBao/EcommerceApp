import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:client/app/components/default_load_user_avatar.dart';
import 'package:client/app/routes/routes.gr.dart';
import 'package:coupon_uikit/coupon_uikit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:json_theme/json_theme_schemas.dart';
import 'package:product_api/product_api.dart';
import 'package:products_repository/products_repository.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../translations/locale_keys.g.dart';
import '../../../../components/coupon.dart';
import '../../../../components/default_button.dart';
import '../../../../components/padding_default.dart';
import '../../../../helper/constants.dart';
import '../../../dashboard/bloc/dashboard_bloc.dart';
import '../../bloc/detail_bloc.dart';
import '/size_config.dart';
import 'product_description.dart';
import 'top_rounded_container.dart';
import 'product_images.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocSelector<DetailBloc, DetailState, DetailStatus>(
      selector: (state) {
        return state.status;
      },
      builder: (context, status) {
        return status.isLoadding
            ? Shimmer.fromColors(
                baseColor: Colors.grey[300]!,
                highlightColor: Colors.grey[100]!,
                child: _buildBody(),
              )
            : _buildBody();
      },
    );
  }
}

Widget _buildBody() {
  return BlocBuilder<DetailBloc, DetailState>(builder: (context, product) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ProductImages(
              imageProduct:
                  product.data!.productImage ?? [product.data!.avatar!]),
          TopRoundedContainer(
            color: Colors.white,
            child: Column(
              children: [
                ProductDescription(
                  isFavorite: product.isFavorite,
                  product: product.data!,
                  pressOnSeeMore: () {},
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      HorizontalCoupon(
                          kindCoupon: 'Free ship',
                          minspend: '20000',
                          outvalid: '24/2',
                          percent: '30%'),
                      HorizontalCoupon(
                          kindCoupon: 'Giam gia',
                          minspend: '20000',
                          outvalid: '24/2',
                          percent: '30%'),
                      HorizontalCoupon(
                          kindCoupon: 'Giam gia',
                          minspend: '20000',
                          outvalid: '24/2',
                          percent: '30%'),
                    ],
                  ),
                ),
                SizedBox(
                  height: defaultPadding,
                ),
                PaddingDefault(
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      RichText(
                        text: TextSpan(
                          children: <TextSpan>[
                            TextSpan(
                                text: LocaleKeys.review_comment_txt.tr(),
                                style: Theme.of(context).textTheme.titleMedium),
                            TextSpan(
                                text:
                                    "(${product.data!.rate?.history?.numberOfReview ?? 0})",
                                style: Theme.of(context).textTheme.bodySmall),
                          ],
                        ),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RatingBarIndicator(
                            rating:
                                (product.data!.rate?.totalRate ?? 5).toDouble(),
                            itemBuilder: (context, index) => const Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                            itemCount: 5,
                            itemSize: getProportionateScreenWidth(10),
                            unratedColor: Colors.amber.withAlpha(50),
                            direction: Axis.horizontal,
                          ),
                          Text(
                              "${(product.data!.rate?.totalRate ?? 5).toDouble().toStringAsFixed(1)}/5"),
                        ],
                      ),
                      SizedBox(
                        height: defaultPadding,
                      ),
                      const Divider(),
                      ListView.builder(
                        shrinkWrap: true,
                        itemCount:
                            product.data!.rate?.history?.numberOfReview ?? 0,
                        itemBuilder: (context, index) => Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              flex: 1,
                              child: SizedBox(
                                height: getProportionateScreenHeight(30),
                                width: getProportionateScreenWidth(30),
                                child: Stack(
                                  fit: StackFit.expand,
                                  clipBehavior: Clip.none,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        AutoRouter.of(context).push(
                                            CheckProfileWrapperRoute(
                                                userID: product
                                                        .data!
                                                        .rate
                                                        ?.history
                                                        ?.data?[index]
                                                        .senderId ??
                                                    ''));
                                      },
                                      child: DefaultUserAvatar(
                                        id: product.data!.rate?.history
                                                ?.data?[index].senderId ??
                                            '',
                                        tagId: product.data!.rate?.history
                                                ?.data?[index].senderId ??
                                            '',
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              width: getProportionateScreenWidth(10),
                            ),
                            Expanded(
                                flex: 9,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      product.data!.rate?.history?.data?[index]
                                              .senderId ??
                                          '',
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleSmall,
                                    ),
                                    RatingBarIndicator(
                                      rating:
                                          (product.data!.rate?.totalRate ?? 5)
                                              .toDouble(),
                                      itemBuilder: (context, index) =>
                                          const Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                      ),
                                      itemCount: 5,
                                      itemSize: getProportionateScreenWidth(10),
                                      unratedColor: Colors.amber.withAlpha(50),
                                      direction: Axis.horizontal,
                                    ),
                                    Text(product.data!.rate?.history
                                            ?.data?[index].comment ??
                                        ''),
                                  ],
                                )),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: getProportionateScreenHeight(70)),
        ],
      ),
    );
  });
}

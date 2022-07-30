import 'package:auth_repository/auth_repository.dart';
import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cart_repository/cart_repository.dart';
import 'package:client/app/components/loading_dialog.dart';
import 'package:client/app/routes/routes.gr.dart';
import 'package:dotted_decoration/dotted_decoration.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:product_api/product_api.dart';
import 'package:products_repository/products_repository.dart';
import 'package:remote_products_api/products_api.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../size_config.dart';
import '../../../../translations/locale_keys.g.dart';
import '../../../components/default_button.dart';
import '../../../helper/constants.dart';
import '../bloc/detail_bloc.dart';
import 'components/body.dart';
import 'components/custom_app_bar.dart';

class DetailsWrapperScreen extends StatelessWidget {
  static const String routeName = "/details";
  final ProductModel product;
  const DetailsWrapperScreen({Key? key, required this.product})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DetailBloc(
          product,
          context.read<ProductsRepository>(),
          product.price ?? 0,
          context.read<CartRepository>(),
          context.read<AuthRepository>())
        ..add(const DetailEvent.started()),
      child: const AutoRouter(),
    );
  }
}

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({Key? key}) : super(key: key);

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    print('bbbbb');
    return BlocConsumer<DetailBloc, DetailState>(
      listener: (context, state) {
        print('aaaaaaa');

        if (state.addCartStatus.isLoadding) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(SnackBar(
              content: Text(
                LocaleKeys.adding_to_cart_txt.tr(),
              ),
            ));
        } else if (state.status.isActionLoading) {
          LoadingDialog.show(context);
        } else if (state.status.isActionSuccess) {
          LoadingDialog.hide(context);
        } else if (state.addCartStatus.isSuccess) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(SnackBar(
              content: Text(LocaleKeys.success_txt.tr()),
            ));
        } else if (state.addCartStatus.isFailure) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(SnackBar(
              content: Text(LocaleKeys.default_error_text.tr()),
            ));
        }
      },
      listenWhen: (previous, current) =>
          (previous.status != current.status) ||
          (previous.addCartStatus != current.addCartStatus),
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) {
        return RefreshIndicator(
          onRefresh: () async {
            context.read<DetailBloc>().add(const DetailEvent.started());
          },
          child: Scaffold(
            backgroundColor: const Color(0xFFF5F6F9),
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(AppBar().preferredSize.height),
              child: CustomAppBar(rating: 5),
            ),
            body: const Body(),
            bottomSheet: state.status.isLoadding
                ? Shimmer.fromColors(
                    baseColor: Colors.grey[300]!,
                    highlightColor: Colors.grey[100]!,
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        border: Border(
                          top: BorderSide(
                              color: Colors.black,
                              width: 0.1,
                              style: BorderStyle.solid),
                        ),
                      ),
                      height: getProportionateScreenHeight(70),
                    ))
                : Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      border: Border(
                        top: BorderSide(
                            color: Colors.black,
                            width: 0.1,
                            style: BorderStyle.solid),
                      ),
                    ),
                    height: getProportionateScreenHeight(70),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                            flex: 1,
                            child: _makeBottomItem(
                                icon: Icons.store,
                                text: LocaleKeys.store_txt.tr(),
                                onPressed: () {
                                  AutoRouter.of(context).push(
                                      CheckProfileWrapperRoute(
                                          userID: state.data?.publisher ?? ''));
                                })),
                        Expanded(
                          flex: 1,
                          child: _makeBottomItem(
                              icon: Icons.chat_bubble_outline,
                              text: 'Chat',
                              onPressed: () {
                                AutoRouter.of(context).push(ChatWrapperRoute(
                                    anotherId: state.data!.publisher!));
                              }),
                        ),
                        Expanded(
                          flex: 2,
                          child: _makeBottomButton(
                              onPressed: () {},
                              text: LocaleKeys.buy_now_txt.tr()),
                        ),
                        Expanded(
                          flex: 2,
                          child: _makeBottomButton(
                              onPressed: () {
                                if (state.data?.variations?.listVariation !=
                                    null) {
                                  if (state.data!.variations!.listVariation!
                                      .isNotEmpty) {
                                    showModalBottomSheet<bool>(
                                      enableDrag: false,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      isScrollControlled: true,
                                      context: context,
                                      builder: (context) =>
                                          _buildBottomVariation(context),
                                    ).then((value) => print(value));
                                  } else {
                                    context
                                        .read<DetailBloc>()
                                        .add(const DetailEvent.onAddToCart());
                                  }
                                } else {
                                  context
                                      .read<DetailBloc>()
                                      .add(const DetailEvent.onAddToCart());
                                }
                              },
                              text: LocaleKeys.add_to_cart_txt.tr()),
                        ),
                      ],
                    ),
                  ),
          ),
        );
      },
    );
  }

  Widget _buildBottomVariation(BuildContext context) {
    return BlocBuilder<DetailBloc, DetailState>(
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.all(defaultPadding),
          child: Container(
            color: Colors.white,
            height: getProportionateScreenHeight(541.0),
            child: Column(
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: getProportionateScreenWidth(100),
                      height: getProportionateScreenHeight(100),
                      child: CachedNetworkImage(
                        imageUrl:
                            state.choiceChip.getImage() ?? state.data!.avatar!,
                        placeholder: (context, url) =>
                            const CircularProgressIndicator(),
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          state.price.toString(),
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          state.choiceChip.toString(),
                          maxLines: 1,
                        ),
                      ],
                    )
                  ],
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ..._buildVariation(
                              state.data!.variations!.listVariation!),
                        ]),
                  ),
                ),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.topRight,
                      colors: [
                        Theme.of(context).primaryColor,
                        Theme.of(context).colorScheme.secondary
                      ],
                    ),
                    borderRadius:
                        const BorderRadius.all(const Radius.circular(20)),
                  ),
                  child: DefaultButton(
                    press: () {
                      context
                          .read<DetailBloc>()
                          .add(const DetailEvent.onAddToCart());
                    },
                    text: LocaleKeys.add_to_cart_txt.tr(),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  List<Widget> _buildVariation(List<ListVariation> listData) {
    return List.generate(listData.length, (index) {
      return BlocSelector<DetailBloc, DetailState, List<VariationsData>>(
        selector: (state) {
          return state.choiceChip;
        },
        builder: (context, choiceChip) {
          return Container(
            padding: const EdgeInsets.all(8.0),
            decoration: DottedDecoration(linePosition: LinePosition.bottom),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  listData[index].variationName!,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  children: [
                    ...List.generate(listData[index].variationsData!.length,
                        (variIndex) {
                      return ChoiceChip(
                          shadowColor: Colors.grey,
                          side: const BorderSide(color: Colors.grey),
                          onSelected: (isSelected) {
                            context.read<DetailBloc>().add(
                                  DetailEvent.onSelectedChip(
                                      listData[index]
                                          .variationsData![variIndex],
                                      listData[index].variationsData!),
                                );
                          },
                          backgroundColor: Colors.white,
                          avatar: listData[index]
                                      .variationsData![variIndex]
                                      .productImage !=
                                  null
                              ? CachedNetworkImage(
                                  imageUrl: listData[index]
                                      .variationsData![variIndex]
                                      .productImage!,
                                  placeholder: (context, url) =>
                                      const CircularProgressIndicator(),
                                  errorWidget: (context, url, error) =>
                                      const Icon(Icons.error),
                                )
                              : null,
                          label: Text(
                              listData[index].variationsData![variIndex].name!),
                          selected: choiceChip.contains(
                              listData[index].variationsData![variIndex]));
                    }),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      LocaleKeys.quantity_txt.tr(),
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Số lượng',
                      ),
                    ),
                  ],
                )
              ],
            ),
          );
        },
      );
    });
  }

  Widget _makeBottomButton(
      {required String text, required Function onPressed}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: double.infinity,
        height: getProportionateScreenHeight(56),
        child: TextButton(
          style: TextButton.styleFrom(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            primary: Colors.white,
            backgroundColor: Theme.of(context).primaryColor,
          ),
          onPressed: () => onPressed(),
          child: Text(
            text,
            style: TextStyle(
              fontSize: getProportionateScreenWidth(13),
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  Widget _makeBottomItem(
      {required IconData icon,
      required String text,
      required Function onPressed}) {
    return TextButton(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: Colors.black,
          ),
          Text(
            text,
            style: const TextStyle(color: Colors.black, fontSize: 10),
          ),
        ],
      ),
      onPressed: () => onPressed(),
    );
  }
}

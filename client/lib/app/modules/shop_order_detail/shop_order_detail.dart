import 'dart:math';

import 'package:auto_route/auto_route.dart';
import 'package:client/app/modules/order_detail/bloc/order_detail_bloc.dart';
import 'package:client/app/modules/order_detail/view/components/detail.dart';
import 'package:client/app/modules/order_detail/view/components/order_status.dart';
import 'package:client/app/modules/order_detail/view/components/payment_method.dart';
import 'package:client/app/modules/shop_order_detail/bloc/shop_order_detail_bloc.dart';
import 'package:client/app/modules/shop_order_page.dart/bloc/shop_order_page_bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:order_api/order_api.dart';
import 'package:order_repository/order_repository.dart';
import 'package:product_api/product_api.dart';
import '../../../../size_config.dart';
import '../../../../translations/locale_keys.g.dart';
import '../../components/default_image.dart';
import '../../components/loading_dialog.dart';
import '../../helper/constants.dart';
import '../../routes/routes.gr.dart';
import 'components/shipping_address.dart';

class ShopOrderDetailWrapperScreen extends StatelessWidget {
  final String orderID;
  const ShopOrderDetailWrapperScreen({Key? key, required this.orderID})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ShopOrderDetailBloc(
        context.read<OrderRepository>(),
      )..add(ShopOrderDetailEvent.started(orderID)),
      child: const AutoRouter(),
    );
  }
}

class ShopOrderDetailScreen extends StatelessWidget {
  const ShopOrderDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: false,
        title: Text(
          "Order Detail",
          style: TextStyle(color: Theme.of(context).primaryColor),
        ),
      ),
      body: BlocConsumer<ShopOrderDetailBloc, ShopOrderDetailState>(
        listenWhen: (previous, current) =>
            previous.status != current.status ||
            previous.order != current.order,
        listener: (context, state) {
          if (state.status.isLoading) {
            LoadingDialog.show(context);
          } else if (state.status.isCanceledSuccess) {
            LoadingDialog.hide(context);
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(SnackBar(
                content: Text(
                  'Thành công',
                ),
              ));
            AutoRouter.of(context).pop();
          } else if (state.status.isFailure) {
            LoadingDialog.hide(context);
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(SnackBar(
                content: Text(
                  'SomeThingError',
                ),
              ));
          } else {
            LoadingDialog.hide(context);
          }
          // addresssController.text = state.order?.address ?? '';
        },
        builder: (context, state) {
          return SafeArea(
            child: (state.status.isLoading || state.status.isInitial)
                ? Container()
                : SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(height: getProportionateScreenHeight(20)),
                        Column(
                          children: [
                            OrderStatusWidget(
                                status: state.order?.status ?? ''),
                            Divider(),
                            ShippingAdressWidget(
                              shippingAddress: state.order?.shippingAddress ??
                                  ShippingAddress(address: '', phoneNumber: ''),
                            ),
                            Divider(),
                            Container(
                              color: Colors.grey[100],
                              padding: EdgeInsets.only(
                                  bottom: 10,
                                  left: defaultPadding,
                                  right: defaultPadding),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  GestureDetector(
                                    onTap: () {},
                                    child: Row(
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(right: 5.0),
                                          child: SvgPicture.asset(
                                            'assets/icons/Shop Icon.svg',
                                          ),
                                        ),
                                        Flexible(
                                          child: Text(
                                              softWrap: false,
                                              overflow: TextOverflow.ellipsis,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headline6,
                                              state.order?.publisherId ??
                                                  'YShop'),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const Divider(height: 10.0, thickness: 1.0),
                                  ListView.builder(
                                    primary: false,
                                    shrinkWrap: true,
                                    itemCount: state.order?.items?.length ?? 0,
                                    itemBuilder: (context, item) => Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 10),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          GestureDetector(
                                            onTap: () => AutoRouter.of(context)
                                                .push(DetailsWrapperRoute(
                                                    product: ProductModel(
                                                        id: state
                                                            .order!
                                                            .items![item]
                                                            .productId))),
                                            child: SizedBox(
                                              width: 88,
                                              child: AspectRatio(
                                                aspectRatio: 0.88,
                                                child: Container(
                                                  padding: EdgeInsets.all(
                                                      getProportionateScreenWidth(
                                                          10)),
                                                  decoration: BoxDecoration(
                                                    color:
                                                        const Color(0xFFF5F6F9),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15),
                                                  ),
                                                  child: DefaultInternetImage(
                                                      imageUri:
                                                          getProductAvatar(state
                                                              .order!
                                                              .items![item]
                                                              .productId!),
                                                      tagId: state
                                                              .order!
                                                              .items?[item]
                                                              .productId ??
                                                          Random()
                                                              .nextInt(100)
                                                              .toString()),
                                                ),
                                              ),
                                            ),
                                          ),
                                          const SizedBox(width: 20),
                                          Expanded(
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  state.order!.items![item]
                                                          .name ??
                                                      '',
                                                  style: const TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 16),
                                                  maxLines: 2,
                                                ),
                                                const SizedBox(height: 10),
                                                Text(
                                                  state.order!.items![item]
                                                          .variationData ??
                                                      'Default',
                                                  style: const TextStyle(
                                                      color: Colors.grey,
                                                      fontSize: 13),
                                                ),
                                                IntrinsicHeight(
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text(
                                                        "\đ${state.order?.items?[item].price} x${state.order?.items?[item].quantity}",
                                                        style: const TextStyle(
                                                            fontWeight:
                                                                FontWeight
                                                                    .w600),
                                                      ),
                                                    ],
                                                  ),
                                                )
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Divider(),
                            Text(
                                "${LocaleKeys.totall_bill_txt.tr()} : đ${state.order?.bill}"),
                            Divider(),
                            PaymentMethodWidget(),
                            Divider(),
                            OrderDetailWidget(
                                orderID: state.order?.id ?? '',
                                orderTime: state.order?.dateAdded ?? ''),
                            TextButton(
                                onPressed: () {
                                  AutoRouter.of(context).push(ChatWrapperRoute(
                                      anotherId:
                                          state.order?.publisherId ?? ''));
                                },
                                child: Text('Contact with buyer')),
                            Builder(builder: (context) {
                              if (state.order?.status == 'Not Processed') {
                                return Column(
                                  children: [
                                    Row(
                                      children: [
                                        Expanded(
                                          child: TextButton(
                                            style: TextButton.styleFrom(
                                                primary: Colors.white,
                                                backgroundColor: Colors.red),
                                            onPressed: () => {
                                              context
                                                  .read<ShopOrderDetailBloc>()
                                                  .add(ShopOrderDetailEvent
                                                      .cancelOrder(
                                                          state.order?.id ?? '',
                                                          'Không lý do'))
                                            },
                                            child: const Text(
                                              'Huỷ đơn hàng',
                                              style: TextStyle(fontSize: 14),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 5),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: TextButton(
                                            style: TextButton.styleFrom(
                                                primary: Colors.white,
                                                backgroundColor: Colors.red),
                                            onPressed: () => {
                                              context
                                                  .read<ShopOrderDetailBloc>()
                                                  .add(ShopOrderDetailEvent
                                                      .changeStatus(
                                                          state.order?.id ?? '',
                                                          'Processing'
                                                              .toOrderStatus()))
                                            },
                                            child: const Text(
                                              'Xác nhận đơn hàng',
                                              style: TextStyle(fontSize: 14),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                );
                              } else if (state.order?.status == 'Processing') {
                                return Column(
                                  children: [
                                    Row(
                                      children: [
                                        Expanded(
                                          child: TextButton(
                                            style: TextButton.styleFrom(
                                                primary: Colors.white,
                                                backgroundColor: Colors.red),
                                            onPressed: () => {
                                              context
                                                  .read<ShopOrderDetailBloc>()
                                                  .add(ShopOrderDetailEvent
                                                      .changeStatus(
                                                          state.order?.id ?? '',
                                                          'Shipping'
                                                              .toOrderStatus()))
                                            },
                                            child: const Text(
                                              'Bắt đầu ship',
                                              style: TextStyle(fontSize: 14),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                );
                              } else if (state.order?.status == 'Shipping') {
                                return Column(
                                  children: [
                                    Row(
                                      children: [
                                        Expanded(
                                          child: TextButton(
                                            style: TextButton.styleFrom(
                                                primary: Colors.white,
                                                backgroundColor: Colors.red),
                                            onPressed: () => {
                                              context
                                                  .read<ShopOrderDetailBloc>()
                                                  .add(ShopOrderDetailEvent
                                                      .changeStatus(
                                                          state.order?.id ?? '',
                                                          'Delivered'
                                                              .toOrderStatus()))
                                            },
                                            child: const Text(
                                              'Ship hoàn tất',
                                              style: TextStyle(fontSize: 14),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                );
                              } else {
                                return Container();
                              }
                            })
                          ],
                        ),
                      ],
                    ),
                  ),
          );
        },
      ),
    );
  }

  //         Center(
  //           child: Column(
  //             mainAxisAlignment: MainAxisAlignment.center,
  //             children: <Widget>[
  //               Container(
  //                 padding: EdgeInsets.all(16),
  //                 child: Text(
  //                   'Recognized words:',
  //                   style: TextStyle(fontSize: 20.0),
  //                 ),
  //               ),
  //               Expanded(
  //                 child: Container(
  //                   padding: EdgeInsets.all(16),
  //                   child: Text(
  //                     // If listening is active show the recognized words
  //                     _speechToText.isListening
  //                         ? '$_lastWords'
  //                         // If listening isn't active but could be tell the user
  //                         // how to start it, otherwise indicate that speech
  //                         // recognition is not yet ready or not supported on
  //                         // the target device
  //                         : _speechEnabled
  //                             ? 'Tap the microphone to start listening...'
  //                             : 'Speech not available',
  //                   ),
  //                 ),
  //               ),
  //             ],
  //           ),
  //         ),
  //       ],
  //     ),
  //   ),
  // ),
  // floatingActionButton: FloatingActionButton(
  //   onPressed:
  //       // If not yet listening for speech start, otherwise stop
  //       _speechToText.isNotListening ? _startListening : _stopListening,
  //   tooltip: 'Listen',
  //   child: Icon(_speechToText.isNotListening ? Icons.mic_off : Icons.mic),
  // ),

}

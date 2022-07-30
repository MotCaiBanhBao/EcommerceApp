import 'dart:math';

import 'package:auto_route/auto_route.dart';
import 'package:client/app/modules/shop_products/bloc/shop_products_bloc.dart';
import 'package:client/app/modules/shop_products/views/components/shop_product_page.dart';
import 'package:client/app/routes/routes.gr.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:products_repository/products_repository.dart';

import '../../../../translations/locale_keys.g.dart';
import '../../../components/loading_dialog.dart';
import '../../../components/rounded_icon_btn.dart';
import 'components/form_product.dart';

class ShopProductsWrapperScreen extends StatelessWidget {
  const ShopProductsWrapperScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ShopProductsBloc(
        context.read<ProductsRepository>(),
      )..add(const ShopProductsEvent.started()),
      child: const AutoRouter(),
    );
  }
}

class ShopProductsScreen extends StatelessWidget {
  const ShopProductsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text(
          'All products',
          style: TextStyle(color: Theme.of(context).primaryColor),
        ),
        backgroundColor: Colors.white,
      ),
      floatingActionButton: RoundedIconBtn(
        icon: Icons.add,
        showShadow: true,
        press: () {
          context.pushRoute(FormProductRoute());
        },
      ),
      body: BlocConsumer<ShopProductsBloc, ShopProductsState>(
        listenWhen: (previous, current) =>
            previous.status != current.status ||
            previous.shopProduct != current.shopProduct,
        listener: (context, state) {
          if (state.status.isLoading) {
            LoadingDialog.show(context);
          } else if (state.status.isActionNeedBackSuccess) {
            LoadingDialog.hide(context);
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(SnackBar(
                content: Text(
                  'Thành công',
                ),
              ));
            context.read<ShopProductsBloc>().add(ShopProductsEvent.started());
            AutoRouter.of(context).pop();
          } else if (state.status.isActionSuccess) {
            LoadingDialog.hide(context);
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(SnackBar(
                content: Text(
                  'Thành công',
                ),
              ));
            context.read<ShopProductsBloc>().add(ShopProductsEvent.started());
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
          return Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: state.status.isInitial
                  ? Column(
                      children: const [
                        Expanded(
                            child: Center(child: CircularProgressIndicator())),
                      ],
                    )
                  : RefreshIndicator(
                      onRefresh: () async {},
                      child: SingleChildScrollView(
                          child: Column(
                        children: [
                          ListView.builder(
                            shrinkWrap: true,
                            itemCount:
                                state.shopProduct?.productList?.length ?? 0,
                            itemBuilder: (context, index) {
                              return Slidable(
                                // Specify a key if the Slidable is dismissible.
                                key: const ValueKey(0),
                                // The start action pane is the one at the left or the top side.
                                endActionPane: ActionPane(
                                  // A motion is a widget used to control how the pane animates.
                                  motion: const ScrollMotion(),

                                  // A pane can dismiss the Slidable.
                                  // dismissible: DismissiblePane(onDismissed: () {
                                  //   print('dismiss');
                                  // }),

                                  // All actions are defined in the children parameter.
                                  children: [
                                    // A SlidableAction can have an icon and/or a label.
                                    SlidableAction(
                                      onPressed: ((context) {
                                        var slide = Slidable.of(context);
                                        slide!.close();
                                        context.read<ShopProductsBloc>().add(
                                            ShopProductsEvent.deleteProduct(
                                                state.shopProduct!
                                                    .productList![index].id!));
                                      }),
                                      backgroundColor: Color(0xFFFE4A49),
                                      foregroundColor: Colors.white,
                                      icon: Icons.delete,
                                      label: 'Delete',
                                    ),
                                    SlidableAction(
                                      onPressed: ((context) => {
                                            context.pushRoute(FormProductRoute(
                                                init: state.shopProduct!
                                                    .productList![index]))
                                          }),
                                      backgroundColor: Colors.pink,
                                      foregroundColor: Colors.white,
                                      icon: Icons.edit,
                                      label: 'Edit',
                                    ),
                                  ],
                                ),
                                // The child of the Slidable is what the user sees when the
                                // component is not dragged.
                                child: Padding(
                                  padding: const EdgeInsets.only(bottom: 8.0),
                                  child: ShopProductWidget(
                                    productModel:
                                        state.shopProduct!.productList![index],
                                  ),
                                ),
                              );
                            },
                          ),
                        ],
                      )),
                    ));
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

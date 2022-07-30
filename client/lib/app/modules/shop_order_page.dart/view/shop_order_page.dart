import 'dart:math';

import 'package:auto_route/auto_route.dart';
import 'package:client/app/modules/order_page/bloc/order_bloc.dart';
import 'package:client/app/modules/shop_order_page.dart/bloc/shop_order_page_bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:order_repository/order_repository.dart';

import '../../../../translations/locale_keys.g.dart';
import '../../../components/rounded_icon_btn.dart';
import 'order_widget.dart';

class ShopOrderWrapperScreen extends StatelessWidget {
  const ShopOrderWrapperScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ShopOrderPageBloc(
        context.read<OrderRepository>(),
      )..add(const ShopOrderPageEvent.started()),
      child: const AutoRouter(),
    );
  }
}

class ShopOrderScreen extends StatelessWidget {
  const ShopOrderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 6,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              isScrollable: true,
              labelColor: Theme.of(context).primaryColor,
              tabs: [
                Tab(
                  text: LocaleKeys.all_order_txt.tr(),
                ),
                Tab(
                  text: LocaleKeys.to_pay_txt.tr(),
                ),
                Tab(
                  text: LocaleKeys.to_ship_txt.tr(),
                ),
                Tab(
                  text: LocaleKeys.to_receive_txt.tr(),
                ),
                Tab(
                  text: LocaleKeys.to_rate_txt.tr(),
                ),
                Tab(
                  text: LocaleKeys.canceled_txt.tr(),
                ),
              ],
            ),
            centerTitle: false,
            title: Text(
              'All order',
              style: TextStyle(color: Theme.of(context).primaryColor),
            ),
            backgroundColor: Colors.white,
          ),
          floatingActionButton: RoundedIconBtn(
            icon: Icons.refresh,
            showShadow: true,
            press: () {
              context
                  .read<ShopOrderPageBloc>()
                  .add(const ShopOrderPageEvent.started());
            },
          ),
          body: BlocBuilder<ShopOrderPageBloc, ShopOrderPageState>(
            builder: (context, state) {
              return Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: TabBarView(
                  children: (state.status.isLoading || state.status.isInitial)
                      ? [
                          Column(
                            children: const [
                              Expanded(
                                  child: Center(
                                      child: CircularProgressIndicator())),
                            ],
                          ),
                          Column(
                            children: const [
                              Expanded(
                                  child: Center(
                                      child: CircularProgressIndicator())),
                            ],
                          ),
                          Column(
                            children: const [
                              Expanded(
                                  child: Center(
                                      child: CircularProgressIndicator())),
                            ],
                          ),
                          Column(
                            children: const [
                              Expanded(
                                  child: Center(
                                      child: CircularProgressIndicator())),
                            ],
                          ),
                          Column(
                            children: const [
                              Expanded(
                                  child: Center(
                                      child: CircularProgressIndicator())),
                            ],
                          ),
                          Column(
                            children: const [
                              Expanded(
                                  child: Center(
                                      child: CircularProgressIndicator())),
                            ],
                          )
                        ]
                      : [
                          RefreshIndicator(
                            onRefresh: () async {
                              context
                                  .read<ShopOrderPageBloc>()
                                  .add(const ShopOrderPageEvent.started());
                            },
                            child: SingleChildScrollView(
                              physics: const AlwaysScrollableScrollPhysics(),
                              controller: ScrollController(),
                              child: Column(
                                children: [
                                  ListView.builder(
                                    key: const PageStorageKey('All order'),
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    scrollDirection: Axis.vertical,
                                    shrinkWrap: true,
                                    itemCount: state.orders.length,
                                    itemBuilder: ((context, index) {
                                      return ShopOrderCard(
                                        order: state.orders[index],
                                      );
                                    }),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SingleChildScrollView(
                            physics: const AlwaysScrollableScrollPhysics(),
                            child: Column(
                              children: [
                                Builder(builder: (context) {
                                  final data = state.orders
                                      .where(
                                          (i) => (i.status == 'Not Processed'))
                                      .toList();
                                  return ListView.builder(
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      key:
                                          const PageStorageKey('Not Processed'),
                                      scrollDirection: Axis.vertical,
                                      shrinkWrap: true,
                                      itemCount: data.length,
                                      itemBuilder: ((context, index) {
                                        return ShopOrderCard(
                                          order: data[index],
                                        );
                                      }));
                                })
                              ],
                            ),
                          ),
                          SingleChildScrollView(
                            physics: const AlwaysScrollableScrollPhysics(),
                            child: Column(
                              children: [
                                Builder(builder: (context) {
                                  // Processing, Shipping, Delivered, NotProcessed, Cancelled
                                  final data = state.orders
                                      .where((i) => (i.status == 'Processing'))
                                      .toList();
                                  return ListView.builder(
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      key: const PageStorageKey('Processing'),
                                      scrollDirection: Axis.vertical,
                                      shrinkWrap: true,
                                      itemCount: data.length,
                                      itemBuilder: ((context, index) {
                                        return ShopOrderCard(
                                          order: data[index],
                                        );
                                      }));
                                })
                              ],
                            ),
                          ),
                          SingleChildScrollView(
                            physics: const AlwaysScrollableScrollPhysics(),
                            child: Column(
                              children: [
                                Builder(builder: (context) {
                                  // Processing, Shipping, Delivered, NotProcessed, Cancelled
                                  final data = state.orders
                                      .where((i) => (i.status == 'Shipping'))
                                      .toList();
                                  return ListView.builder(
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      scrollDirection: Axis.vertical,
                                      key: const PageStorageKey('Shipping'),
                                      shrinkWrap: true,
                                      itemCount: data.length,
                                      itemBuilder: ((context, index) {
                                        return ShopOrderCard(
                                          order: data[index],
                                        );
                                      }));
                                })
                              ],
                            ),
                          ),
                          SingleChildScrollView(
                            physics: const AlwaysScrollableScrollPhysics(),
                            child: Column(
                              children: [
                                Builder(builder: (context) {
                                  final data = state.orders
                                      .where((i) => (i.status == 'Delivered'))
                                      .toList();
                                  return ListView.builder(
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      key: const PageStorageKey('Delivered'),
                                      scrollDirection: Axis.vertical,
                                      shrinkWrap: true,
                                      itemCount: data.length,
                                      itemBuilder: ((context, index) {
                                        return ShopOrderCard(
                                          order: data[index],
                                        );
                                      }));
                                })
                              ],
                            ),
                          ),
                          SingleChildScrollView(
                            physics: const AlwaysScrollableScrollPhysics(),
                            child: Column(
                              children: [
                                Builder(builder: (context) {
                                  // Processing, Shipping, Delivered, NotProcessed, Cancelled
                                  final data = state.orders
                                      .where((i) => (i.status == 'Cancelled'))
                                      .toList();
                                  return ListView.builder(
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      key: const PageStorageKey('Cancelled'),
                                      scrollDirection: Axis.vertical,
                                      shrinkWrap: true,
                                      itemCount: data.length,
                                      itemBuilder: ((context, index) {
                                        return ShopOrderCard(
                                          order: data[index],
                                        );
                                      }));
                                })
                              ],
                            ),
                          ),
                        ],
                ),
              );
            },
          ),
        ),
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

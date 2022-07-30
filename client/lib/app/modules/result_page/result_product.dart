import 'package:auto_route/auto_route.dart';
import 'package:client/app/modules/result_page/bloc/result_product_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:product_api/product_api.dart';
import 'package:products_repository/products_repository.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';

import '../../../size_config.dart';
import '../../components/default_list_loading_card.dart';
import '../find_product/views/components/app_bar_with_search_bar.dart';
import '../../components/product_expanded_card.dart';
import '../../helper/constants.dart';

class ResultWrapperScreen extends StatelessWidget {
  final String dataSearch;
  const ResultWrapperScreen({Key? key, required this.dataSearch})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ResultProductBloc(
        context.read<ProductsRepository>(),
      )..add(ResultProductEvent.started(dataSearch)),
      child: const AutoRouter(),
    );
  }
}

class ResultScreen extends StatelessWidget {
  const ResultScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: BlocBuilder<ResultProductBloc, ResultProductState>(
      builder: (context, state) {
        return SafeArea(
            child: SingleChildScrollView(
                child: Column(children: [
          SizedBox(height: getProportionateScreenHeight(20)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Chip(label: Text('Phổ biến')),
              Chip(label: Text('Bán chạy')),
              Chip(label: Text('Giá giảm')),
              Chip(label: Text('Giá tăng')),
            ],
          ),
          SizedBox(height: getProportionateScreenHeight(20)),
          state.status.isLoading
              ? Padding(
                  padding: EdgeInsets.symmetric(horizontal: defaultPadding),
                  child: const DefaultListLoadingCard(
                    crossAxisCount: 2,
                    itemCount: 6,
                  ))
              : Padding(
                  padding: EdgeInsets.symmetric(horizontal: defaultPadding),
                  child: (state.findProduct?.productList?.length ?? 0) != 0
                      ? MasonryGridView.count(
                          primary: false,
                          shrinkWrap: true,
                          itemCount:
                              state.findProduct?.productList?.length ?? 0,
                          // the number of columns
                          crossAxisCount: 2,
                          // vertical gap between two items
                          mainAxisSpacing:
                              getProportionateScreenWidth(10) * 1.2,
                          // horizontal gap between two items
                          crossAxisSpacing:
                              getProportionateScreenWidth(10) * 1.2,
                          itemBuilder: (context, index) {
                            // display each item with a card
                            return ProductExpandedCard(
                              data: state.findProduct!.productList![index],
                            );
                          },
                        )
                      : Center(child: Text('No product')),
                )
        ])));
      },
    )
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
        );
  }
}

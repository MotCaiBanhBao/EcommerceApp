import 'package:auto_route/auto_route.dart';
import 'package:client/app/modules/find_product/bloc/find_product_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:search_history_repository/search_history_repository.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';

import '../../../../size_config.dart';
import 'components/app_bar_with_search_bar.dart';
import 'components/recent_search.dart';

class SearchPageWrapperScreen extends StatelessWidget {
  const SearchPageWrapperScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FindProductBloc(context.read<SearchHisRepo>())
        ..add(const FindProductEvent.started()),
      child: const AutoRouter(),
    );
  }
}

class SearchPageScreen extends StatelessWidget {
  const SearchPageScreen({Key? key}) : super(key: key);

  // SpeechToText _speechToText = SpeechToText();
  // bool _speechEnabled = false;
  // String _lastWords = '';

  // @override
  // void initState() {
  //   super.initState();
  //   _initSpeech();
  // }

  // /// This has to happen only once per app
  // void _initSpeech() async {
  //   _speechEnabled = await _speechToText.initialize();
  //   setState(() {});
  // }

  // /// Each time to start a speech recognition session
  // void _startListening() async {
  //   await _speechToText.listen(onResult: _onSpeechResult, localeId: "vi-VN");
  //   setState(() {});
  // }

  // /// Manually stop the active speech recognition session
  // /// Note that there are also timeouts that each platform enforces
  // /// and the SpeechToText plugin supports setting timeouts on the
  // /// listen method.
  // void _stopListening() async {
  //   await _speechToText.stop();
  //   setState(() {});
  // }

  // /// This is the callback that the SpeechToText plugin calls when
  // /// the platform returns recognized words.
  // void _onSpeechResult(SpeechRecognitionResult result) {
  //   setState(() {
  //     _lastWords = result.recognizedWords;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: SingleChildScrollView(
                child: Column(children: [
      SizedBox(height: getProportionateScreenHeight(20)),
      AppBarWithSearch(),
      SizedBox(height: getProportionateScreenHeight(20)),
      const RecentSearch(),
    ])))
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

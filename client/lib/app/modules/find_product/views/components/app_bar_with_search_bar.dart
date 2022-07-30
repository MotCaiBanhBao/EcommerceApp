import 'dart:math';

import 'package:auto_route/auto_route.dart';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:client/app/routes/routes.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:speech_to_text/speech_recognition_error.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';
import '../../../../../../../../size_config.dart';
import '../../../../helper/constants.dart';
import '../../bloc/find_product_bloc.dart';

class AppBarWithSearch extends StatefulWidget {
  AppBarWithSearch();

  @override
  State<AppBarWithSearch> createState() => _AppBarWithSearchState();
}

class _AppBarWithSearchState extends State<AppBarWithSearch> {
  final SpeechToText speech = SpeechToText();
  bool _speechEnabled = false;
  String seachData = '';
  bool _isListenning = false;

  @override
  Widget build(BuildContext context) {
    Widget _showSpeechRecoDialog(SpeechToText speechToText, Function onResult) {
      return StatefulBuilder(builder: (context, setState) {
        speechToText.listen(
          listenMode: ListenMode.search,
          localeId: 'vi-VN',
          onResult: ((result) {
            print(result);
            if (result.finalResult) {
              // setState(
              //   () => seachData = '',
              // );

              onResult(result);
            }
            if (!result.finalResult) {
              setState(
                () {
                  seachData = result.recognizedWords;
                },
              );
            }
            // setState(
            //   () => seachData = result.recognizedWords,
            // );
          }),
        );
        return Dialog(
          alignment: Alignment.center,
          insetPadding: EdgeInsets.symmetric(horizontal: defaultPadding),
          child: Container(
              padding: EdgeInsets.symmetric(vertical: defaultPadding),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  GestureDetector(
                      onTap: () async {
                        await speechToText.listen(onResult: ((result) {
                          if (result.finalResult) {
                            setState(
                              () => seachData = '',
                            );

                            onResult(result);
                          }

                          if (!result.finalResult) {
                            setState(
                              () {
                                seachData = result.recognizedWords;
                              },
                            );
                          }
                        }));
                      },
                      child: AvatarGlow(
                        animate: true,
                        glowColor: Theme.of(context).primaryColor,
                        endRadius: 75.0,
                        duration: const Duration(milliseconds: 2000),
                        repeatPauseDuration: const Duration(milliseconds: 100),
                        repeat: true,
                        child: Icon(Icons.mic,
                            size: getProportionateScreenWidth(50)),
                      )),
                  SizedBox(
                    height: getProportionateScreenHeight(10),
                  ),
                  Text(
                      seachData == '' ? 'Try to saying some thing' : seachData),
                ],
              )),
        );
      });
    }

    return BlocBuilder<FindProductBloc, FindProductState>(
      builder: (context, state) {
        final _controller = TextEditingController(text: state.searchData);
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: defaultPadding),
          child: Row(
            children: [
              SizedBox(
                height: getProportionateScreenWidth(40),
                width: getProportionateScreenWidth(40),
                child: TextButton(
                  style: TextButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(60),
                    ),
                    primary: Theme.of(context).primaryColor,
                    backgroundColor: Colors.white,
                    padding: EdgeInsets.zero,
                  ),
                  onPressed: () => AutoRouter.of(context).pop(),
                  child: SvgPicture.asset(
                    "assets/icons/Back ICon.svg",
                    height: 15,
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  width: SizeConfig.screenWidth * 0.6,
                  decoration: BoxDecoration(
                    color: Theme.of(context)
                        .colorScheme
                        .secondary
                        .withOpacity(0.1),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: TextField(
                    controller: _controller,
                    onSubmitted: (value) {
                      AutoRouter.of(context)
                          .push(ResultWrapperRoute(dataSearch: value));
                      context
                          .read<FindProductBloc>()
                          .add(FindProductEvent.goSearch(value));
                    },
                    autofocus: true,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(
                          horizontal: defaultPadding,
                          vertical: getProportionateScreenWidth(20)),
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      hintText: "Search product",
                      iconColor: Theme.of(context)
                          .colorScheme
                          .secondary
                          .withOpacity(0.1),
                      focusColor: Theme.of(context)
                          .colorScheme
                          .secondary
                          .withOpacity(0.1),
                      prefixIconColor: Theme.of(context)
                          .colorScheme
                          .secondary
                          .withOpacity(0.1),
                      suffixIconColor: Theme.of(context)
                          .colorScheme
                          .secondary
                          .withOpacity(0.1),
                      suffixIcon: Row(
                        mainAxisAlignment:
                            MainAxisAlignment.spaceBetween, // added line
                        mainAxisSize: MainAxisSize.min, // added line
                        children: <Widget>[
                          IconButton(
                            icon: const Icon(Icons.mic),
                            onPressed: () async {
                              _speechEnabled = await speech.initialize(
                                  onStatus: (status) => {
                                        if (status == 'notListening')
                                          setState(() {
                                            print('aaaa');
                                            _isListenning = false;
                                          })
                                        else if (status == 'listening')
                                          {
                                            setState(() {
                                              print('bbbb');
                                              _isListenning = true;
                                            })
                                          }
                                      },
                                  onError: ((errorNotification) =>
                                      {print(errorNotification)}));

                              if (_speechEnabled) {
                                await showDialog(
                                    context: context,
                                    builder: (context) =>
                                        _showSpeechRecoDialog(speech,
                                            (SpeechRecognitionResult result) {
                                          // print('aaaaa');
                                          // print(result.recognizedWords);
                                          AutoRouter.of(context)
                                              .popForced(result);
                                        })).then((value) {
                                  AutoRouter.of(context).push(
                                      ResultWrapperRoute(
                                          dataSearch: value.recognizedWords));
                                  context.read<FindProductBloc>().add(
                                      FindProductEvent.goSearch(
                                          value.recognizedWords));
                                });
                              } else {
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(SnackBar(
                                  content:
                                      Text('Bạn cần cấp quyền cho ứng dụng'),
                                ));
                              }
                            },
                          ),
                          IconButton(
                            icon: const Icon(Icons.camera_alt),
                            onPressed: () async {
                              final data = await AutoRouter.of(context)
                                  .push(const ObjectDetectorRoute());

                              context.read<FindProductBloc>().add(
                                  FindProductEvent.goSearch(data.toString()));
                              AutoRouter.of(context).push(ResultWrapperRoute(
                                  dataSearch: data.toString()));
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

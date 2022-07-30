import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../../../../translations/locale_keys.g.dart';
import '../../../../components/default_button.dart';
import '../../../home/views/home_screen.dart';
import '../../../../helper/constants.dart';
import '/size_config.dart';

// This is the best practice
import 'splash_content.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int currentPage = 0;
  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> splashData = [
      {
        "text": LocaleKeys.splash_text_1.tr(),
        "image": "assets/images/splash_1.jpg"
      },
      {
        "text": LocaleKeys.splash_text_2.tr(),
        "image": "assets/images/splash_2.jpg"
      },
      {
        "text": LocaleKeys.splash_text_3.tr(),
        "image": "assets/images/splash_3.jpg"
      },
    ];

    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 3,
              child: PageView.builder(
                onPageChanged: (value) {
                  setState(() {
                    currentPage = value;
                  });
                },
                itemCount: splashData.length,
                itemBuilder: (context, index) => SplashContent(
                  image: splashData[index]["image"],
                  text: splashData[index]['text'],
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: defaultPadding),
                child: Column(
                  children: <Widget>[
                    const Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        splashData.length,
                        (index) => buildDot(index: index),
                      ),
                    ),
                    const Spacer(flex: 3),
                    DefaultButton(
                      text: LocaleKeys.continue_btn_text.tr(),
                      press: () async {
                        // final _newLocale = Locale('en');
                        // await context.setLocale(_newLocale);
                        // Get.offNamed(HomeScreen.routeName);
                        // Get.updateLocale(_newLocale);
                      },
                    ),
                    // const Spacer(),
                    // DefaultButton(
                    //   text: "B",
                    //   press: () async {
                    //     Get.forceAppUpdate();
                    //     // Get.offNamed("/search");
                    //   },
                    // ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  AnimatedContainer buildDot({int? index}) {
    return AnimatedContainer(
      duration: kAnimationDuration,
      margin: EdgeInsets.only(right: 5),
      height: 6,
      width: currentPage == index ? 20 : 6,
      decoration: BoxDecoration(
        color: currentPage == index
            ? Theme.of(context).primaryColor
            : const Color(0xFFD8D8D8),
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }
}

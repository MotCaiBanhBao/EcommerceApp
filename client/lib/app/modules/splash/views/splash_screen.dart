import 'package:client/app/modules/home/views/home_screen.dart';
import 'package:client/app/routes/routes.gr.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'components/body.dart';
import '/size_config.dart';
import 'package:page_transition/page_transition.dart';

import 'components/my_custom_splash.dart';

class SplashScreen extends StatelessWidget {
  static const String routeName = "/splash";
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen.withScreenFunction(
      splash: 'assets/images/logo.png',
      splashIconSize: 250,
      animationDuration: const Duration(milliseconds: 1500),
      splashTransition: SplashTransition.slideTransition,
      screenFunction: () async {
        await init();
        return const HomeWrapperRoute();
      },
    );
  }

  Future<void> init() async {
// You can request multiple permissions at once.
    // Map<Permission, PermissionStatus> statuses = await [
    //   Permission.location,
    //   Permission.storage,
    //   Permission.notification,
    // ].request();
    // print(statuses[Permission.location]);
    FirebaseMessaging messaging = FirebaseMessaging.instance;

    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    

    print('User granted permission: ${settings.authorizationStatus}');

    // @override
    // Widget build(BuildContext context) {
    //   // You have to call it on your starting screen
    //   SizeConfig().init(context);
    //   return Scaffold(
    //     body: Body(),
    //   );
    // }
  }
}

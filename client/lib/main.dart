import 'dart:convert';

import 'package:auth_api/auth_api.dart';
import 'package:camera/camera.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_chat_api/firebase_chat_api.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:json_theme/json_theme.dart';
import 'package:local_history_api/local_history_api.dart';
import 'package:local_storage_cart_api/local_storage_cart_api.dart';
import 'package:remote_check_out_api/remote_check_out_api.dart';
import 'package:remote_notification_api/remote_notification_api.dart';
import 'package:remote_order_api/remote_order_api.dart';
import 'package:remote_products_api/products_api.dart';
import 'package:search_history_api/search_history_api.dart';
import 'bootstrap.dart';
import 'firebase_options.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

List<CameraDescription> cameras = [];
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await EasyLocalization.ensureInitialized();
  final productsApi = InternetProductsApi();
  final authApi = RemoteUserApi();
  final checkOutApi = RemoteCheckOutApi();
  final chatApi = FirebaseChatApi();
  final notificaionApi = RemoteNotificationApi();
  final orderApi = RemoteOderApi();
  cameras = await availableCameras();
  if (kIsWeb) {
    FirebaseMessaging messaging = FirebaseMessaging.instance;

// use the returned token to send messages to users from your custom server
    String? token = await messaging.getToken(
      vapidKey:
          "BMDo2aNOqqhwS7q_KlDLXYTxBNeqO_IKMOJOxiIjhEFAM1uxi5ivEGQEgrLQCkFl7HxR4wQcL2tNJQuA6pqjURk",
    );
  }

  final cartApi = LocalStorageCartApi(
    plugin: await SharedPreferences.getInstance(),
  );
  final searchHisApi = LocalHistoryApi(
    plugin: await SharedPreferences.getInstance(),
  );

  final themeStr = await rootBundle.loadString('assets/appainter_theme.json');
  final themeJson = jsonDecode(themeStr);
  final theme = ThemeDecoder.decodeThemeData(themeJson)!;

  bootstrap(
    orderApi: orderApi,
    notificationApi: notificaionApi,
    productsApi: productsApi,
    authApi: authApi,
    themeData: theme,
    cartApi: cartApi,
    checkOutApi: checkOutApi,
    searchHisApi: searchHisApi,
    chatApi: chatApi,
  );
  // runApp(
  //   EasyLocalization(
  //       supportedLocales: const [Locale('en'), Locale('vi')],
  //       assetLoader: const CodegenLoader(),
  //       path:
  //           'assets/translations', // <-- change the path of the translation files
  //       fallbackLocale: const Locale('en'),
  //       child: MyApp()),
  // );
}

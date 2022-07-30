import 'dart:async';
import 'dart:developer';

import 'package:auth_api/auth_api.dart';
import 'package:auth_repository/auth_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:cart_api/cart_api.dart';
import 'package:cart_repository/cart_repository.dart';
import 'package:chat_api/chat_api.dart';
import 'package:chat_repository/chat_repository.dart';
import 'package:check_out_api/check_out_api.dart';
import 'package:check_out_repository/check_out_repository.dart';
import 'package:client/app/helper/localization.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:notification_api/notification_api.dart';
import 'package:notification_repository/notification_repository.dart';
import 'package:order_api/order_api.dart';
import 'package:order_repository/order_repository.dart';
import 'package:product_api/product_api.dart';
import 'package:products_repository/products_repository.dart';
import 'package:remote_products_api/products_api.dart';
import 'package:search_history_api/search_history_api.dart';
import 'package:search_history_repository/search_history_repository.dart';

import 'app/modules/app/app.dart';
import 'app/modules/app/app_bloc_observer.dart';
import 'translations/codegen_loader.g.dart';

void bootstrap({
  required ProductsApi productsApi,
  required RemoteUserApi authApi,
  required ThemeData themeData,
  required CartApi cartApi,
  required CheckOut checkOutApi,
  required OrderApi orderApi,
  required SearchHistoryApi searchHisApi,
  required ChatApi chatApi,
  required NotificationApi notificationApi,
}) {
  final orderRepository = OrderRepository(orderApi: orderApi);
  final productRepository = ProductsRepository(productsApi: productsApi);
  final authRepository = AuthRepository(authApi: authApi);
  final cartRepository = CartRepository(cartApi: cartApi);
  final checkOutRepository = CheckOutRepository(checkOutApi: checkOutApi);
  final searchHisRepo = SearchHisRepo(searchHisApi: searchHisApi);
  final chatRepo = ChatRepository(chatApi: chatApi);
  final notificationRepo =
      NotificationRepository(notificationApi: notificationApi);
  runZonedGuarded(
    () async {
      await BlocOverrides.runZoned(
        () async => runApp(
          EasyLocalization(
            supportedLocales: [
              Languages.english.toLocale(),
              Languages.vietnam.toLocale(),
            ],
            assetLoader: const CodegenLoader(),
            path:
                'assets/translations', // <-- change the path of the translation files
            fallbackLocale: Languages.english.toLocale(),
            child: App(
                orderRepository: orderRepository,
                notificationRepo: notificationRepo,
                searchHisRepo: searchHisRepo,
                checkOutRepository: checkOutRepository,
                cartRepository: cartRepository,
                theme: themeData,
                productsRepository: productRepository,
                authRepository: authRepository,
                chatRepo: chatRepo),
          ),
        ),
        blocObserver: AppBlocObserver(),
      );
    },
    (error, stackTrace) => log(error.toString(), stackTrace: stackTrace),
  );
}

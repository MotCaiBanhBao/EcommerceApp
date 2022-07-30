import 'package:auth_api/auth_api.dart';
import 'package:auth_repository/auth_repository.dart';
import 'package:cart_repository/cart_repository.dart';
import 'package:chat_repository/chat_repository.dart';
import 'package:check_out_repository/check_out_repository.dart';
import 'package:client/app/helper/localization.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:notification_repository/notification_repository.dart';
import 'package:order_repository/order_repository.dart';
import 'package:products_repository/products_repository.dart';
import 'package:search_history_repository/search_history_repository.dart';

import '../../middleware/auth_middleware.dart';
import '../../routes/routes.gr.dart';
import 'bloc/app_bloc.dart';

class App extends StatelessWidget {
  const App(
      {Key? key,
      required this.notificationRepo,
      required this.searchHisRepo,
      required this.checkOutRepository,
      required this.productsRepository,
      required this.authRepository,
      required this.theme,
      required this.cartRepository,
      required this.chatRepo,
      required this.orderRepository})
      : super(key: key);
  final SearchHisRepo searchHisRepo;
  final ProductsRepository productsRepository;
  final AuthRepository authRepository;
  final ThemeData theme;
  final CartRepository cartRepository;
  final CheckOutRepository checkOutRepository;
  final ChatRepository chatRepo;
  final NotificationRepository notificationRepo;
  final OrderRepository orderRepository;
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(providers: [
      RepositoryProvider(create: (context) => productsRepository),
      RepositoryProvider(create: (context) => authRepository),
      RepositoryProvider(create: (context) => cartRepository),
      RepositoryProvider(create: (context) => checkOutRepository),
      RepositoryProvider(create: (context) => searchHisRepo),
      RepositoryProvider(create: (context) => chatRepo),
      RepositoryProvider(create: (context) => notificationRepo),
      RepositoryProvider(create: (context) => orderRepository),
    ], child: AppView(theme: theme));
  }
}

class AppView extends StatelessWidget {
  final _appRouter = AppRouter(ensureAuthMiddleware: EnsureAuthMiddleware(), ensureShopMiddleware: EnsureShopMiddleware());

  AppView({Key? key, required this.theme}) : super(key: key);
  final ThemeData theme;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppBloc(
          FlutterLocalNotificationsPlugin(), context.read<AuthRepository>())
        ..add(const AppEvent.started()),
      child: BlocConsumer<AppBloc, AppState>(
        listener: (context, state) async {
          if (state.language != null) {
            await context.setLocale(state.language!.toLocale());
          }
        },
        buildWhen: (state, newState) {
          if (newState.language == null) {
            print("Not change == null");
            return false;
          } else if (state.language == newState.language) {
            print("Not change == ${newState.language}, ${state.language}");
            return false;
          } else if (state.language != newState.language) {
            print("change ${newState.language}, ${state.language}");
            return true;
          } else {
            print("change else");
            return true;
          }
        },
        builder: (context, state) {
          return MaterialApp.router(
            key: Key("${context.locale}"),
            supportedLocales: context.supportedLocales,
            localizationsDelegates: context.localizationDelegates,
            locale: context.locale,
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: theme,
            routerDelegate: _appRouter.delegate(),
            routeInformationParser: _appRouter.defaultRouteParser(),
          );
        },
      ),
    );
  }
}

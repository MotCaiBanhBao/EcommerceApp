// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i37;
import 'package:cart_repository/cart_repository.dart' as _i40;
import 'package:flutter/material.dart' as _i38;
import 'package:product_api/product_api.dart' as _i41;

import '../components/not_logged_in.dart' as _i33;
import '../components/not_shop_screen.dart' as _i35;
import '../middleware/auth_middleware.dart' as _i39;
import '../modules/cart/views/cart_screen.dart' as _i5;
import '../modules/chat/chat_screen.dart' as _i4;
import '../modules/check_out/view/check_out_screen.dart' as _i6;
import '../modules/check_profile/view/check_profile.dart' as _i24;
import '../modules/dashboard/views/dashboard_screen.dart' as _i29;
import '../modules/details/views/details_screen.dart' as _i7;
import '../modules/favorite_product/favorite_product_page.dart' as _i31;
import '../modules/find_product/views/components/object_detector_view.dart'
    as _i9;
import '../modules/find_product/views/find_product_screen.dart' as _i8;
import '../modules/forgot_password/views/forgot_password_screen.dart' as _i27;
import '../modules/home/views/home_screen.dart' as _i2;
import '../modules/messeages/message_page.dart' as _i30;
import '../modules/order_detail/view/order_detail.dart' as _i11;
import '../modules/order_page/order_page.dart' as _i13;
import '../modules/otp/views/otp_screen.dart' as _i36;
import '../modules/profile/views/components/change_language_page.dart' as _i17;
import '../modules/profile/views/components/create_new_product.dart' as _i21;
import '../modules/profile/views/components/legal_about_page.dart' as _i18;
import '../modules/profile/views/components/notification_page.dart' as _i19;
import '../modules/profile/views/components/settting_page.dart' as _i15;
import '../modules/profile/views/profile_screen.dart' as _i32;
import '../modules/reset_password/view/reset_password.dart' as _i25;
import '../modules/result_page/result_product.dart' as _i10;
import '../modules/review_product/review_product.dart' as _i26;
import '../modules/shop/view/your_shop.dart' as _i20;
import '../modules/shop_order_detail/shop_order_detail.dart' as _i14;
import '../modules/shop_order_page.dart/view/shop_order_page.dart' as _i12;
import '../modules/shop_products/views/components/form_product.dart' as _i34;
import '../modules/shop_products/views/shop_products.dart' as _i16;
import '../modules/shop_register/views/shop_register.dart' as _i3;
import '../modules/sign_in/views/sign_in_screen.dart' as _i28;
import '../modules/sign_up/views/sign_up_screen.dart' as _i23;
import '../modules/splash/views/splash_screen.dart' as _i1;
import '../modules/success_page/views/login_success_screen.dart' as _i22;

class AppRouter extends _i37.RootStackRouter {
  AppRouter(
      {_i38.GlobalKey<_i38.NavigatorState>? navigatorKey,
      required this.ensureAuthMiddleware,
      required this.ensureShopMiddleware})
      : super(navigatorKey);

  final _i39.EnsureAuthMiddleware ensureAuthMiddleware;

  final _i39.EnsureShopMiddleware ensureShopMiddleware;

  @override
  final Map<String, _i37.PageFactory> pagesMap = {
    SplashRoute.name: (routeData) {
      return _i37.MaterialPageX<dynamic>(
          routeData: routeData, child: _i1.SplashScreen());
    },
    HomeWrapperRoute.name: (routeData) {
      return _i37.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.HomeWrapperScreen());
    },
    ShopRegisterWrapperRoute.name: (routeData) {
      return _i37.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.ShopRegisterWrapperScreen());
    },
    ChatWrapperRoute.name: (routeData) {
      final args = routeData.argsAs<ChatWrapperRouteArgs>();
      return _i37.MaterialPageX<dynamic>(
          routeData: routeData,
          child:
              _i4.ChatWrapperScreen(key: args.key, anotherId: args.anotherId));
    },
    CartWrapperRoute.name: (routeData) {
      return _i37.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i5.CartWrapperScreen());
    },
    CheckOutWrapperRoute.name: (routeData) {
      final args = routeData.argsAs<CheckOutWrapperRouteArgs>();
      return _i37.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i6.CheckOutWrapperScreen(key: args.key, cart: args.cart));
    },
    DetailsWrapperRoute.name: (routeData) {
      final args = routeData.argsAs<DetailsWrapperRouteArgs>();
      return _i37.MaterialPageX<dynamic>(
          routeData: routeData,
          child:
              _i7.DetailsWrapperScreen(key: args.key, product: args.product));
    },
    SearchPageWrapperRoute.name: (routeData) {
      return _i37.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i8.SearchPageWrapperScreen());
    },
    ObjectDetectorRoute.name: (routeData) {
      return _i37.MaterialPageX<dynamic>(
          routeData: routeData, child: _i9.ObjectDetectorScreen());
    },
    ResultWrapperRoute.name: (routeData) {
      final args = routeData.argsAs<ResultWrapperRouteArgs>();
      return _i37.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i10.ResultWrapperScreen(
              key: args.key, dataSearch: args.dataSearch));
    },
    OrderDetailWrapperRoute.name: (routeData) {
      final args = routeData.argsAs<OrderDetailWrapperRouteArgs>();
      return _i37.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i11.OrderDetailWrapperScreen(
              key: args.key, orderID: args.orderID));
    },
    ShopOrderWrapperRoute.name: (routeData) {
      return _i37.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i12.ShopOrderWrapperScreen());
    },
    OrderPageWrapperRoute.name: (routeData) {
      return _i37.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i13.OrderPageWrapperScreen());
    },
    ShopOrderDetailWrapperRoute.name: (routeData) {
      final args = routeData.argsAs<ShopOrderDetailWrapperRouteArgs>();
      return _i37.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i14.ShopOrderDetailWrapperScreen(
              key: args.key, orderID: args.orderID));
    },
    SettingsRoute.name: (routeData) {
      return _i37.MaterialPageX<dynamic>(
          routeData: routeData, child: _i15.SettingsScreen());
    },
    ShopProductsWrapperRoute.name: (routeData) {
      return _i37.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i16.ShopProductsWrapperScreen());
    },
    ChangeLanguageRoute.name: (routeData) {
      return _i37.MaterialPageX<dynamic>(
          routeData: routeData, child: _i17.ChangeLanguageScreen());
    },
    LegalAboutRoute.name: (routeData) {
      return _i37.MaterialPageX<dynamic>(
          routeData: routeData, child: _i18.LegalAboutScreen());
    },
    NotificationSettingsRoute.name: (routeData) {
      return _i37.MaterialPageX<dynamic>(
          routeData: routeData, child: _i19.NotificationSettingsScreen());
    },
    YourShopWrapperRoute.name: (routeData) {
      return _i37.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i20.YourShopWrapperScreen());
    },
    CreateNewProductRoute.name: (routeData) {
      return _i37.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i21.CreateNewProductScreen());
    },
    SuccessRoute.name: (routeData) {
      return _i37.MaterialPageX<dynamic>(
          routeData: routeData, child: _i22.SuccessScreen());
    },
    SignUpWrapperRoute.name: (routeData) {
      return _i37.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i23.SignUpWrapperScreen());
    },
    CheckProfileWrapperRoute.name: (routeData) {
      final args = routeData.argsAs<CheckProfileWrapperRouteArgs>();
      return _i37.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i24.CheckProfileWrapperScreen(
              key: args.key, userID: args.userID));
    },
    ResetPasswordWrapperRoute.name: (routeData) {
      return _i37.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i25.ResetPasswordWrapperScreen());
    },
    ReviewProductWrapperRoute.name: (routeData) {
      final args = routeData.argsAs<ReviewProductWrapperRouteArgs>();
      return _i37.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i26.ReviewProductWrapperScreen(
              key: args.key, productID: args.productID));
    },
    ForgotPasswordRoute.name: (routeData) {
      return _i37.MaterialPageX<dynamic>(
          routeData: routeData, child: _i27.ForgotPasswordScreen());
    },
    SignInWrapperRoute.name: (routeData) {
      return _i37.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i28.SignInWrapperScreen());
    },
    DashBoardWrapperRoute.name: (routeData) {
      return _i37.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i29.DashBoardWrapperScreen());
    },
    MessageWrapperRoute.name: (routeData) {
      return _i37.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i30.MessageWrapperScreen());
    },
    FavoriteWrapperRoute.name: (routeData) {
      return _i37.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i31.FavoriteWrapperScreen());
    },
    ProfileWrapperRoute.name: (routeData) {
      return _i37.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i32.ProfileWrapperScreen());
    },
    CartRoute.name: (routeData) {
      return _i37.MaterialPageX<dynamic>(
          routeData: routeData, child: _i5.CartScreen());
    },
    MessageRoute.name: (routeData) {
      return _i37.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i30.MessageScreen());
    },
    NotLoggedinRoute.name: (routeData) {
      return _i37.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i33.NotLoggedinScreen());
    },
    FavoriteProductRoute.name: (routeData) {
      return _i37.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i31.FavoriteProductScreen());
    },
    ProfileRoute.name: (routeData) {
      return _i37.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i32.ProfileScreen());
    },
    ShopRegisterRoute.name: (routeData) {
      return _i37.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.ShopRegisterScreen());
    },
    ChatRoute.name: (routeData) {
      return _i37.MaterialPageX<dynamic>(
          routeData: routeData, child: _i4.ChatScreen());
    },
    CheckOutRoute.name: (routeData) {
      return _i37.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i6.CheckOutScreen());
    },
    DetailsRoute.name: (routeData) {
      return _i37.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i7.DetailsScreen());
    },
    SearchPageRoute.name: (routeData) {
      return _i37.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i8.SearchPageScreen());
    },
    ResultRoute.name: (routeData) {
      return _i37.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i10.ResultScreen());
    },
    OrderDetailRoute.name: (routeData) {
      return _i37.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i11.OrderDetailScreen());
    },
    ShopOrderRoute.name: (routeData) {
      return _i37.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i12.ShopOrderScreen());
    },
    OrderRoute.name: (routeData) {
      return _i37.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i13.OrderScreen());
    },
    ShopOrderDetailRoute.name: (routeData) {
      return _i37.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i14.ShopOrderDetailScreen());
    },
    ShopProductsRoute.name: (routeData) {
      return _i37.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i16.ShopProductsScreen());
    },
    FormProductRoute.name: (routeData) {
      final args = routeData.argsAs<FormProductRouteArgs>(
          orElse: () => const FormProductRouteArgs());
      return _i37.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i34.FormProductScreen(key: args.key, init: args.init));
    },
    YourShopRoute.name: (routeData) {
      return _i37.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i20.YourShopScreen());
    },
    NotShopRoute.name: (routeData) {
      return _i37.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i35.NotShopScreen());
    },
    SignUpRoute.name: (routeData) {
      return _i37.MaterialPageX<dynamic>(
          routeData: routeData, child: _i23.SignUpScreen());
    },
    CheckProfileRoute.name: (routeData) {
      return _i37.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i24.CheckProfileScreen());
    },
    ResetPasswordRoute.name: (routeData) {
      return _i37.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i25.ResetPasswordScreen());
    },
    ReviewProductRoute.name: (routeData) {
      return _i37.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i26.ReviewProductScreen());
    },
    SignInRoute.name: (routeData) {
      return _i37.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i28.SignInScreen());
    },
    OtpRoute.name: (routeData) {
      final args = routeData.argsAs<OtpRouteArgs>();
      return _i37.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i36.OtpScreen(
              key: args.key, hash: args.hash, email: args.email));
    }
  };

  @override
  List<_i37.RouteConfig> get routes => [
        _i37.RouteConfig(SplashRoute.name, path: '/'),
        _i37.RouteConfig(HomeWrapperRoute.name, path: '/home', children: [
          _i37.RouteConfig(DashBoardWrapperRoute.name,
              path: 'dashboard', parent: HomeWrapperRoute.name),
          _i37.RouteConfig(CartWrapperRoute.name,
              path: 'cart',
              parent: HomeWrapperRoute.name,
              children: [
                _i37.RouteConfig(CartRoute.name,
                    path: '', parent: CartWrapperRoute.name)
              ]),
          _i37.RouteConfig(MessageWrapperRoute.name,
              path: 'message_page',
              parent: HomeWrapperRoute.name,
              children: [
                _i37.RouteConfig(MessageRoute.name,
                    path: '',
                    parent: MessageWrapperRoute.name,
                    guards: [ensureAuthMiddleware]),
                _i37.RouteConfig(NotLoggedinRoute.name,
                    path: 'not_logged_in', parent: MessageWrapperRoute.name)
              ]),
          _i37.RouteConfig(FavoriteWrapperRoute.name,
              path: 'favorite',
              parent: HomeWrapperRoute.name,
              children: [
                _i37.RouteConfig(FavoriteProductRoute.name,
                    path: '',
                    parent: FavoriteWrapperRoute.name,
                    guards: [ensureAuthMiddleware]),
                _i37.RouteConfig(NotLoggedinRoute.name,
                    path: 'not_logged_in', parent: FavoriteWrapperRoute.name)
              ]),
          _i37.RouteConfig(ProfileWrapperRoute.name,
              path: 'profile',
              parent: HomeWrapperRoute.name,
              children: [
                _i37.RouteConfig('#redirect',
                    path: '',
                    parent: ProfileWrapperRoute.name,
                    redirectTo: 'ai',
                    fullMatch: true),
                _i37.RouteConfig(ProfileRoute.name,
                    path: 'ai',
                    parent: ProfileWrapperRoute.name,
                    guards: [ensureAuthMiddleware]),
                _i37.RouteConfig(NotLoggedinRoute.name,
                    path: 'not_logged_in', parent: ProfileWrapperRoute.name)
              ])
        ]),
        _i37.RouteConfig(ShopRegisterWrapperRoute.name,
            path: '/shop_resig',
            children: [
              _i37.RouteConfig(ShopRegisterRoute.name,
                  path: '', parent: ShopRegisterWrapperRoute.name)
            ]),
        _i37.RouteConfig(ChatWrapperRoute.name, path: '/chat_page', children: [
          _i37.RouteConfig(ChatRoute.name,
              path: '',
              parent: ChatWrapperRoute.name,
              guards: [ensureAuthMiddleware]),
          _i37.RouteConfig(NotLoggedinRoute.name,
              path: 'not_logged_in', parent: ChatWrapperRoute.name)
        ]),
        _i37.RouteConfig(CartWrapperRoute.name, path: 'cart', children: [
          _i37.RouteConfig(CartRoute.name,
              path: '', parent: CartWrapperRoute.name)
        ]),
        _i37.RouteConfig(CheckOutWrapperRoute.name,
            path: 'checkout',
            children: [
              _i37.RouteConfig(CheckOutRoute.name,
                  path: '',
                  parent: CheckOutWrapperRoute.name,
                  guards: [ensureAuthMiddleware]),
              _i37.RouteConfig(NotLoggedinRoute.name,
                  path: 'not_logged_in', parent: CheckOutWrapperRoute.name)
            ]),
        _i37.RouteConfig(DetailsWrapperRoute.name, path: '/detail', children: [
          _i37.RouteConfig(DetailsRoute.name,
              path: '', parent: DetailsWrapperRoute.name),
          _i37.RouteConfig(ProfileRoute.name,
              path: 'ai',
              parent: DetailsWrapperRoute.name,
              guards: [ensureAuthMiddleware])
        ]),
        _i37.RouteConfig(SearchPageWrapperRoute.name,
            path: '/find_product',
            children: [
              _i37.RouteConfig(SearchPageRoute.name,
                  path: '', parent: SearchPageWrapperRoute.name)
            ]),
        _i37.RouteConfig(ObjectDetectorRoute.name, path: '/detector'),
        _i37.RouteConfig(ResultWrapperRoute.name,
            path: '/result_page',
            children: [
              _i37.RouteConfig(ResultRoute.name,
                  path: '', parent: ResultWrapperRoute.name)
            ]),
        _i37.RouteConfig(OrderDetailWrapperRoute.name,
            path: '/order_detail_page',
            children: [
              _i37.RouteConfig(OrderDetailRoute.name,
                  path: '', parent: OrderDetailWrapperRoute.name)
            ]),
        _i37.RouteConfig(ShopOrderWrapperRoute.name,
            path: '/shop_all_order_page',
            children: [
              _i37.RouteConfig(ShopOrderRoute.name,
                  path: '', parent: ShopOrderWrapperRoute.name)
            ]),
        _i37.RouteConfig(OrderPageWrapperRoute.name,
            path: '/all_order_page',
            children: [
              _i37.RouteConfig(OrderRoute.name,
                  path: '',
                  parent: OrderPageWrapperRoute.name,
                  guards: [ensureAuthMiddleware]),
              _i37.RouteConfig(NotLoggedinRoute.name,
                  path: 'not_logged_in', parent: OrderPageWrapperRoute.name)
            ]),
        _i37.RouteConfig(ShopOrderDetailWrapperRoute.name,
            path: '/shop_order_detail',
            children: [
              _i37.RouteConfig(ShopOrderDetailRoute.name,
                  path: '', parent: ShopOrderDetailWrapperRoute.name)
            ]),
        _i37.RouteConfig(SettingsRoute.name, path: '/setting'),
        _i37.RouteConfig(ShopProductsWrapperRoute.name,
            path: '/shop_products',
            children: [
              _i37.RouteConfig(ShopProductsRoute.name,
                  path: '', parent: ShopProductsWrapperRoute.name),
              _i37.RouteConfig(FormProductRoute.name,
                  path: 'add_new', parent: ShopProductsWrapperRoute.name)
            ]),
        _i37.RouteConfig(ChangeLanguageRoute.name, path: '/language_change'),
        _i37.RouteConfig(LegalAboutRoute.name, path: '/legal_screen'),
        _i37.RouteConfig(NotificationSettingsRoute.name,
            path: '/notification_setting'),
        _i37.RouteConfig(YourShopWrapperRoute.name,
            path: '/my_shop',
            children: [
              _i37.RouteConfig(YourShopRoute.name,
                  path: '',
                  parent: YourShopWrapperRoute.name,
                  guards: [ensureShopMiddleware]),
              _i37.RouteConfig(NotShopRoute.name,
                  path: 'not_shop_screen', parent: YourShopWrapperRoute.name)
            ]),
        _i37.RouteConfig(CreateNewProductRoute.name, path: '/create_product'),
        _i37.RouteConfig(SuccessRoute.name, path: '/success_screen'),
        _i37.RouteConfig(SignUpWrapperRoute.name, path: '/signup', children: [
          _i37.RouteConfig(SignUpRoute.name,
              path: '', parent: SignUpWrapperRoute.name)
        ]),
        _i37.RouteConfig(CheckProfileWrapperRoute.name,
            path: '/check_profile_user',
            children: [
              _i37.RouteConfig(CheckProfileRoute.name,
                  path: '', parent: CheckProfileWrapperRoute.name)
            ]),
        _i37.RouteConfig(ResetPasswordWrapperRoute.name,
            path: '/reset_password',
            children: [
              _i37.RouteConfig(ResetPasswordRoute.name,
                  path: '', parent: ResetPasswordWrapperRoute.name)
            ]),
        _i37.RouteConfig(ReviewProductWrapperRoute.name,
            path: '/review',
            children: [
              _i37.RouteConfig(ReviewProductRoute.name,
                  path: '', parent: ReviewProductWrapperRoute.name)
            ]),
        _i37.RouteConfig(ForgotPasswordRoute.name, path: '/forgot_password'),
        _i37.RouteConfig(SignInWrapperRoute.name, path: '/login', children: [
          _i37.RouteConfig(SignInRoute.name,
              path: '', parent: SignInWrapperRoute.name),
          _i37.RouteConfig(OtpRoute.name,
              path: 'otp', parent: SignInWrapperRoute.name)
        ])
      ];
}

/// generated route for
/// [_i1.SplashScreen]
class SplashRoute extends _i37.PageRouteInfo<void> {
  const SplashRoute() : super(SplashRoute.name, path: '/');

  static const String name = 'SplashRoute';
}

/// generated route for
/// [_i2.HomeWrapperScreen]
class HomeWrapperRoute extends _i37.PageRouteInfo<void> {
  const HomeWrapperRoute({List<_i37.PageRouteInfo>? children})
      : super(HomeWrapperRoute.name, path: '/home', initialChildren: children);

  static const String name = 'HomeWrapperRoute';
}

/// generated route for
/// [_i3.ShopRegisterWrapperScreen]
class ShopRegisterWrapperRoute extends _i37.PageRouteInfo<void> {
  const ShopRegisterWrapperRoute({List<_i37.PageRouteInfo>? children})
      : super(ShopRegisterWrapperRoute.name,
            path: '/shop_resig', initialChildren: children);

  static const String name = 'ShopRegisterWrapperRoute';
}

/// generated route for
/// [_i4.ChatWrapperScreen]
class ChatWrapperRoute extends _i37.PageRouteInfo<ChatWrapperRouteArgs> {
  ChatWrapperRoute(
      {_i38.Key? key,
      required String anotherId,
      List<_i37.PageRouteInfo>? children})
      : super(ChatWrapperRoute.name,
            path: '/chat_page',
            args: ChatWrapperRouteArgs(key: key, anotherId: anotherId),
            initialChildren: children);

  static const String name = 'ChatWrapperRoute';
}

class ChatWrapperRouteArgs {
  const ChatWrapperRouteArgs({this.key, required this.anotherId});

  final _i38.Key? key;

  final String anotherId;

  @override
  String toString() {
    return 'ChatWrapperRouteArgs{key: $key, anotherId: $anotherId}';
  }
}

/// generated route for
/// [_i5.CartWrapperScreen]
class CartWrapperRoute extends _i37.PageRouteInfo<void> {
  const CartWrapperRoute({List<_i37.PageRouteInfo>? children})
      : super(CartWrapperRoute.name, path: 'cart', initialChildren: children);

  static const String name = 'CartWrapperRoute';
}

/// generated route for
/// [_i6.CheckOutWrapperScreen]
class CheckOutWrapperRoute
    extends _i37.PageRouteInfo<CheckOutWrapperRouteArgs> {
  CheckOutWrapperRoute(
      {_i38.Key? key,
      required _i40.CartModel cart,
      List<_i37.PageRouteInfo>? children})
      : super(CheckOutWrapperRoute.name,
            path: 'checkout',
            args: CheckOutWrapperRouteArgs(key: key, cart: cart),
            initialChildren: children);

  static const String name = 'CheckOutWrapperRoute';
}

class CheckOutWrapperRouteArgs {
  const CheckOutWrapperRouteArgs({this.key, required this.cart});

  final _i38.Key? key;

  final _i40.CartModel cart;

  @override
  String toString() {
    return 'CheckOutWrapperRouteArgs{key: $key, cart: $cart}';
  }
}

/// generated route for
/// [_i7.DetailsWrapperScreen]
class DetailsWrapperRoute extends _i37.PageRouteInfo<DetailsWrapperRouteArgs> {
  DetailsWrapperRoute(
      {_i38.Key? key,
      required _i41.ProductModel product,
      List<_i37.PageRouteInfo>? children})
      : super(DetailsWrapperRoute.name,
            path: '/detail',
            args: DetailsWrapperRouteArgs(key: key, product: product),
            initialChildren: children);

  static const String name = 'DetailsWrapperRoute';
}

class DetailsWrapperRouteArgs {
  const DetailsWrapperRouteArgs({this.key, required this.product});

  final _i38.Key? key;

  final _i41.ProductModel product;

  @override
  String toString() {
    return 'DetailsWrapperRouteArgs{key: $key, product: $product}';
  }
}

/// generated route for
/// [_i8.SearchPageWrapperScreen]
class SearchPageWrapperRoute extends _i37.PageRouteInfo<void> {
  const SearchPageWrapperRoute({List<_i37.PageRouteInfo>? children})
      : super(SearchPageWrapperRoute.name,
            path: '/find_product', initialChildren: children);

  static const String name = 'SearchPageWrapperRoute';
}

/// generated route for
/// [_i9.ObjectDetectorScreen]
class ObjectDetectorRoute extends _i37.PageRouteInfo<void> {
  const ObjectDetectorRoute()
      : super(ObjectDetectorRoute.name, path: '/detector');

  static const String name = 'ObjectDetectorRoute';
}

/// generated route for
/// [_i10.ResultWrapperScreen]
class ResultWrapperRoute extends _i37.PageRouteInfo<ResultWrapperRouteArgs> {
  ResultWrapperRoute(
      {_i38.Key? key,
      required String dataSearch,
      List<_i37.PageRouteInfo>? children})
      : super(ResultWrapperRoute.name,
            path: '/result_page',
            args: ResultWrapperRouteArgs(key: key, dataSearch: dataSearch),
            initialChildren: children);

  static const String name = 'ResultWrapperRoute';
}

class ResultWrapperRouteArgs {
  const ResultWrapperRouteArgs({this.key, required this.dataSearch});

  final _i38.Key? key;

  final String dataSearch;

  @override
  String toString() {
    return 'ResultWrapperRouteArgs{key: $key, dataSearch: $dataSearch}';
  }
}

/// generated route for
/// [_i11.OrderDetailWrapperScreen]
class OrderDetailWrapperRoute
    extends _i37.PageRouteInfo<OrderDetailWrapperRouteArgs> {
  OrderDetailWrapperRoute(
      {_i38.Key? key,
      required String orderID,
      List<_i37.PageRouteInfo>? children})
      : super(OrderDetailWrapperRoute.name,
            path: '/order_detail_page',
            args: OrderDetailWrapperRouteArgs(key: key, orderID: orderID),
            initialChildren: children);

  static const String name = 'OrderDetailWrapperRoute';
}

class OrderDetailWrapperRouteArgs {
  const OrderDetailWrapperRouteArgs({this.key, required this.orderID});

  final _i38.Key? key;

  final String orderID;

  @override
  String toString() {
    return 'OrderDetailWrapperRouteArgs{key: $key, orderID: $orderID}';
  }
}

/// generated route for
/// [_i12.ShopOrderWrapperScreen]
class ShopOrderWrapperRoute extends _i37.PageRouteInfo<void> {
  const ShopOrderWrapperRoute({List<_i37.PageRouteInfo>? children})
      : super(ShopOrderWrapperRoute.name,
            path: '/shop_all_order_page', initialChildren: children);

  static const String name = 'ShopOrderWrapperRoute';
}

/// generated route for
/// [_i13.OrderPageWrapperScreen]
class OrderPageWrapperRoute extends _i37.PageRouteInfo<void> {
  const OrderPageWrapperRoute({List<_i37.PageRouteInfo>? children})
      : super(OrderPageWrapperRoute.name,
            path: '/all_order_page', initialChildren: children);

  static const String name = 'OrderPageWrapperRoute';
}

/// generated route for
/// [_i14.ShopOrderDetailWrapperScreen]
class ShopOrderDetailWrapperRoute
    extends _i37.PageRouteInfo<ShopOrderDetailWrapperRouteArgs> {
  ShopOrderDetailWrapperRoute(
      {_i38.Key? key,
      required String orderID,
      List<_i37.PageRouteInfo>? children})
      : super(ShopOrderDetailWrapperRoute.name,
            path: '/shop_order_detail',
            args: ShopOrderDetailWrapperRouteArgs(key: key, orderID: orderID),
            initialChildren: children);

  static const String name = 'ShopOrderDetailWrapperRoute';
}

class ShopOrderDetailWrapperRouteArgs {
  const ShopOrderDetailWrapperRouteArgs({this.key, required this.orderID});

  final _i38.Key? key;

  final String orderID;

  @override
  String toString() {
    return 'ShopOrderDetailWrapperRouteArgs{key: $key, orderID: $orderID}';
  }
}

/// generated route for
/// [_i15.SettingsScreen]
class SettingsRoute extends _i37.PageRouteInfo<void> {
  const SettingsRoute() : super(SettingsRoute.name, path: '/setting');

  static const String name = 'SettingsRoute';
}

/// generated route for
/// [_i16.ShopProductsWrapperScreen]
class ShopProductsWrapperRoute extends _i37.PageRouteInfo<void> {
  const ShopProductsWrapperRoute({List<_i37.PageRouteInfo>? children})
      : super(ShopProductsWrapperRoute.name,
            path: '/shop_products', initialChildren: children);

  static const String name = 'ShopProductsWrapperRoute';
}

/// generated route for
/// [_i17.ChangeLanguageScreen]
class ChangeLanguageRoute extends _i37.PageRouteInfo<void> {
  const ChangeLanguageRoute()
      : super(ChangeLanguageRoute.name, path: '/language_change');

  static const String name = 'ChangeLanguageRoute';
}

/// generated route for
/// [_i18.LegalAboutScreen]
class LegalAboutRoute extends _i37.PageRouteInfo<void> {
  const LegalAboutRoute() : super(LegalAboutRoute.name, path: '/legal_screen');

  static const String name = 'LegalAboutRoute';
}

/// generated route for
/// [_i19.NotificationSettingsScreen]
class NotificationSettingsRoute extends _i37.PageRouteInfo<void> {
  const NotificationSettingsRoute()
      : super(NotificationSettingsRoute.name, path: '/notification_setting');

  static const String name = 'NotificationSettingsRoute';
}

/// generated route for
/// [_i20.YourShopWrapperScreen]
class YourShopWrapperRoute extends _i37.PageRouteInfo<void> {
  const YourShopWrapperRoute({List<_i37.PageRouteInfo>? children})
      : super(YourShopWrapperRoute.name,
            path: '/my_shop', initialChildren: children);

  static const String name = 'YourShopWrapperRoute';
}

/// generated route for
/// [_i21.CreateNewProductScreen]
class CreateNewProductRoute extends _i37.PageRouteInfo<void> {
  const CreateNewProductRoute()
      : super(CreateNewProductRoute.name, path: '/create_product');

  static const String name = 'CreateNewProductRoute';
}

/// generated route for
/// [_i22.SuccessScreen]
class SuccessRoute extends _i37.PageRouteInfo<void> {
  const SuccessRoute() : super(SuccessRoute.name, path: '/success_screen');

  static const String name = 'SuccessRoute';
}

/// generated route for
/// [_i23.SignUpWrapperScreen]
class SignUpWrapperRoute extends _i37.PageRouteInfo<void> {
  const SignUpWrapperRoute({List<_i37.PageRouteInfo>? children})
      : super(SignUpWrapperRoute.name,
            path: '/signup', initialChildren: children);

  static const String name = 'SignUpWrapperRoute';
}

/// generated route for
/// [_i24.CheckProfileWrapperScreen]
class CheckProfileWrapperRoute
    extends _i37.PageRouteInfo<CheckProfileWrapperRouteArgs> {
  CheckProfileWrapperRoute(
      {_i38.Key? key,
      required String userID,
      List<_i37.PageRouteInfo>? children})
      : super(CheckProfileWrapperRoute.name,
            path: '/check_profile_user',
            args: CheckProfileWrapperRouteArgs(key: key, userID: userID),
            initialChildren: children);

  static const String name = 'CheckProfileWrapperRoute';
}

class CheckProfileWrapperRouteArgs {
  const CheckProfileWrapperRouteArgs({this.key, required this.userID});

  final _i38.Key? key;

  final String userID;

  @override
  String toString() {
    return 'CheckProfileWrapperRouteArgs{key: $key, userID: $userID}';
  }
}

/// generated route for
/// [_i25.ResetPasswordWrapperScreen]
class ResetPasswordWrapperRoute extends _i37.PageRouteInfo<void> {
  const ResetPasswordWrapperRoute({List<_i37.PageRouteInfo>? children})
      : super(ResetPasswordWrapperRoute.name,
            path: '/reset_password', initialChildren: children);

  static const String name = 'ResetPasswordWrapperRoute';
}

/// generated route for
/// [_i26.ReviewProductWrapperScreen]
class ReviewProductWrapperRoute
    extends _i37.PageRouteInfo<ReviewProductWrapperRouteArgs> {
  ReviewProductWrapperRoute(
      {_i38.Key? key,
      required String productID,
      List<_i37.PageRouteInfo>? children})
      : super(ReviewProductWrapperRoute.name,
            path: '/review',
            args: ReviewProductWrapperRouteArgs(key: key, productID: productID),
            initialChildren: children);

  static const String name = 'ReviewProductWrapperRoute';
}

class ReviewProductWrapperRouteArgs {
  const ReviewProductWrapperRouteArgs({this.key, required this.productID});

  final _i38.Key? key;

  final String productID;

  @override
  String toString() {
    return 'ReviewProductWrapperRouteArgs{key: $key, productID: $productID}';
  }
}

/// generated route for
/// [_i27.ForgotPasswordScreen]
class ForgotPasswordRoute extends _i37.PageRouteInfo<void> {
  const ForgotPasswordRoute()
      : super(ForgotPasswordRoute.name, path: '/forgot_password');

  static const String name = 'ForgotPasswordRoute';
}

/// generated route for
/// [_i28.SignInWrapperScreen]
class SignInWrapperRoute extends _i37.PageRouteInfo<void> {
  const SignInWrapperRoute({List<_i37.PageRouteInfo>? children})
      : super(SignInWrapperRoute.name,
            path: '/login', initialChildren: children);

  static const String name = 'SignInWrapperRoute';
}

/// generated route for
/// [_i29.DashBoardWrapperScreen]
class DashBoardWrapperRoute extends _i37.PageRouteInfo<void> {
  const DashBoardWrapperRoute()
      : super(DashBoardWrapperRoute.name, path: 'dashboard');

  static const String name = 'DashBoardWrapperRoute';
}

/// generated route for
/// [_i30.MessageWrapperScreen]
class MessageWrapperRoute extends _i37.PageRouteInfo<void> {
  const MessageWrapperRoute({List<_i37.PageRouteInfo>? children})
      : super(MessageWrapperRoute.name,
            path: 'message_page', initialChildren: children);

  static const String name = 'MessageWrapperRoute';
}

/// generated route for
/// [_i31.FavoriteWrapperScreen]
class FavoriteWrapperRoute extends _i37.PageRouteInfo<void> {
  const FavoriteWrapperRoute({List<_i37.PageRouteInfo>? children})
      : super(FavoriteWrapperRoute.name,
            path: 'favorite', initialChildren: children);

  static const String name = 'FavoriteWrapperRoute';
}

/// generated route for
/// [_i32.ProfileWrapperScreen]
class ProfileWrapperRoute extends _i37.PageRouteInfo<void> {
  const ProfileWrapperRoute({List<_i37.PageRouteInfo>? children})
      : super(ProfileWrapperRoute.name,
            path: 'profile', initialChildren: children);

  static const String name = 'ProfileWrapperRoute';
}

/// generated route for
/// [_i5.CartScreen]
class CartRoute extends _i37.PageRouteInfo<void> {
  const CartRoute() : super(CartRoute.name, path: '');

  static const String name = 'CartRoute';
}

/// generated route for
/// [_i30.MessageScreen]
class MessageRoute extends _i37.PageRouteInfo<void> {
  const MessageRoute() : super(MessageRoute.name, path: '');

  static const String name = 'MessageRoute';
}

/// generated route for
/// [_i33.NotLoggedinScreen]
class NotLoggedinRoute extends _i37.PageRouteInfo<void> {
  const NotLoggedinRoute()
      : super(NotLoggedinRoute.name, path: 'not_logged_in');

  static const String name = 'NotLoggedinRoute';
}

/// generated route for
/// [_i31.FavoriteProductScreen]
class FavoriteProductRoute extends _i37.PageRouteInfo<void> {
  const FavoriteProductRoute() : super(FavoriteProductRoute.name, path: '');

  static const String name = 'FavoriteProductRoute';
}

/// generated route for
/// [_i32.ProfileScreen]
class ProfileRoute extends _i37.PageRouteInfo<void> {
  const ProfileRoute() : super(ProfileRoute.name, path: 'ai');

  static const String name = 'ProfileRoute';
}

/// generated route for
/// [_i3.ShopRegisterScreen]
class ShopRegisterRoute extends _i37.PageRouteInfo<void> {
  const ShopRegisterRoute() : super(ShopRegisterRoute.name, path: '');

  static const String name = 'ShopRegisterRoute';
}

/// generated route for
/// [_i4.ChatScreen]
class ChatRoute extends _i37.PageRouteInfo<void> {
  const ChatRoute() : super(ChatRoute.name, path: '');

  static const String name = 'ChatRoute';
}

/// generated route for
/// [_i6.CheckOutScreen]
class CheckOutRoute extends _i37.PageRouteInfo<void> {
  const CheckOutRoute() : super(CheckOutRoute.name, path: '');

  static const String name = 'CheckOutRoute';
}

/// generated route for
/// [_i7.DetailsScreen]
class DetailsRoute extends _i37.PageRouteInfo<void> {
  const DetailsRoute() : super(DetailsRoute.name, path: '');

  static const String name = 'DetailsRoute';
}

/// generated route for
/// [_i8.SearchPageScreen]
class SearchPageRoute extends _i37.PageRouteInfo<void> {
  const SearchPageRoute() : super(SearchPageRoute.name, path: '');

  static const String name = 'SearchPageRoute';
}

/// generated route for
/// [_i10.ResultScreen]
class ResultRoute extends _i37.PageRouteInfo<void> {
  const ResultRoute() : super(ResultRoute.name, path: '');

  static const String name = 'ResultRoute';
}

/// generated route for
/// [_i11.OrderDetailScreen]
class OrderDetailRoute extends _i37.PageRouteInfo<void> {
  const OrderDetailRoute() : super(OrderDetailRoute.name, path: '');

  static const String name = 'OrderDetailRoute';
}

/// generated route for
/// [_i12.ShopOrderScreen]
class ShopOrderRoute extends _i37.PageRouteInfo<void> {
  const ShopOrderRoute() : super(ShopOrderRoute.name, path: '');

  static const String name = 'ShopOrderRoute';
}

/// generated route for
/// [_i13.OrderScreen]
class OrderRoute extends _i37.PageRouteInfo<void> {
  const OrderRoute() : super(OrderRoute.name, path: '');

  static const String name = 'OrderRoute';
}

/// generated route for
/// [_i14.ShopOrderDetailScreen]
class ShopOrderDetailRoute extends _i37.PageRouteInfo<void> {
  const ShopOrderDetailRoute() : super(ShopOrderDetailRoute.name, path: '');

  static const String name = 'ShopOrderDetailRoute';
}

/// generated route for
/// [_i16.ShopProductsScreen]
class ShopProductsRoute extends _i37.PageRouteInfo<void> {
  const ShopProductsRoute() : super(ShopProductsRoute.name, path: '');

  static const String name = 'ShopProductsRoute';
}

/// generated route for
/// [_i34.FormProductScreen]
class FormProductRoute extends _i37.PageRouteInfo<FormProductRouteArgs> {
  FormProductRoute({_i38.Key? key, _i41.ProductModel? init})
      : super(FormProductRoute.name,
            path: 'add_new', args: FormProductRouteArgs(key: key, init: init));

  static const String name = 'FormProductRoute';
}

class FormProductRouteArgs {
  const FormProductRouteArgs({this.key, this.init});

  final _i38.Key? key;

  final _i41.ProductModel? init;

  @override
  String toString() {
    return 'FormProductRouteArgs{key: $key, init: $init}';
  }
}

/// generated route for
/// [_i20.YourShopScreen]
class YourShopRoute extends _i37.PageRouteInfo<void> {
  const YourShopRoute() : super(YourShopRoute.name, path: '');

  static const String name = 'YourShopRoute';
}

/// generated route for
/// [_i35.NotShopScreen]
class NotShopRoute extends _i37.PageRouteInfo<void> {
  const NotShopRoute() : super(NotShopRoute.name, path: 'not_shop_screen');

  static const String name = 'NotShopRoute';
}

/// generated route for
/// [_i23.SignUpScreen]
class SignUpRoute extends _i37.PageRouteInfo<void> {
  const SignUpRoute() : super(SignUpRoute.name, path: '');

  static const String name = 'SignUpRoute';
}

/// generated route for
/// [_i24.CheckProfileScreen]
class CheckProfileRoute extends _i37.PageRouteInfo<void> {
  const CheckProfileRoute() : super(CheckProfileRoute.name, path: '');

  static const String name = 'CheckProfileRoute';
}

/// generated route for
/// [_i25.ResetPasswordScreen]
class ResetPasswordRoute extends _i37.PageRouteInfo<void> {
  const ResetPasswordRoute() : super(ResetPasswordRoute.name, path: '');

  static const String name = 'ResetPasswordRoute';
}

/// generated route for
/// [_i26.ReviewProductScreen]
class ReviewProductRoute extends _i37.PageRouteInfo<void> {
  const ReviewProductRoute() : super(ReviewProductRoute.name, path: '');

  static const String name = 'ReviewProductRoute';
}

/// generated route for
/// [_i28.SignInScreen]
class SignInRoute extends _i37.PageRouteInfo<void> {
  const SignInRoute() : super(SignInRoute.name, path: '');

  static const String name = 'SignInRoute';
}

/// generated route for
/// [_i36.OtpScreen]
class OtpRoute extends _i37.PageRouteInfo<OtpRouteArgs> {
  OtpRoute({_i38.Key? key, required String hash, required String email})
      : super(OtpRoute.name,
            path: 'otp',
            args: OtpRouteArgs(key: key, hash: hash, email: email));

  static const String name = 'OtpRoute';
}

class OtpRouteArgs {
  const OtpRouteArgs({this.key, required this.hash, required this.email});

  final _i38.Key? key;

  final String hash;

  final String email;

  @override
  String toString() {
    return 'OtpRouteArgs{key: $key, hash: $hash, email: $email}';
  }
}

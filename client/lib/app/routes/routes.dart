import 'package:auto_route/annotations.dart';
import 'package:client/app/components/not_logged_in.dart';
import 'package:client/app/components/not_shop_screen.dart';
import 'package:client/app/modules/cart/views/cart_screen.dart';
import 'package:client/app/modules/check_out/view/check_out_screen.dart';
import 'package:client/app/modules/check_profile/view/check_profile.dart';
import 'package:client/app/modules/dashboard/views/dashboard_screen.dart';
import 'package:client/app/modules/details/views/details_screen.dart';
import 'package:client/app/modules/favorite_product/favorite_product_page.dart';
import 'package:client/app/modules/find_product/views/find_product_screen.dart';
import 'package:client/app/modules/forgot_password/views/forgot_password_screen.dart';
import 'package:client/app/modules/order_detail/view/order_detail.dart';
import 'package:client/app/modules/order_page/order_page.dart';
import 'package:client/app/modules/otp/views/otp_screen.dart';
import 'package:client/app/modules/profile/views/components/change_language_page.dart';
import 'package:client/app/modules/profile/views/components/create_new_product.dart';
import 'package:client/app/modules/profile/views/components/legal_about_page.dart';
import 'package:client/app/modules/profile/views/components/notification_page.dart';
import 'package:client/app/modules/profile/views/components/settting_page.dart';
import 'package:client/app/modules/reset_password/view/reset_password.dart';
import 'package:client/app/modules/review_product/review_product.dart';
import 'package:client/app/modules/shop/view/your_shop.dart';
import 'package:client/app/modules/profile/views/profile_screen.dart';
import 'package:client/app/modules/shop_order_detail/shop_order_detail.dart';
import 'package:client/app/modules/shop_order_page.dart/view/shop_order_page.dart';
import 'package:client/app/modules/shop_products/views/shop_products.dart';
import 'package:client/app/modules/shop_register/views/shop_register.dart';
import 'package:client/app/modules/sign_in/views/sign_in_screen.dart';
import 'package:client/app/modules/sign_up/views/sign_up_screen.dart';
import 'package:client/app/modules/splash/views/splash_screen.dart';
import '../middleware/auth_middleware.dart';
import '../modules/chat/chat_screen.dart';
import '../modules/find_product/views/components/object_detector_view.dart';
import '../modules/result_page/result_product.dart';
import '../modules/home/views/home_screen.dart';
import '../modules/messeages/message_page.dart';
import '../modules/shop_products/views/components/form_product.dart';
import '../modules/success_page/views/login_success_screen.dart';

@MaterialAutoRouter(replaceInRouteName: 'Screen,Route', routes: <AutoRoute>[
  AutoRoute(
    path: '/',
    page: SplashScreen,
  ),
  AutoRoute(
    path: '/home',
    page: HomeWrapperScreen,
    children: [
      AutoRoute(
        path: 'dashboard',
        page: DashBoardWrapperScreen,
        // children: [
        //   AutoRoute(
        //     path: 'detail',
        //     page: DetailsScreen,
        //   ),
        //   AutoRoute(
        //     path: 'find_product',
        //     page: SearchPage,
        //   ),
        // ],
      ),
      AutoRoute(
        path: 'cart',
        page: CartWrapperScreen,
        children: [
          AutoRoute(page: CartScreen, path: ''),
        ],
      ),
      AutoRoute(
        path: 'message_page',
        page: MessageWrapperScreen,
        children: [
          AutoRoute(
              page: MessageScreen,
              path: '',
              initial: true,
              guards: [EnsureAuthMiddleware]),
          AutoRoute(
            path: 'not_logged_in',
            page: NotLoggedinScreen,
          ),
        ],
      ),
      AutoRoute(
        page: FavoriteWrapperScreen,
        path: 'favorite',
        children: [
          AutoRoute(
              page: FavoriteProductScreen,
              path: '',
              initial: true,
              guards: [EnsureAuthMiddleware]),
          AutoRoute(
            path: 'not_logged_in',
            page: NotLoggedinScreen,
          ),
        ],
      ),
      AutoRoute(
        path: 'profile',
        page: ProfileWrapperScreen,
        children: [
          AutoRoute(
              page: ProfileScreen,
              path: 'ai',
              guards: [EnsureAuthMiddleware],
              initial: true),
          AutoRoute(
            path: 'not_logged_in',
            page: NotLoggedinScreen,
          ),
        ],
      ),
    ],
  ),
  AutoRoute(
    path: '/shop_resig',
    page: ShopRegisterWrapperScreen,
    children: [
      AutoRoute(
        page: ShopRegisterScreen,
        path: '',
        initial: true,
      ),
    ],
  ),
  AutoRoute(
    path: '/chat_page',
    page: ChatWrapperScreen,
    children: [
      AutoRoute(
        page: ChatScreen,
        path: '',
        initial: true,
        guards: [EnsureAuthMiddleware],
      ),
      AutoRoute(
        path: 'not_logged_in',
        page: NotLoggedinScreen,
      ),
    ],
  ),
  AutoRoute(
    path: 'cart',
    page: CartWrapperScreen,
    children: [
      AutoRoute(page: CartScreen, path: ''),
    ],
  ),
  AutoRoute(path: 'checkout', page: CheckOutWrapperScreen, children: [
    AutoRoute(
      path: '',
      page: CheckOutScreen,
      guards: [EnsureAuthMiddleware],
    ),
    AutoRoute(
      path: 'not_logged_in',
      page: NotLoggedinScreen,
    ),
  ]),
  AutoRoute(
    path: '/detail',
    page: DetailsWrapperScreen,
    children: [
      AutoRoute(
        path: '',
        page: DetailsScreen,
      ),
      AutoRoute(
          page: ProfileScreen,
          path: 'ai',
          guards: [EnsureAuthMiddleware],
          initial: true),
    ],
  ),
  AutoRoute(
    path: '/find_product',
    page: SearchPageWrapperScreen,
    children: [AutoRoute(page: SearchPageScreen, path: '', initial: true)],
  ),
  AutoRoute(
    page: ObjectDetectorScreen,
    path: '/detector',
  ),
  AutoRoute(
    path: '/result_page',
    page: ResultWrapperScreen,
    children: [AutoRoute(page: ResultScreen, path: '', initial: true)],
  ),
  AutoRoute(
    path: '/order_detail_page',
    page: OrderDetailWrapperScreen,
    children: [AutoRoute(page: OrderDetailScreen, path: '', initial: true)],
  ),
  AutoRoute(
    path: '/shop_all_order_page',
    page: ShopOrderWrapperScreen,
    children: [
      AutoRoute(
        page: ShopOrderScreen,
        path: '',
        initial: true,
      ),
    ],
  ),
  AutoRoute(
    path: '/all_order_page',
    page: OrderPageWrapperScreen,
    children: [
      AutoRoute(
        page: OrderScreen,
        path: '',
        initial: true,
        guards: [EnsureAuthMiddleware],
      ),
      AutoRoute(
        path: 'not_logged_in',
        page: NotLoggedinScreen,
      ),
    ],
  ),
  AutoRoute(
    path: '/shop_order_detail',
    page: ShopOrderDetailWrapperScreen,
    children: [
      AutoRoute(
        page: ShopOrderDetailScreen,
        path: '',
        initial: true,
      ),
    ],
  ),
  AutoRoute(
    path: '/setting',
    page: SettingsScreen,
  ),
  AutoRoute(path: '/shop_products', page: ShopProductsWrapperScreen, children: [
    AutoRoute(path: '', page: ShopProductsScreen),
    AutoRoute(path: 'add_new', page: FormProductScreen)
  ]),
  AutoRoute(page: ChangeLanguageScreen, path: '/language_change'),
  AutoRoute(page: LegalAboutScreen, path: '/legal_screen'),
  AutoRoute(page: NotificationSettingsScreen, path: '/notification_setting'),
  AutoRoute(page: YourShopWrapperScreen, path: '/my_shop', children: [
    AutoRoute(
        page: YourShopScreen,
        path: '',
        initial: true,
        guards: [EnsureShopMiddleware]),
    AutoRoute(
      path: 'not_shop_screen',
      page: NotShopScreen,
    ),
  ]),
  AutoRoute(page: CreateNewProductScreen, path: '/create_product'),
  AutoRoute(page: SuccessScreen, path: '/success_screen'),
  AutoRoute(path: '/signup', page: SignUpWrapperScreen, children: [
    AutoRoute(
      path: '',
      page: SignUpScreen,
    ),
  ]),
  AutoRoute(
      path: '/check_profile_user',
      page: CheckProfileWrapperScreen,
      children: [
        AutoRoute(
          path: '',
          page: CheckProfileScreen,
        ),
      ]),
  AutoRoute(
      path: '/reset_password',
      page: ResetPasswordWrapperScreen,
      children: [
        AutoRoute(
          path: '',
          page: ResetPasswordScreen,
        ),
      ]),
  AutoRoute(path: '/review', page: ReviewProductWrapperScreen, children: [
    AutoRoute(
      path: '',
      page: ReviewProductScreen,
    ),
  ]),
  AutoRoute(
    path: '/forgot_password',
    page: ForgotPasswordScreen,
  ),
  AutoRoute(
    path: '/login',
    page: SignInWrapperScreen,
    children: [
      AutoRoute(
        path: '',
        page: SignInScreen,
      ),
      // AutoRoute(
      //   path: 'signup',
      //   page: SignUpScreen,
      // ),
      // AutoRoute(
      //   path: 'login_success',
      //   page: LoginSuccessScreen,
      // ),
      // AutoRoute(
      //   path: 'forgot_password',
      //   page: ForgotPasswordScreen,
      // ),
      AutoRoute(
        path: 'otp',
        page: OtpScreen,
      ),
    ],
  ),
])
class $AppRouter {}

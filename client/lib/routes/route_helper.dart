import 'package:client/backend/models/Cart.dart';
import 'package:client/backend/models/product_model.dart';
import 'package:client/screens/cart/cart_screen.dart';
import 'package:client/screens/complete_profile/complete_profile_screen.dart';
import 'package:client/screens/details/details_screen.dart';
import 'package:client/screens/find_product/find_product_screen.dart';
import 'package:client/screens/forgot_password/forgot_password_screen.dart';
import 'package:client/screens/home/home_screen.dart';
import 'package:client/screens/login_success/login_success_screen.dart';
import 'package:client/screens/otp/otp_screen.dart';
import 'package:client/screens/profile/profile_screen.dart';
import 'package:client/screens/sign_in/sign_in_screen.dart';
import 'package:client/screens/sign_up/sign_up_screen.dart';
import 'package:client/screens/splash/splash_screen.dart';
import 'package:get/route_manager.dart';

class RouteHelper {
  static String getPopularFood = "popularFoodDetail";
  static List<GetPage> routes = [
    GetPage(name: "/search", page: () => SearchPage()),
    GetPage(name: SplashScreen.routeName, page: () => SplashScreen()),
    GetPage(name: SignInScreen.routeName, page: () => SignInScreen()),
    GetPage(
        name: ForgotPasswordScreen.routeName,
        page: () => ForgotPasswordScreen()),
    GetPage(
        name: LoginSuccessScreen.routeName, page: () => LoginSuccessScreen()),
    GetPage(name: SignUpScreen.routeName, page: () => SignUpScreen()),
    GetPage(
        name: CompleteProfileScreen.routeName,
        page: () => CompleteProfileScreen()),
    GetPage(name: OtpScreen.routeName, page: () => OtpScreen()),
    GetPage(name: HomeScreen.routeName, page: () => HomeScreen()),
    GetPage(
        name: DetailsScreen.routeName,
        page: () {
          ProductModel data = Get.arguments as ProductModel;
          return DetailsScreen(product: data);
        }),
    GetPage(name: CartScreen.routeName, page: () => CartScreen()),
    GetPage(name: ProfileScreen.routeName, page: () => ProfileScreen()),
  ];
}

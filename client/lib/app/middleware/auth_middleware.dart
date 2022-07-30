import 'package:auto_route/auto_route.dart';
import 'package:client/app/routes/routes.gr.dart';
import 'package:flutter/material.dart';
import 'package:local_storage_auth_api/local_storage_auth_api.dart';

class EnsureAuthMiddleware extends AutoRouteGuard {
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) async {
    print("aaaaaaaaa");
    final token = await LocalStorageAuthApi().getToken();
    if (token != null) {
      resolver.next(true);
    } else {
      router.push(const NotLoggedinRoute());
    }
  }
}

class EnsureShopMiddleware extends AutoRouteGuard {
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) async {
    print("aaaaaaaaa");
    final isShop = await LocalStorageAuthApi().isShop();
    if (isShop) {
      resolver.next(true);
    } else {
      router.push(const NotShopRoute());
    }
  }
}
//   @override
//   Future<GetNavConfig?> redirectDelegate(GetNavConfig route) async {
//     // you can do whatever you want here
//     // but it's preferable to make this method fast
//     // await Future.delayed(Duration(milliseconds: 500));
//     if (!AuthService.to.isLoggedInValue) {
//       return null;
//     }
//     return super.redirectDelegate(route);
//   }
// }

// class EnsureNotAuthedMiddleware extends GetMiddleware {
//   @override
//   Future<GetNavConfig?> redirectDelegate(GetNavConfig route) async {
//     // if (AuthService.to.isLoggedInValue) {
//     //   //NEVER navigate to auth screen, when user is already authed
//     //   return null;
//     //   //OR redirect user to another screen
//     //   //return RouteDecoder.fromRoute(Routes.PROFILE);
//     // }
//     if (!AuthService.to.isLoggedInValue) {
//       //NEVER navigate to auth screen, when user is already authed
//       print("Chua dang nhap");
//       return null;
//       //OR redirect user to another screen
//       //return RouteDecoder.fromRoute(Routes.PROFILE);
//     }
//     return await super.redirectDelegate(route);
//   }
// }

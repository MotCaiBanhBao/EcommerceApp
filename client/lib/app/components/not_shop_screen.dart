import 'package:auto_route/auto_route.dart';
import 'package:client/app/routes/routes.gr.dart';
import 'package:flutter/material.dart';

import 'default_button.dart';

class NotShopScreen extends StatelessWidget {
  const NotShopScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Column(children: [
          const Text("Bạn không có quyền bán hàng"),
          DefaultButton(
            text: "Đăng ký",
            press: () {
              AutoRouter.of(context).push(const ShopRegisterWrapperRoute());
            },
          ),
        ]),
      ),
    );
  }
}

import 'package:auto_route/auto_route.dart';
import 'package:client/app/routes/routes.gr.dart';
import 'package:flutter/material.dart';

import 'default_button.dart';

class NotLoggedinScreen extends StatelessWidget {
  const NotLoggedinScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Column(children: [
          const Text("Bạn chưa đăng nhập"),
          DefaultButton(
            text: "Login",
            press: () {
              AutoRouter.of(context).push(const SignInWrapperRoute());
            },
          ),
        ]),
      ),
    );
  }
}

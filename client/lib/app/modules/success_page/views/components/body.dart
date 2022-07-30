import 'package:auto_route/auto_route.dart';
import 'package:client/app/modules/cart/views/cart_screen.dart';
import 'package:client/app/routes/routes.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../components/default_button.dart';
import '../../../../helper/localization.dart';
import '../../../app/bloc/app_bloc.dart';
import '../../../home/views/home_screen.dart';
import '/size_config.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return Column(
        children: [
          SizedBox(height: SizeConfig.screenHeight * 0.04),
          Image.asset(
            "assets/images/success.png",
            height: SizeConfig.screenHeight * 0.4, //40%
          ),
          SizedBox(height: SizeConfig.screenHeight * 0.08),
          Text(
            "Order Success",
            style: TextStyle(
              fontSize: getProportionateScreenWidth(30),
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          Spacer(),
          SizedBox(
            width: SizeConfig.screenWidth * 0.6,
            child: DefaultButton(
              text: "Back to cart",
              press: () {
                context.router.popUntilRoot();
              },
            ),
          ),
          Spacer(),
        ],
      );
    });
  }
}

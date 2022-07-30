import 'package:client/app/modules/otp/bloc/otp_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../helper/constants.dart';
import '/size_config.dart';

import 'otp_form.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OtpBloc, OtpState>(
      builder: (context, state) {
        return SizedBox(
          width: double.infinity,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: defaultPadding),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: SizeConfig.screenHeight * 0.05),
                  Text(
                    "OTP Verification",
                    style: headingStyle,
                  ),
                  const Text(
                      "We sent your code to your email\nIf you can not find your confirmation email in your normal inbox it is worth checking in your spam or junk mail section "),
                  buildTimer(),
                  OtpForm(),
                  SizedBox(height: SizeConfig.screenHeight * 0.1),
                  GestureDetector(
                    onTap: () {
                      context.read<OtpBloc>().add(OtpEvent.resendOTP(''));
                    },
                    child: const Text(
                      "Resend OTP Code",
                      style: TextStyle(decoration: TextDecoration.underline),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Row buildTimer() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("This code will expired in "),
        TweenAnimationBuilder(
          tween: Tween(begin: 300.0, end: 0.0),
          duration: const Duration(seconds: 300),
          builder: (_, dynamic value, child) {
            var minute = (value.toInt() / 60).toInt();
            var second = value.toInt() - minute * 60;
            return Text(
              second < 10 ? "0$minute:0$second" : "0$minute:$second",
            );
          },
        ),
      ],
    );
  }
}

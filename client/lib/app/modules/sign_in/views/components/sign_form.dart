import 'package:auto_route/auto_route.dart';
import 'package:client/app/helper/localization.dart';
import 'package:client/app/modules/app/bloc/app_bloc.dart';
import 'package:client/app/routes/routes.gr.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';

import '../../../../helper/constants.dart';
import '../../../../../size_config.dart';
import '../../../../components/custom_surfix_icon.dart';
import '../../../../components/default_button.dart';
import '../../../../components/form_error.dart';
import '../../../../helper/keyboard.dart';
import '../../../forgot_password/views/forgot_password_screen.dart';
import '../../../home/views/home_screen.dart';
import '../../bloc/login_form_bloc.dart';

class SignForm extends StatelessWidget {
  const SignForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      final loginFormBloc = context.read<LoginFormBloc>();

      return AutofillGroup(
        child: Column(
          children: [
            TextFieldBlocBuilder(
              textFieldBloc: loginFormBloc.email,
              keyboardType: TextInputType.emailAddress,
              autofillHints: const [
                AutofillHints.username,
              ],
              decoration: const InputDecoration(
                floatingLabelBehavior: FloatingLabelBehavior.always,
                labelText: 'Email',
                prefixIcon: Icon(Icons.email),
              ),
            ),
            TextFieldBlocBuilder(
              textFieldBloc: loginFormBloc.password,
              suffixButton: SuffixButton.obscureText,
              autofillHints: const [AutofillHints.password],
              decoration: const InputDecoration(
                floatingLabelBehavior: FloatingLabelBehavior.always,
                labelText: 'Password',
                prefixIcon: Icon(Icons.lock),
              ),
            ),
            SizedBox(height: getProportionateScreenHeight(30)),
            SizedBox(height: getProportionateScreenHeight(30)),
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    AutoRouter.of(context).push(ForgotPasswordRoute());
                  },
                  child: const Text(
                    "Forgot Password",
                    style: TextStyle(decoration: TextDecoration.underline),
                  ),
                )
              ],
            ),
            // FormError(errors: errors),
            SizedBox(height: getProportionateScreenHeight(20)),
            DefaultButton(
              text: "Continue",
              press: () {
                loginFormBloc.submit();
              },
            ),
          ],
        ),
      );
    });
  }
}

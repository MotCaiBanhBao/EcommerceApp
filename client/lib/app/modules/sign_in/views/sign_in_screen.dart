import 'package:auth_repository/auth_repository.dart';
import 'package:auto_route/auto_route.dart';
import 'package:client/app/modules/sign_in/bloc/login_form_bloc.dart';
import 'package:client/app/routes/routes.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import '../../../components/loading_dialog.dart';
import 'components/body.dart';

class SignInWrapperScreen extends StatelessWidget {
  const SignInWrapperScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginFormBloc(context.read<AuthRepository>()),
      child: const AutoRouter(),
    );
  }
}

class SignInScreen extends StatelessWidget {
  static const String routeName = "/sign_in";

  const SignInScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("Sign In"),
          ),
          body: FormBlocListener<LoginFormBloc, String, String>(
            onSubmitting: (context, state) {
              print('submitting');
              LoadingDialog.show(context);
            },
            onSubmissionFailed: (context, state) {
              print('submittiFailed');
              LoadingDialog.hide(context);
            },
            onSuccess: (context, state) async {
              LoadingDialog.hide(context);
              AutoRouter.of(context).push(OtpRoute(
                  hash: state.successResponse!,
                  email: context.read<LoginFormBloc>().emailValue));
            },
            onFailure: (context, state) {
              LoadingDialog.hide(context);
              // var snackBar = SnackBar(
              //   /// need to set following properties for best effect of awesome_snackbar_content
              //   elevation: 0,
              //   behavior: SnackBarBehavior.floating,
              //   backgroundColor: Colors.transparent,
              //   content: AwesomeSnackbarContent(
              //     title: 'On Snap!',
              //     message: state.failureResponse!,

              //     /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
              //     contentType: ContentType.failure,
              //   ),
              // );

              // ScaffoldMessenger.of(context).showSnackBar(snackBar);
              ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(state.failureResponse!)));
              print('onFailure');
            },
            child: Body(),
          ),
        );
      },
    );
  }
}

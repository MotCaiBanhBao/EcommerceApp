import 'package:auth_repository/auth_repository.dart';
import 'package:client/app/modules/otp/bloc/otp_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '/size_config.dart';

import 'components/body.dart';

class OtpScreen extends StatelessWidget {
  static const String routeName = "/otp";

  final String hash;
  final String email;
  const OtpScreen({Key? key, required this.hash, required this.email})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return BlocProvider(
      create: (context) => OtpBloc(context.read<AuthRepository>(), hash, email),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("OTP Verification"),
        ),
        body: Body(),
      ),
    );
  }
}

import 'package:auto_route/auto_route.dart';
import 'package:cart_repository/cart_repository.dart';
import 'package:check_out_repository/check_out_repository.dart';
import 'package:client/app/modules/check_out/bloc/check_out_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'components/body.dart';

class CheckOutWrapperScreen extends StatelessWidget {
  final CartModel cart;
  const CheckOutWrapperScreen({Key? key, required this.cart}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CheckOutBloc(
        context.read<CheckOutRepository>(),
      )..add(CheckOutEvent.started(cart)),
      child: const AutoRouter(),
    );
  }
}

class CheckOutScreen extends StatelessWidget {
  const CheckOutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: const Body(),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      title: Column(
        children: const [
          Text(
            "Checkout",
            style: TextStyle(color: Colors.black),
          ),
        ],
      ),
    );
  }
}

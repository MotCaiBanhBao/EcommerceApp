import 'package:auto_route/auto_route.dart';
import 'package:cart_repository/cart_repository.dart';
import 'package:check_out_repository/check_out_repository.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../translations/locale_keys.g.dart';
import '../bloc/cart_bloc.dart';
import 'components/body.dart';
import 'components/check_out_card.dart';

class CartWrapperScreen extends StatelessWidget {
  const CartWrapperScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    print('run');
    return BlocProvider(
      create: (context) => CartBloc(
        context.read<CartRepository>(),
      )..add(const CartEvent.started()),
      child: const AutoRouter(),
    );
  }
}

class CartScreen extends StatelessWidget {
  static const String routeName = "/cart";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: MultiBlocListener(
        listeners: [
          BlocListener<CartBloc, CartState>(
            listener: (context, state) {
              if (state.status == CartStatus.failure) {
                ScaffoldMessenger.of(context)
                  ..hideCurrentSnackBar()
                  ..showSnackBar(
                    SnackBar(
                      content: Text(LocaleKeys.default_error_text.tr()),
                    ),
                  );
              }
            },
            listenWhen: (previous, current) =>
                previous.status != current.status,
          )
        ],
        child: BlocBuilder<CartBloc, CartState>(
          builder: (context, state) {
            if (state.cartData?.items == null) {
              if (state.status == CartStatus.loading) {
                return const Center(child: CupertinoActivityIndicator());
              } else if (state.status != CartStatus.success) {
                print(state.status);
                return const SizedBox();
              } else {
                print(state.status);
                return Center(
                  child: Text(
                    LocaleKeys.cart_empty_txt.tr(),
                    style: Theme.of(context).textTheme.caption,
                  ),
                );
              }
            }
            return const Body();
          },
        ),
      ),
      bottomNavigationBar: const CheckoutCard(),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      centerTitle: false,
      title: Text(
        "Your Cart",
        style: TextStyle(color: Theme.of(context).primaryColor),
      ),
    );
  }
}

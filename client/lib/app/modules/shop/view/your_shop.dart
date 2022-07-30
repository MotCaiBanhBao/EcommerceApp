import 'package:auth_repository/auth_repository.dart';
import 'package:auto_route/auto_route.dart';
import 'package:client/app/helper/constants.dart';
import 'package:client/app/modules/shop/bloc/shop_bloc.dart';
import 'package:client/app/routes/routes.gr.dart';
import 'package:client/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:order_repository/order_repository.dart';

import '../../../components/loading_dialog.dart';

class YourShopWrapperScreen extends StatelessWidget {
  const YourShopWrapperScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => ShopBloc(
            context.read<OrderRepository>(), context.read<AuthRepository>())
          ..add(const ShopEvent.started()),
        child: const AutoRouter(),
      ),
    );
  }
}

class YourShopScreen extends StatelessWidget {
  const YourShopScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        centerTitle: false,
        title: Text(
          "My shop",
          style: TextStyle(color: Theme.of(context).primaryColor),
        ),
      ),
      body: BlocConsumer<ShopBloc, ShopState>(
        listenWhen: (previous, current) =>
            previous.status != current.status ||
            previous.orders != current.orders,
        listener: (context, state) {
          if (state.status.isLoading) {
            LoadingDialog.show(context);
          }
          // else if (state.status.) {
          //   LoadingDialog.hide(context);
          //   ScaffoldMessenger.of(context)
          //     ..hideCurrentSnackBar()
          //     ..showSnackBar(SnackBar(
          //       content: Text(
          //         'Thành công',
          //       ),
          //     ));
          //   AutoRouter.of(context).pop();
          // }
          else if (state.status.isFailure) {
            LoadingDialog.hide(context);
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(SnackBar(
                content: Text(
                  'SomeThingError',
                ),
              ));
          } else {
            LoadingDialog.hide(context);
          }
          // addresssController.text = state.order?.address ?? '';
        },
        builder: (context, state) {
          return SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: getProportionateScreenHeight(defaultPadding),
                ),
                ListTile(
                  title: Text('Lương Văn Ý'),
                  leading: CircleAvatar(
                    maxRadius: 48,
                    backgroundImage: NetworkImage(
                        'https://res.cloudinary.com/luongvany/image/upload/v1656936953/User/6262636c7acc034382a0a8fe/avatar.jpg'),
                  ),
                  onTap: () {},
                ),
                Padding(
                    padding: EdgeInsets.symmetric(vertical: defaultPadding)),
                Container(
                  padding: EdgeInsets.symmetric(vertical: defaultPadding),
                  color: Colors.white,
                  child: Column(
                    children: [
                      Text('Order Status'),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text('0'),
                              Text(
                                'To Ship ',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text('0'),
                              Text(
                                'Cancelled ',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text('0'),
                              Text(
                                'Return ',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text('0'),
                              Text(
                                'Review ',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Divider(),
                ListTile(
                  title: Text('All order'),
                  subtitle: Text('See all your order'),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () {
                    AutoRouter.of(context).push(ShopOrderWrapperRoute());
                  },
                ),
                Divider(),
                ListTile(
                  title: Text('My products'),
                  subtitle: Text('See all your product'),
                  trailing: Icon(Icons.chevron_right),
                  onTap: () {
                    AutoRouter.of(context).push(ShopProductsWrapperRoute());
                  },
                ),
                Divider(),
                ListTile(
                  title: Text('All Voucher'),
                  subtitle: Text('Create new Voucher'),
                  trailing: Icon(Icons.chevron_right),
                  onTap: () {},
                ),
                Divider(),
                ListTile(
                  title: Text('Create voucher'),
                  subtitle: Text('Create new Voucher'),
                  trailing: Icon(Icons.chevron_right),
                  onTap: () {},
                ),
                Divider(),
              ],
            ),
          );
        },
      ),
    );
  }
}

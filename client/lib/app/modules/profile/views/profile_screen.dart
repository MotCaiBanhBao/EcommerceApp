import 'package:auth_repository/auth_repository.dart';
import 'package:auto_route/auto_route.dart';
import 'package:client/app/components/default_load_user_avatar.dart';
import 'package:client/app/modules/shop/view/your_shop.dart';
import 'package:client/app/routes/routes.gr.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:order_repository/order_repository.dart';
import '../../../../translations/locale_keys.g.dart';
import '../../../components/coustom_bottom_nav_bar.dart';

import '../bloc/user_bloc.dart';
import 'components/body.dart';

class ProfileWrapperScreen extends StatelessWidget {
  const ProfileWrapperScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => UserBloc(
            context.read<AuthRepository>(), context.read<OrderRepository>())
          ..add(const UserEvent.started()),
        child: const AutoRouter(),
      ),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF9F9F9),
      body: BlocBuilder<UserBloc, UserState>(
        builder: (context, state) {
          return (state.status.isLoading || state.status.isInitial)
              ? const SafeArea(
                  top: true,
                  child: Expanded(
                      child: Center(
                    child: CircularProgressIndicator(),
                  )),
                )
              : SafeArea(
                  top: true,
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 16.0, right: 16.0, top: kToolbarHeight),
                      child: Column(
                        children: <Widget>[
                          DefaultUserAvatar(
                              id: state.user?.avatar ?? '',
                              tagId: state.user?.avatar ?? ''),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              state.user?.name ?? '',
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(vertical: 16.0),
                            decoration: BoxDecoration(
                                borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(8),
                                    topRight: Radius.circular(8),
                                    bottomLeft: Radius.circular(8),
                                    bottomRight: Radius.circular(8)),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                      color: Theme.of(context).primaryColor,
                                      blurRadius: 4,
                                      spreadRadius: 1,
                                      offset: Offset(0, 1))
                                ]),
                            height: 150,
                            child: Center(
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Spacer(),
                                      TextButton(
                                          onPressed: () {
                                            AutoRouter.of(context)
                                                .push(OrderPageWrapperRoute());
                                          },
                                          child: Text(
                                            LocaleKeys.all_order_txt.tr(),
                                            style: TextStyle(
                                                color: Colors.grey[400]),
                                          )),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: <Widget>[
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          IconButton(
                                            icon: const Icon(Icons.wallet),
                                            onPressed: () {},
                                          ),
                                          Text(
                                            LocaleKeys.to_pay_txt.tr(),
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold),
                                          )
                                        ],
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          IconButton(
                                            icon:
                                                const Icon(Icons.card_giftcard),
                                            onPressed: () {},
                                          ),
                                          Text(
                                            LocaleKeys.to_ship_txt.tr(),
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold),
                                          )
                                        ],
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          IconButton(
                                            icon: const Icon(
                                                Icons.local_shipping),
                                            onPressed: () {},
                                          ),
                                          Text(
                                            LocaleKeys.to_receive_txt.tr(),
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold),
                                          )
                                        ],
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          IconButton(
                                            icon: const Icon(Icons.rate_review),
                                            onPressed: () {},
                                          ),
                                          Text(
                                            LocaleKeys.to_rate_txt.tr(),
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          ListTile(
                              title: Text(LocaleKeys.setting_txt.tr()),
                              subtitle:
                                  Text(LocaleKeys.privacy_and_logout_txt.tr()),
                              leading: Image.asset(
                                'assets/images/settings.png',
                                fit: BoxFit.scaleDown,
                                width: 30,
                                height: 30,
                              ),
                              trailing: Icon(Icons.chevron_right),
                              onTap: () {
                                AutoRouter.of(context)
                                    .push(const SettingsRoute());
                              }),
                          Divider(),
                          ListTile(
                            onTap: () {
                              AutoRouter.of(context)
                                  .push(YourShopWrapperRoute());
                            },
                            title: Text(LocaleKeys.your_shop_txt.tr()),
                            subtitle:
                                Text(LocaleKeys.your_shop_action_txt.tr()),
                            leading: Image.asset(
                              'assets/images/store.png',
                              fit: BoxFit.scaleDown,
                              width: 30,
                              height: 30,
                            ),
                            trailing: const Icon(
                              Icons.chevron_right,
                            ),
                          ),
                          Divider(),
                          ListTile(
                            title: const Text('FAQ'),
                            subtitle:
                                Text(LocaleKeys.questions_and_answer_txt.tr()),
                            leading: Image.asset(
                              'assets/images/faq.png',
                              fit: BoxFit.scaleDown,
                              width: 30,
                              height: 30,
                            ),
                            trailing: Icon(Icons.chevron_right),
                            onTap: () {},
                          ),
                          Divider(),
                        ],
                      ),
                    ),
                  ),
                );
        },
      ),
    );
  }
}

// class ProfileScreen extends StatelessWidget {
//   static const String routeName = "/profile";

//   const ProfileScreen({Key? key}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     print("PROFILE RUN");
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Profile"),
//       ),
//       body: const Body(),
//     );
//   }
// }

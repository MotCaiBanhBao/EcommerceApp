import 'package:auto_route/auto_route.dart';
import 'package:client/app/components/default_image.dart';
import 'package:client/app/components/default_load_user_avatar.dart';
import 'package:client/app/components/rounded_icon_btn.dart';
import 'package:client/app/helper/extension.dart';
import 'package:client/app/modules/messeages/bloc/message_bloc.dart';
import 'package:client/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:notification_api/notification_api.dart';
import 'package:notification_repository/notification_repository.dart';

import '../../routes/routes.gr.dart';

class MessageWrapperScreen extends StatelessWidget {
  const MessageWrapperScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MessageBloc(context.read<NotificationRepository>())
        ..add(const MessageEvent.started()),
      child: const AutoRouter(),
    );
  }
}

class MessageScreen extends StatelessWidget {
  const MessageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget _buildChatNotiItem(ChatNotifications data) {
      return ListTile(
        onTap: () {
          AutoRouter.of(context)
              .push(ChatWrapperRoute(anotherId: data.anotherID!));
        },
        leading: SizedBox(
            width: 80.0,
            height: 80.0,
            child:
                DefaultUserAvatar(id: data.anotherID!, tagId: data.anotherID!)),
        title: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(data.content ?? '',
                  maxLines: 2, overflow: TextOverflow.ellipsis),
              SizedBox(
                height: getProportionateScreenHeight(5),
              ),
              Text(
                (data.dateAdd ?? '').parseLocalDate(),
                style: TextStyle(color: Colors.grey, fontSize: 13),
              )
            ]),
      );
    }

    Widget _buildProductNotiItem(OrderNotifications data) {
      return ListTile(
        onTap: () {
          AutoRouter.of(context)
              .push(OrderDetailWrapperRoute(orderID: data.orderID!));
        },
        leading: SizedBox(
          width: 80.0,
          height: 80.0,
          child: DefaultInternetImage(
            imageUri: data.avatar!,
            tagId: data.avatar!,
          ),
        ),
        title: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(data.content ?? '',
                  maxLines: 4, overflow: TextOverflow.ellipsis),
              SizedBox(
                height: getProportionateScreenHeight(5),
              ),
              Text(
                (data.dateAdd ?? '').parseLocalDate(),
                style: const TextStyle(color: Colors.grey, fontSize: 13),
              )
            ]),
      );
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              isScrollable: true,
              labelColor: Theme.of(context).primaryColor,
              tabs: const [
                Tab(
                  text: 'Messages',
                ),
                Tab(
                  text: 'Chat',
                ),
                Tab(
                  text: 'Update',
                ),
              ],
            ),
            centerTitle: false,
            title: Text(
              'Notifications',
              style: TextStyle(color: Theme.of(context).primaryColor),
            ),
            backgroundColor: Colors.white,
          ),
          floatingActionButton: RoundedIconBtn(
            icon: Icons.refresh,
            showShadow: true,
            press: () {
              context.read<MessageBloc>().add(MessageEvent.started());
            },
          ),
          body: BlocBuilder<MessageBloc, MessageState>(
            builder: (context, state) {
              return Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: TabBarView(
                  children: state.status.isLoadding
                      ? [
                          Column(
                            children: const [
                              Expanded(
                                  child: Center(
                                      child: CircularProgressIndicator())),
                            ],
                          ),
                          Column(
                            children: const [
                              Expanded(
                                  child: Center(
                                      child: CircularProgressIndicator())),
                            ],
                          ),
                          Column(
                            children: const [
                              Expanded(
                                  child: Center(
                                      child: CircularProgressIndicator())),
                            ],
                          )
                        ]
                      : [
                          SingleChildScrollView(
                            physics: const AlwaysScrollableScrollPhysics(),
                            child: Column(
                              children: [
                                ListView.builder(
                                    scrollDirection: Axis.vertical,
                                    shrinkWrap: true,
                                    itemCount: state.notification
                                            ?.orderNotifications?.length ??
                                        0,
                                    itemBuilder: ((context, index) {
                                      return _buildProductNotiItem(state
                                          .notification!
                                          .orderNotifications![index]);
                                    }))
                              ],
                            ),
                          ),
                          SingleChildScrollView(
                            physics: const AlwaysScrollableScrollPhysics(),
                            child: Column(
                              children: [
                                ListView.builder(
                                    scrollDirection: Axis.vertical,
                                    shrinkWrap: true,
                                    itemCount: state.notification
                                            ?.chatNotifications?.length ??
                                        0,
                                    itemBuilder: ((context, index) {
                                      return _buildChatNotiItem(state
                                          .notification!
                                          .chatNotifications![index]);
                                    }))
                              ],
                            ),
                          ),
                          Column(
                            children: [
                              ListTile(
                                onTap: () {
                                  // AutoRouter.of(context).push(ChatRoute());
                                },
                                leading: SizedBox(
                                    width: 100,
                                    height: 100,
                                    child:
                                        Image.asset('assets/images/logo.png')),
                                title: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(children: const [
                                        Text('Cập nhật hệ thống'),
                                      ]),
                                      SizedBox(
                                        height: getProportionateScreenHeight(5),
                                      ),
                                      Text(
                                        '18:00 14/7/2022',
                                        style: TextStyle(
                                            color: Colors.grey, fontSize: 13),
                                      )
                                    ]),
                              ),
                            ],
                          ),
                        ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

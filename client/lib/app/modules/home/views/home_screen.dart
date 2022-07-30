import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:client/app/components/coustom_bottom_nav_bar.dart';
import 'package:client/app/modules/home/bloc/home_bloc.dart';
import 'package:client/app/routes/routes.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../size_config.dart';

class HomeWrapperScreen extends StatelessWidget {
  const HomeWrapperScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc(),
      child: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return BlocConsumer<HomeBloc, HomeState>(
      listener: (context, state) {
        if (state.isBack) {
          SystemChannels.platform.invokeMethod(
            'SystemNavigator.pop',
          );
        }
      },
      builder: (context, state) {
        return WillPopScope(
          onWillPop: () async {
            context.read<HomeBloc>().add(HomeEvent.back(context));
            return false;
          },
          child: AutoTabsScaffold(
            homeIndex: 0,
            routes: const [
              DashBoardWrapperRoute(),
              FavoriteWrapperRoute(),
              MessageWrapperRoute(),
              CartWrapperRoute(),
              ProfileWrapperRoute()
            ],
            // enum MenuState { dashboard, favourite, message, cart, profile }
            bottomNavigationBuilder: (_, tabsRoute) {
              return CustomBottomNavBar(
                  selectedMenu: MenuState.values[tabsRoute.activeIndex],
                  onItemSelected: (page) {
                    tabsRoute.setActiveIndex(page.index);
                  });
            },
          ),
        );
      },
    );
  }
}

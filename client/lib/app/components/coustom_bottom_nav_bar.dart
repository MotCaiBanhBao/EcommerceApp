import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../helper/constants.dart';
import '../modules/home/bloc/home_bloc.dart';
import '../modules/home/views/home_screen.dart';
import '../modules/profile/views/profile_screen.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar(
      {Key? key, required this.selectedMenu, required this.onItemSelected})
      : super(key: key);
  final Function onItemSelected;
  final MenuState selectedMenu;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, -15),
            blurRadius: 20,
            color: const Color(0xFFDADADA).withOpacity(0.15),
          ),
        ],
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
      ),
      child: SafeArea(
          top: false,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _bottomItem(MenuState.dashboard, context),
              _bottomItem(MenuState.favourite, context),
              _bottomItem(MenuState.message, context),
              _bottomItem(MenuState.cart, context),
              _bottomItem(MenuState.profile, context),
            ],
          )),
    );
  }

  Widget _bottomItem(MenuState item, BuildContext context) {
    var image = bottomItems[item];
    const Color inActiveIconColor = Color(0xFFB6B6B6);

    return IconButton(
      icon: SvgPicture.asset(
        image!,
        color: item == selectedMenu
            ? Theme.of(context).primaryColor
            : inActiveIconColor,
      ),
      onPressed: () {
        onItemSelected(item);
      },
    );
  }
}

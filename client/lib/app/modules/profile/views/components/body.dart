import 'package:auto_route/auto_route.dart';
import 'package:client/app/components/loading_dialog.dart';
import 'package:client/app/routes/routes.gr.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../translations/locale_keys.g.dart';
import '../../../../helper/localization.dart';
import '../../../app/bloc/app_bloc.dart';
import '../../bloc/user_bloc.dart';
import 'profile_menu.dart';
import 'profile_pic.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserBloc, UserState>(listener: (context, state) {
      if (state.status == UserStatus.initial) {
        context.read<UserBloc>().add(const UserEvent.started());
      }

      if (state.status == UserStatus.loading) {
        LoadingDialog.show(context);
      } else if (state.status == UserStatus.successs ||
          state.status == UserStatus.failure) {
        LoadingDialog.hide(context);
      }
    }, builder: (context, state) {
      return RefreshIndicator(
        onRefresh: () async {
          context.read<UserBloc>().add(const UserEvent.started());
        },
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Column(
            children: [
              const ProfilePic(),
              const SizedBox(height: 20),
              ProfileMenu(
                text: "My Account",
                icon: "assets/icons/User Icon.svg",
                press: () {
                  AutoRouter.of(context).push(const SignInWrapperRoute());
                },
              ),
              ProfileMenu(
                text: LocaleKeys.address_null_error.tr(),
                icon: "assets/icons/Bell.svg",
                press: () {
                  context
                      .read<AppBloc>()
                      .add(const AppEvent.changeLanguage(Languages.english));
                },
              ),
              ProfileMenu(
                text: "Settings",
                icon: "assets/icons/Settings.svg",
                press: () {
                  context
                      .read<AppBloc>()
                      .add(const AppEvent.changeLanguage(Languages.vietnam));
                },
              ),
              ProfileMenu(
                text: "Help Center",
                icon: "assets/icons/Question mark.svg",
                press: () {},
              ),
              ProfileMenu(
                text: "Log Out",
                icon: "assets/icons/Log out.svg",
                press: () {
                  context.read<UserBloc>().add(const UserEvent.logout());
                },
              ),
            ],
          ),
        ),
      );
    });
  }
}

import 'package:auth_repository/auth_repository.dart';
import 'package:auto_route/auto_route.dart';
import 'package:client/app/components/default_load_user_avatar.dart';
import 'package:client/app/modules/check_profile/bloc/check_profile_bloc.dart';
import 'package:client/app/modules/shop/view/your_shop.dart';
import 'package:client/app/routes/routes.gr.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:order_repository/order_repository.dart';
import '../../../../translations/locale_keys.g.dart';
import '../../../components/coustom_bottom_nav_bar.dart';

class CheckProfileWrapperScreen extends StatelessWidget {
  CheckProfileWrapperScreen({Key? key, required this.userID}) : super(key: key);
  String userID;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => CheckProfileBloc(context.read<AuthRepository>())
          ..add(CheckProfileEvent.started(userID)),
        child: const AutoRouter(),
      ),
    );
  }
}

class CheckProfileScreen extends StatelessWidget {
  const CheckProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF9F9F9),
      body: BlocBuilder<CheckProfileBloc, CheckProfileState>(
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
                    child: Center(
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
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            TextButton(
                                onPressed: () {
                                  AutoRouter.of(context).push(ChatWrapperRoute(
                                      anotherId: state.user?.id ?? ''));
                                },
                                child: Text('Chat'))
                          ],
                        ),
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

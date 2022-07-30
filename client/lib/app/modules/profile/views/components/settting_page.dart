import 'package:auto_route/auto_route.dart';
import 'package:client/app/routes/routes.gr.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:local_storage_auth_api/local_storage_auth_api.dart';

import '../../../../../translations/locale_keys.g.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        brightness: Brightness.light,
        backgroundColor: Colors.transparent,
        title: Text(
          'Settings',
          // style: TextStyle(color: darkGrey),
        ),
        elevation: 0,
      ),
      body: SafeArea(
        bottom: true,
        child: LayoutBuilder(
            builder: (builder, constraints) => SingleChildScrollView(
                  child: ConstrainedBox(
                    constraints:
                        BoxConstraints(minHeight: constraints.maxHeight),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 24.0, left: 24.0, right: 24.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: Text(
                              'General',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18.0),
                            ),
                          ),
                          ListTile(
                            title: Text(LocaleKeys.language_txt.tr()),
                            leading: Icon(Icons.language),
                            onTap: () {
                              AutoRouter.of(context)
                                  .push(ChangeLanguageRoute());
                            },
                          ),
                          ListTile(
                            title: Text(LocaleKeys.notification_txt.tr()),
                            leading: Icon(Icons.notifications),
                            onTap: () {
                              AutoRouter.of(context)
                                  .push(NotificationSettingsRoute());
                            },
                          ),
                          ListTile(
                            title: Text('About Us'),
                            leading: Icon(Icons.home),
                            onTap: () {},
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(top: 8.0, bottom: 8.0),
                            child: Text(
                              'Account',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18.0),
                            ),
                          ),
                          ListTile(
                            onTap: () {
                              AutoRouter.of(context)
                                  .push(ResetPasswordWrapperRoute());
                            },
                            title: Text(LocaleKeys.change_password_txt.tr()),
                            leading: Icon(Icons.password),
                          ),
                          ListTile(
                            title: Text(LocaleKeys.sign_out_txt.tr()),
                            leading: Icon(Icons.logout),
                            onTap: () async {
                              await LocalStorageAuthApi().deleteAll();
                              AutoRouter.of(context).push(SignInWrapperRoute());
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                )),
      ),
    );
  }
}

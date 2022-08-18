import 'package:flutter/material.dart';
import 'package:mobile_guys_run/modules/authenticate/changeemail/change_email_screen.dart';
import 'package:mobile_guys_run/modules/authenticate/changepass/change_pass_code_screen.dart';
import 'package:mobile_guys_run/modules/authenticate/changepass/change_pass_next_screen.dart';
import 'package:mobile_guys_run/modules/authenticate/changepass/change_password_screen.dart';
import 'package:mobile_guys_run/modules/nav_bar_handler/nav_bar_handler.dart';
import 'package:mobile_guys_run/modules/profile/profile_screen.dart';
import 'package:mobile_guys_run/modules/profile/profile_setting_screen.dart';

import '../authenticate/changeemail/change_email_screen.dart';

class ProfileRoutes extends StatelessWidget {
  const ProfileRoutes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Navigator(
        key: profileKey,
        initialRoute: '/',
        onGenerateRoute: (RouteSettings settings) {
          WidgetBuilder builder;
          switch (settings.name) {
            case '/':
              builder = (BuildContext _) => const ProfileScreen();
              break;
            case ProfileSettingScreen.route:
              builder = (BuildContext _) => const ProfileSettingScreen();
              break;
            case ChangePassScreen.route:
              builder = (BuildContext _) => const ChangePassScreen();
              break;
            case ChangePassCodeScreen.route:
              builder = (BuildContext _) => const ChangePassCodeScreen();
              break;
            case ChangePassNextScreen.route:
              builder = (BuildContext _) => const ChangePassNextScreen();
              break;
            case ChangeEmailScreen.route:
              builder = (BuildContext _) => const ChangeEmailScreen();
              break;
            default:
              builder = (BuildContext _) => const ProfileScreen();
          }
          return MaterialPageRoute(builder: builder, settings: settings);
        });
  }
}

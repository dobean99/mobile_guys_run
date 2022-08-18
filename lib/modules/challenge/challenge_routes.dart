import 'package:flutter/material.dart';
import 'package:mobile_guys_run/modules/challenge/challenge_next_screen.dart';
import 'package:mobile_guys_run/modules/challenge/challenge_screen.dart';
import 'package:mobile_guys_run/modules/nav_bar_handler/nav_bar_handler.dart';

class ChallengeRoutes extends StatelessWidget {
  const ChallengeRoutes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Navigator(
        key: challengeKey,
        initialRoute: '/',
        onGenerateRoute: (RouteSettings settings) {
          WidgetBuilder builder;
          switch (settings.name) {
            case '/':
              builder = (BuildContext _) => const ChallengeScreen();
              break;
            case ChallengeNextScreen.route:
              builder = (BuildContext _) => const ChallengeNextScreen();
              break;
            default:
              builder = (BuildContext _) => const ChallengeScreen();
          }
          return MaterialPageRoute(builder: builder, settings: settings);
        });
  }
}

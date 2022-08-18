import 'package:flutter/material.dart';

import 'find_code_screen.dart';
import 'find_next_screen.dart';
import 'find_screen.dart';

class FindRoutes extends StatelessWidget {
  const FindRoutes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Navigator(
        initialRoute: '/',
        onGenerateRoute: (RouteSettings settings) {
          WidgetBuilder builder;
          switch (settings.name) {
            case '/':
              builder = (BuildContext _) => const FindScreen();
              break;
            case FindCodeScreen.route:
              builder = (BuildContext _) => const FindCodeScreen();
              break;
            case FindNextScreen.route:
              builder = (BuildContext _) => const FindNextScreen();
              break;
            default:
              builder = (BuildContext _) => const FindScreen();
          }
          return MaterialPageRoute(builder: builder, settings: settings);
        });
  }
}
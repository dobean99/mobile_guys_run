import 'package:flutter/material.dart';
import 'package:mobile_guys_run/modules/nav_bar_handler/nav_bar_handler.dart';
import 'package:mobile_guys_run/modules/marketplace/market_place.dart';

class MarketPlaceRoutes extends StatelessWidget {
  const MarketPlaceRoutes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Navigator(
        key: marketKey,
        initialRoute: '/',
        onGenerateRoute: (RouteSettings settings) {
          WidgetBuilder builder;
          switch (settings.name) {
            case '/':
              builder = (BuildContext _) => const MarketPlace();
              break;
            default:
              builder = (BuildContext _) => const MarketPlace();
          }
          return MaterialPageRoute(builder: builder, settings: settings);
        });
  }
}

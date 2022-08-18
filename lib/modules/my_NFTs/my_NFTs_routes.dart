
import 'package:flutter/material.dart';
import 'package:mobile_guys_run/modules/my_NFTs/my_NFTs.dart';
import 'package:mobile_guys_run/modules/nav_bar_handler/nav_bar_handler.dart';

class MyNFTsRoutes extends StatelessWidget {
  const MyNFTsRoutes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Navigator(
        key: myNFTsKey,
        initialRoute: '/',
        onGenerateRoute: (RouteSettings settings) {
          WidgetBuilder builder;
          switch (settings.name) {
            case '/':
              builder = (BuildContext _) => const MyNFTs();
              break;
            default:
              builder = (BuildContext _) => const MyNFTs();
          }
          return MaterialPageRoute(builder: builder, settings: settings);
        });
  }
}

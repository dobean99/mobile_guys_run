import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:mobile_guys_run/app/app.dart';
import 'package:mobile_guys_run/configs/flavor_config.dart';

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.black,
  ));
  FlavorConfig(
      flavor: Flavor.dev, values: FlavorValues(baseUrl: 'https://api'));
  runApp(const App());

}

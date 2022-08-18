
import 'package:flutter/material.dart';
import 'package:mobile_guys_run/app/app.dart';
import 'package:mobile_guys_run/configs/flavor_config.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  FlavorConfig(
      flavor: Flavor.staging, values: FlavorValues(baseUrl: 'https://api'));
  runApp( const App());
}


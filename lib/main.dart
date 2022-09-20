import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router_demo/app/app.dart';

import 'package:device_preview/device_preview.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  /// SharedPreferences
  final SharedPreferences sharedPreferences =
      await SharedPreferences.getInstance();

  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => MyApp(sharedPreferences: sharedPreferences),
    ),
  );
}

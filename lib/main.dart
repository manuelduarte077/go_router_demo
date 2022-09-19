import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router_demo/app/app.dart';

import 'package:device_preview/device_preview.dart';

void main() {
  runApp(DevicePreview(
    enabled: !kReleaseMode,
    builder: (context) => const MyApp(),
  ));
}

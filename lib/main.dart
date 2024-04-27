import 'dart:io';

import 'package:flutter/material.dart';
import '../core/services/services_locator.dart' as di;
import 'core/network/http_call.dart';
import 'presentation/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await di.init();
  HttpOverrides.global = MyHttpOverrides();

  runApp(const App());
}

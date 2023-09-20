import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ui_test/app.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.leanBack);
  runApp(const MyApp());
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'widgets/app.dart';

void main() async {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
  WidgetsFlutterBinding.ensureInitialized();
  await appLogic.setup();
  runApp(const App());
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'widgets/app.dart';

void main() async {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
  runApp(const App());
  await appLogic.setup();
}

import 'package:flutter/material.dart';
import 'package:sound_bubble/logic/app_logic.dart';
import 'package:sound_bubble/logic/firebase_app_logic.dart';
import 'package:sound_bubble/widgets/tabbed_app.dart';
import 'pages/prelogin_zone/prelogin_zone.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

AppLogic appLogic = FirebaseAppLogic();

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: appLogic.userState,
      builder: (context, UserState userState, __) =>
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 250),
          child: userState == UserState.postLogin? 
            const TabbedApp() : 
            const PreloginZone(),
        )
    );
  }
}
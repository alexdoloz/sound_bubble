import 'package:flutter/material.dart';
import 'package:sound_bubble/logic/app_logic.dart';
import 'package:sound_bubble/logic/firebase_app_logic.dart';
import 'package:sound_bubble/widgets/components/menu_bar.dart';
import 'package:sound_bubble/widgets/components/menu_bar_item.dart';
import 'package:sound_bubble/widgets/pages/chat_page.dart';
import 'package:sound_bubble/widgets/pages/home_page.dart';
import 'package:sound_bubble/widgets/pages/library_page.dart';
import 'package:sound_bubble/widgets/pages/profile_page.dart';
import 'package:sound_bubble/widgets/pages/search_page.dart';
import 'components/custom_icon.dart';
import 'pages/prelogin_zone/prelogin_zone.dart';
import 'theme.dart';

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
          child: userState == UserState.postLogin? const TabbedApp() : const PreloginZone(),
        )
    );
  }
}

class TabbedApp extends StatefulWidget {
  const TabbedApp({ Key? key }) : super(key: key);

  @override
  _TabbedAppState createState() => _TabbedAppState();
}

class _TabbedAppState extends State<TabbedApp> {
  final pages = const <Widget>[
    HomePage(),
    LibraryPage(),
    SearchPage(),
    ChatPage(),
    ProfilePage(),
  ];

  var _selectedTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Soundbubble",
      theme: AppTheme.theme,
      home: Scaffold(
        body: SafeArea(
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 250),
            child: pages[_selectedTabIndex]
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          child: MenuBar(
            onTap: (index) {
              setState(() => _selectedTabIndex = index);
            },
            items: const [ 
              MenuBarItem(icon: CustomIcon.home),
              MenuBarItem(icon: CustomIcon.music),
              MenuBarItem(icon: CustomIcon.search),
              MenuBarItem(icon: CustomIcon.chat),
              MenuBarItem(icon: CustomIcon.profile),
            ],
          ),
        ), 
      ),
    );
  }
}
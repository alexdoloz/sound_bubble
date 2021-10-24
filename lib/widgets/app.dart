import 'package:flutter/material.dart';
import 'package:sound_bubble/logic/app_logic.dart';
import 'package:sound_bubble/utils/palette.dart';
import 'package:sound_bubble/widgets/components/menu_bar.dart';
import 'package:sound_bubble/widgets/components/menu_bar_item.dart';
import 'package:sound_bubble/widgets/pages/chat_page.dart';
import 'package:sound_bubble/widgets/pages/home_page.dart';
import 'package:sound_bubble/widgets/pages/music_page.dart';
import 'package:sound_bubble/widgets/pages/profile_page.dart';
import 'package:sound_bubble/widgets/pages/search_page.dart';
import 'components/custom_icon.dart';
import 'pages/login_page.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

AppLogic appLogic = FakeAppLogic();

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Soundbubble",
      theme: ThemeData(
        colorScheme: ColorScheme.light(
          primary: Color(0xff91a2f8)
        ).copyWith(secondary: Color(0xff91a2f8)),
      ),
      home: Scaffold(
        backgroundColor: Palette.homePageBackground,
        body: ValueListenableBuilder(
          builder: (_, bool isLoggedIn, __) =>
            AnimatedSwitcher(
              duration: Duration(milliseconds: 250),
              child: isLoggedIn ? PostLogin() : LoginPage(),
            ),
          valueListenable: appLogic.isLoggedIn,
        ),
      ),
    );
  }
}

class PostLogin extends StatefulWidget {
  const PostLogin({ Key? key }) : super(key: key);

  @override
  State<PostLogin> createState() => _PostLoginState();
}

class _PostLoginState extends State<PostLogin> {
  final pages = const <Widget>[
    HomePage(),
    MusicPage(),
    SearchPage(),
    ChatPage(),
    ProfilePage(),
  ];

  var _selectedPageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      // bottom: false,
      left: false,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: AnimatedSwitcher(
              duration: Duration(milliseconds: 500),
              child: pages[_selectedPageIndex],
            ),
          ),
          MenuBar(
            showsDivider: true,
            selectedIndex: _selectedPageIndex,
            items: const [
              MenuBarItem(icon: CustomIcon.home),
              MenuBarItem(icon: CustomIcon.music),
              MenuBarItem(icon: CustomIcon.search),
              MenuBarItem(icon: CustomIcon.chat),
              MenuBarItem(icon: CustomIcon.profile),
            ],
            onTap: (newIndex) {
              setState(() {
                _selectedPageIndex = newIndex;
              });
            }
          ),
        ],
      ),
    );
  }
}
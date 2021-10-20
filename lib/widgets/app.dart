import 'package:flutter/material.dart';
import 'package:sound_bubble/utils/palette.dart';
import 'package:sound_bubble/widgets/components/menu_bar.dart';
import 'package:sound_bubble/widgets/components/menu_bar_item.dart';
import 'package:sound_bubble/widgets/pages/chat_page.dart';
import 'package:sound_bubble/widgets/pages/home_page.dart';
import 'package:sound_bubble/widgets/pages/music_page.dart';
import 'package:sound_bubble/widgets/pages/profile_page.dart';
import 'package:sound_bubble/widgets/pages/search_page.dart';
import 'components/custom_icon.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
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
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Palette.homePageBackground,
        body: SafeArea(
          bottom: false,
          left: false,
          child: Column(
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
        ),
      ),
    );
  }
}
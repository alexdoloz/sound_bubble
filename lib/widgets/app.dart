import 'package:flutter/material.dart';
import 'package:sound_bubble/widgets/menu_bar.dart';
import 'package:sound_bubble/widgets/menu_bar_item.dart';
import 'package:sound_bubble/utils/palette.dart';
import 'package:sound_bubble/widgets/pages/chat_page.dart';
import 'package:sound_bubble/widgets/pages/home_page.dart';
import 'package:sound_bubble/widgets/pages/music_page.dart';
import 'package:sound_bubble/widgets/pages/profile_page.dart';
import 'package:sound_bubble/widgets/pages/search_page.dart';

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
        body: Column(
          children: [
            Expanded(
              child: AnimatedSwitcher(
                duration: Duration(milliseconds: 250),
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
    );
  }
}

class CustomIcon extends StatelessWidget {
  final int code;
  final Color color;

  const CustomIcon({
    Key? key,
    required this.code,
    this.color = Colors.white,
  }) : super(key: key);

  static const home = CustomIcon(code: 59392);
  static const music = CustomIcon(code: 59393);
  static const search = CustomIcon(code: 62733);
  static const chat = CustomIcon(code: 61501);
  static const profile = CustomIcon(code: 59394);

  @override
  Widget build(BuildContext context) {
    return Text(
      String.fromCharCode(code),
      style: TextStyle(
        fontFamily: "Custom",
        fontSize: 22.0,
        color: color,
      ),
    );
  }
}

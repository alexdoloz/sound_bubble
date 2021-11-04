import 'package:flutter/material.dart';
import 'package:sound_bubble/widgets/pages/chat_page.dart';
import 'package:sound_bubble/widgets/pages/home_page.dart';
import 'package:sound_bubble/widgets/pages/library_page.dart';
import 'package:sound_bubble/widgets/pages/profile_page.dart';
import 'package:sound_bubble/widgets/pages/search_page.dart';
import 'package:sound_bubble/widgets/theme.dart';
import 'components/custom_icon.dart';
import 'components/menu_bar.dart';
import 'components/menu_bar_item.dart';

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
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            print("Create playlist (FAB)");
          },
          // backgroundColor: Color.fromARGB(255, 216, 124, 226),
          child: Ink(
            decoration: BoxDecoration(
              gradient: AppTheme.buttonGradient,
              shape: BoxShape.circle
            ),
            height: 80,
            width: 80,
            child: Icon(Icons.add, color: Colors.white,),
          ),
          tooltip: "Create playlist",
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
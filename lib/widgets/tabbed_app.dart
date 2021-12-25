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
        appBar: AppBar(
          title: Text('Library'),
          actions: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: IconButton(
                icon: Icon(Icons.search),
                onPressed: () { print("Search"); },
              ),
            ),
          ],
        ),

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
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedTabIndex,
          onTap: (index) {
            setState(() {
              _selectedTabIndex = index;
            });
          },
          items: const [
            BottomNavigationBarItem(
              label: "Home",
              icon: Icon(Icons.home),
            ),
            BottomNavigationBarItem(
              label: "Library",
              icon: Icon(Icons.music_note),
            ),
            BottomNavigationBarItem(
              label: "Search",
              icon: Icon(Icons.search),
            ),
            BottomNavigationBarItem(
              label: "Chat",
              icon: Icon(Icons.chat),
            ),
            BottomNavigationBarItem(
              label: "Profile",
              icon: Icon(Icons.face),
            ),
          ],
        ), 
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:sound_bubble/widgets/components/segmented_control.dart';
import 'package:sound_bubble/widgets/pages/library_tabs/artists_tab.dart';
import 'package:sound_bubble/widgets/pages/library_tabs/playlists_tab.dart';
import 'package:sound_bubble/widgets/pages/library_tabs/songs_tab.dart';

class LibraryPage extends StatefulWidget {
  const LibraryPage({ Key? key }) : super(key: key);

  @override
  State<LibraryPage> createState() => _LibraryPageState();
}

class _LibraryPageState extends State<LibraryPage> {
  var currentTabIndex = 0;
  final tabs = [
    SongsTab(),
    PlaylistsTab(),
    ArtistsTab(),
  ];

  get currentTab => tabs[currentTabIndex];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SegmentedControl(
          onSelectedIndexChanged: (index) {
            print("Selected index $index");
            setState(() {
              currentTabIndex = index;
            });
          },
          selectedIndex: currentTabIndex,
          tabs: [
            'Songs',
            'Playlists',
            'Authors',
          ],
        ),
        const SizedBox(height: 16,),
        Expanded(
          child: currentTab,
        )
      ],
    );
  }
}
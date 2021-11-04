import 'package:flutter/material.dart';
import 'package:sound_bubble/models/album.dart';
import 'package:sound_bubble/models/playlist.dart';
import 'package:sound_bubble/widgets/components/gradient_button.dart';
import 'package:sound_bubble/widgets/components/search_bar.dart';
import 'package:sound_bubble/widgets/components/track_queue_carousel.dart';

import '../../theme.dart';

class PlaylistsTab extends StatelessWidget {
  const PlaylistsTab({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: [
          Row(
            children: [
              Expanded(
                child: SearchBar(
                  hintText: "Search for songs or for people",
                ),
              ),
              // const SizedBox(width: 8,),
              // SizedBox(
              //   width: 180,
              //   child: GradientButton(
              //     gradient: AppTheme.buttonGradient,
              //     icon: Icon(Icons.add),
              //     title: "Create Playlist",
              //     onPressed: () {
              //       print("Create playlist");
              //     },
              //   ),
              // ),
            ],
          ),
          const SizedBox(height: 16,),
          TrackQueueCarousel(
            trackQueues: [
              Playlist(
                coverURL: 'https://via.placeholder.com/400',
                title: 'Avalon',
                creationDate: DateTime.now(),
              ),
              Album(
                coverURL: 'https://via.placeholder.com/400',
                title: 'LIL CHILL',
                creationDate: DateTime.now(),
              )
            ]
          ),
        ],
      ),
    );
  }
}
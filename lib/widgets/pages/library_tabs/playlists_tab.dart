import 'package:flutter/material.dart';
import 'package:sound_bubble/models/album.dart';
import 'package:sound_bubble/models/artist.dart';
import 'package:sound_bubble/models/playlist.dart';
import 'package:sound_bubble/widgets/components/artist_carousel.dart';
import 'package:sound_bubble/widgets/components/gradient_button.dart';
import 'package:sound_bubble/widgets/components/playlist_gallery.dart';
import 'package:sound_bubble/widgets/components/search_bar.dart';
import 'package:sound_bubble/widgets/components/track_queue_carousel.dart';

import '../../theme.dart';

class PlaylistsTab extends StatelessWidget {
  const PlaylistsTab({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        child: ListView(
          children: [
            Headline(text: 'Playlists'),
            Row(
              children: [
                Expanded(
                  child: TrackQueueCarousel(
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
                      ),
                    ],
                  ),
                )
              ],
            ),
            
            Headline(text: 'Songs'),
            Headline(text: 'Authors'),
            ArtistCarousel(
              artists: [
                Artist(
                  avatarURL: 'https://via.placeholder.com/260',
                  displayName: 'GONE.FLUDD',
                ),
                Artist(
                  avatarURL: 'https://via.placeholder.com/260',
                  displayName: 'Imanbek',
                ),
                Artist(
                  avatarURL: 'https://via.placeholder.com/260',
                  displayName: 'Fetty Wap',
                ),
              ]
            ),
          ],
        ),
      ),
    );
  }
}

class Headline extends StatelessWidget {
  final String text;

  const Headline({ required this.text, Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Text(text, style: Theme.of(context).textTheme.headline3),
    );
  }
}
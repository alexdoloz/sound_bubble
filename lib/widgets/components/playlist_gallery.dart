import 'package:flutter/material.dart';
import 'package:sound_bubble/models/playlist.dart';
import 'package:sound_bubble/widgets/components/playlist_widget.dart';

/// Widget for user playlists in Songs tab
class PlaylistGallery extends StatelessWidget {
  final List<Playlist> playlists;
  const PlaylistGallery({ 
    Key? key,
    required this.playlists,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 204,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: playlists.expand(
          (playlist) => [
            PlaylistWidget(
              cover: Image.network(playlist.coverURL!), // TODO: Обработка null
              nameBackgroundColor: playlist.colors.first, // TODO: Уточнить
              name: playlist.title,
            ),
            const SizedBox(width: 16)
          ]
        ).toList(),
      ),
    );
  }
}
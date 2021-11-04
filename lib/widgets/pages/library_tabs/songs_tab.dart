import 'package:flutter/material.dart';
import 'package:sound_bubble/models/playlist.dart';
import 'package:sound_bubble/widgets/components/playlist_gallery.dart';
import 'package:sound_bubble/widgets/components/search_bar.dart';
import 'package:sound_bubble/widgets/components/track_item.dart';
import 'package:sound_bubble/widgets/components/track_item_button.dart';

class SongsTab extends StatelessWidget {
  const SongsTab({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: [
          PlaylistGallery(
            playlists: [
              Playlist(
                colors: [Colors.blue],
                coverURL: "https://via.placeholder.com/400",
                title: "Avalon",
                tracks: [],
              ),
              Playlist(
                colors: [Colors.orange],
                coverURL: "https://via.placeholder.com/400",
                title: "LIL CHILL",
                tracks: [],
              )
            ],
          ),
          const SizedBox(height: 16,),
          SearchBar(
            hintText: "Search for songs",
          ),
          const SizedBox(height: 16,),
          TrackItem(
            thumbnail: Image.network("https://via.placeholder.com/90"),
            title: "CHILL",
            subtitle: "Gone.Fludd",
            actionTypes: const [TrackItemButtonType.add, TrackItemButtonType.more],
          ),
          const SizedBox(height: 8,),
          TrackItem(
            thumbnail: Image.network("https://via.placeholder.com/90"),
            title: "Leck",
            subtitle: "MORGENSHTERN & Imanbek & Fetty Wap & KDDK",
            actionTypes: const [TrackItemButtonType.add, TrackItemButtonType.more],
          ),
          const SizedBox(height: 8,),
          TrackItem(
            thumbnail: Image.network("https://via.placeholder.com/90"),
            title: "DINERO",
            subtitle: "MORGENSHTERN",
            actionTypes: const [TrackItemButtonType.add, TrackItemButtonType.more],
          ),
          const SizedBox(height: 8,),
          TrackItem(
            thumbnail: Image.network("https://via.placeholder.com/90"),
            title: "Cadillac",
            subtitle: "MORGENSHTERN & Элджей",
            actionTypes: const [TrackItemButtonType.add, TrackItemButtonType.more],
          ),
          const SizedBox(height: 8,),
          TrackItem(
            thumbnail: Image.network("https://via.placeholder.com/90"),
            title: "On My Own",
            subtitle: "Jaden & Kid Cudi",
            actionTypes: const [TrackItemButtonType.add, TrackItemButtonType.more],
          ),
        ],
      ),
    );
  }
}
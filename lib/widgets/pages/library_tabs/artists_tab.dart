import 'package:flutter/material.dart';
import 'package:sound_bubble/models/artist.dart';
import 'package:sound_bubble/widgets/components/artist_carousel.dart';
import 'package:sound_bubble/widgets/components/search_bar.dart';

class ArtistsTab extends StatelessWidget {
  const ArtistsTab({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: [
          SearchBar(
            hintText: "Search for songs or for people",
          ),
          const SizedBox(height: 16,),
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
    );
  }
}
import 'package:flutter/material.dart';
import 'package:sound_bubble/models/artist.dart';

class ArtistCarousel extends StatelessWidget {
  final List<Artist> artists;
  
  const ArtistCarousel({ 
    Key? key,
    required this.artists,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      alignment: WrapAlignment.start,
      children: artists.map((artist) => ArtistCarouselItem(artist: artist)).toList(),
    );
  }
}

class ArtistCarouselItem extends StatelessWidget {
  final Artist artist;

  const ArtistCarouselItem({ 
    Key? key, 
    required this.artist
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          child: Container(
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              shape: BoxShape.circle
            ),
            child: Image.network(artist.avatarURL!, width: 130, height: 130,), // TODO: Handle null
          ),
        ),
        const SizedBox(height: 8,),
        Text(artist.displayName),
      ],
    );
  }
}
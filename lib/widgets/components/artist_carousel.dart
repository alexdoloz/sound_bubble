import 'package:flutter/material.dart';
import 'package:sound_bubble/models/artist.dart';
import 'package:sound_bubble/utils/widgets+intersperse.dart';

class ArtistCarousel extends StatelessWidget {
  final List<Artist> artists;
  
  const ArtistCarousel({ 
    Key? key,
    required this.artists,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: unnecessary_cast
    final artistCarouselItems = artists
      .map((artist) => ArtistCarouselItem(artist: artist))
      .toList() as List<Widget>;
    return SizedBox(
      height: 200,
      child: ListView(
        physics: const AlwaysScrollableScrollPhysics(),
        scrollDirection: Axis.horizontal,
        children: artistCarouselItems.interspersedWith(const SizedBox(width: 8,)),
      ),
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
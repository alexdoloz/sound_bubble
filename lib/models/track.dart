import 'dart:ui';
import 'artist.dart';

class Track {
  List<Artist> authors;
  List<Color> colors;
  Uri coverURL;
  DateTime releaseDate;
  Uri trackURL;

  Track({
    required this.authors,
    required this.colors,
    required this.coverURL,
    required this.releaseDate,
    required this.trackURL,
  });
}
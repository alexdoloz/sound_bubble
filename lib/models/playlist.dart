import 'dart:ui';
import 'package:sound_bubble/models/track.dart';
import 'track_queue.dart';

class Playlist extends TrackQueue {
  @override
  get queueType => 'album';

  Playlist({
    List<Track> tracks = const [],
    List<Color> colors = const [],
    DateTime? creationDate,
    String? coverURL,
    int numberOfListeners = 0,
    String title = "",
  }) : super(
    colors: colors,
    coverURL: coverURL,
    creationDate: creationDate,
    numberOfListeners: numberOfListeners,
    title: title,
    tracks: tracks,
  );
}
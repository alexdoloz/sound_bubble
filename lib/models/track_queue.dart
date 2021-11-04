import 'dart:ui';
import 'track.dart';

class TrackQueue {
  List<Track> tracks = [];
  List<Color> colors = [];
  DateTime? creationDate;
  String? coverURL;
  int numberOfListeners = 0;
  String title = "";
  get queueType => '';

  TrackQueue({
    this.tracks = const [],
    this.colors = const [],
    this.creationDate,
    this.coverURL,
    this.numberOfListeners = 0,
    this.title = "",
  });
}
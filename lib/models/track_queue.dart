import 'dart:ui';
import 'track.dart';

class TrackQueue {
  List<Track> tracks = [];
  // List<Artist> 
  List<Color> colors = [];
  DateTime? creationDate;
  Uri? coverURL;
  int numberOfListeners = 0;
  String title = "";
}
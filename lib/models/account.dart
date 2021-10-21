import 'dart:ui';
import 'track.dart';
import 'track_queue.dart';

class Account {
  List<Color> colors = [];
  String displayName = "";
  bool isVerified = false;
  Track? lastPlayedTrack;
  TrackQueue? lastTrackQueue;
  Uri? avatarURL;

  // TODO: Chats, friends, etc.
}
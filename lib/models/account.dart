import 'dart:ui';
import 'track.dart';
import 'track_queue.dart';

class Account {
  List<Color> colors = [];
  String displayName = "";
  bool isVerified = false;
  Track? lastPlayedTrack;
  TrackQueue? lastTrackQueue;
  String? avatarURL;

  Account({
    this.colors = const [],
    this.displayName = "",
    this.isVerified = false,
    this.lastPlayedTrack,
    this.lastTrackQueue,
    this.avatarURL,
  });

  // TODO: Chats, friends, etc.
}
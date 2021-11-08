import 'dart:ui';
import 'package:sound_bubble/models/track_queue.dart';
import 'account.dart';
import 'track.dart';

class Artist extends Account {
  List<Track> authoredTracks = [];

  Artist({
    List<Color> colors = const [],
    String displayName = "",
    bool isVerified = false,
    Track? lastPlayedTrack,
    TrackQueue? lastTrackQueue,
    String? avatarURL,
  }) : super(
    avatarURL: avatarURL,
    colors: colors,
    displayName: displayName,
    isVerified: isVerified,
    lastPlayedTrack: lastPlayedTrack,
    lastTrackQueue: lastTrackQueue,
  );
}
import 'package:flutter/material.dart';
import 'package:sound_bubble/models/track_queue.dart';
import 'package:sound_bubble/utils/widgets+intersperse.dart';

class TrackQueueCarousel extends StatelessWidget {
  final List<TrackQueue> trackQueues;
  const TrackQueueCarousel({ 
    Key? key,
    this.trackQueues = const [],
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Widget> items = trackQueues.map((tq) => TrackQueueItem(trackQueue: tq)).toList(); 
    return SizedBox(
      width: 600,
      height: 400,
      child: ListView(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        children: items.interspersedWith(const SizedBox(width: 8,)),
      ),
    );
  }
}

class TrackQueueItem extends StatelessWidget {
  final TrackQueue trackQueue;
  const TrackQueueItem({ 
    Key? key,
    required this.trackQueue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10)
            ),
            child: Image.network(trackQueue.coverURL!, width: 130, height: 130),
          ),
          Text(trackQueue.title),
          Text('${trackQueue.creationDate?.year}'), // TODO: Handle null
        ],
      ),
    );
  }
}